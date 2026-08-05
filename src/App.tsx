import { type FormEvent, useEffect, useMemo, useState } from 'react';
import type { Session } from '@supabase/supabase-js';
import * as api from './api';
import { configured, supabase } from './supabase';
import { isAnswerCorrect } from './learning';
import type { DeletionStatus, Direction, LearningStats, Mode, QuestionMode, QuizAnswer, QuizAttempt, QuizResult, Term, View } from './types';

const viewNames: Record<View, string> = { dashboard: 'Tổng quan', notebook: 'Sổ tay', flashcard: 'Flashcard', study: 'Học tập', quiz: 'Làm bài' };
const modeNames: Record<Mode, string> = { flashcard: 'Flashcard', study: 'Học tập', quiz: 'Làm bài' };
const directionNames: Record<Direction, string> = { jp_to_vi: 'Nhật → Việt', vi_to_jp: 'Việt → Nhật' };
const questionModeNames: Record<QuestionMode, string> = { multiple_choice: 'Trắc nghiệm', written: 'Tự luận', mixed: 'Hỗn hợp' };

function messageOf(error: unknown) {
  return error instanceof Error ? error.message : 'Có lỗi bất ngờ. Hãy thử lại.';
}

function shuffle<T>(items: T[]) {
  const copy = [...items];
  for (let index = copy.length - 1; index > 0; index -= 1) {
    const target = Math.floor(Math.random() * (index + 1));
    [copy[index], copy[target]] = [copy[target], copy[index]];
  }
  return copy;
}

function promptFor(term: Term, direction: Direction) {
  return direction === 'jp_to_vi' ? term.japanese : term.vietnamese;
}

function expectedFor(term: Term, direction: Direction) {
  return direction === 'jp_to_vi' ? term.vietnamese : term.japanese;
}

function selectedTerms(terms: Term[], source: 'all' | 'study' | 'quiz') {
  return terms.filter((term) => !term.archivedAt && (source === 'all' || term.modes.includes(source)));
}

function countFor(value: string, available: number) {
  return value === 'all' ? available : Math.min(Number(value), available);
}

export default function App() {
  const [session, setSession] = useState<Session | null>(null);
  const [terms, setTerms] = useState<Term[]>([]);
  const [stats, setStats] = useState<LearningStats>({ correct: 0, wrong: 0 });
  const [view, setView] = useState<View>('dashboard');
  const [loading, setLoading] = useState(true);
  const [recoveringPassword, setRecoveringPassword] = useState(false);
  const [deletion, setDeletion] = useState<DeletionStatus | null>(null);
  const [showAccount, setShowAccount] = useState(false);
  const [notice, setNotice] = useState<{ kind: 'error' | 'success'; text: string } | null>(null);

  useEffect(() => {
    if (!supabase) { setLoading(false); return; }
    let alive = true;
    void supabase.auth.getSession().then(({ data }) => {
      if (alive) { setSession(data.session); setLoading(false); }
    });
    const { data: listener } = supabase.auth.onAuthStateChange((event, nextSession) => {
      if (!alive) return;
      if (event === 'PASSWORD_RECOVERY') setRecoveringPassword(true);
      setSession(nextSession);
      if (!nextSession) { setTerms([]); setStats({ correct: 0, wrong: 0 }); }
    });
    return () => { alive = false; listener.subscription.unsubscribe(); };
  }, []);

  const reload = async () => {
    try {
      const [nextTerms, nextStats] = await Promise.all([api.fetchTerms(), api.fetchStats()]);
      setTerms(nextTerms); setStats(nextStats);
    } catch (error) { setNotice({ kind: 'error', text: messageOf(error) }); }
  };

  useEffect(() => {
    if (!session) return;
    void reload();
    void api.getDeletionStatus().then(setDeletion).catch((error) => setNotice({ kind: 'error', text: messageOf(error) }));
  }, [session?.user.id]);

  const updateTerm = async (id: string, patch: Pick<Term, 'modes'> | Pick<Term, 'archivedAt'>) => {
    try {
      const next = await api.updateTerm(id, patch);
      setTerms((current) => current.map((term) => term.id === id ? next : term));
    } catch (error) { setNotice({ kind: 'error', text: messageOf(error) }); throw error; }
  };

  const createTerm = async (japanese: string, vietnamese: string) => {
    if (!session) return;
    try {
      const next = await api.createTerm(session.user.id, japanese, vietnamese);
      setTerms((current) => [next, ...current]);
      setNotice({ kind: 'success', text: 'Đã thêm từ mới vào sổ tay.' });
    } catch (error) {
      const known = error as { code?: string };
      setNotice({ kind: 'error', text: known.code === '23505' ? 'Cặp từ này đã có trong sổ tay.' : messageOf(error) });
      throw error;
    }
  };

  const recordOutcome = async (outcome: { termId: string; mode: Mode; correct: boolean | null; rating?: 'remembered' | 'needs_review' }) => {
    if (!session) return;
    try {
      await api.recordOutcomes(session.user.id, [outcome]);
      if (outcome.correct !== null) setStats((current) => ({ ...current, [outcome.correct ? 'correct' : 'wrong']: current[outcome.correct ? 'correct' : 'wrong'] + 1 }));
    } catch (error) { setNotice({ kind: 'error', text: `Không thể lưu kết quả: ${messageOf(error)}` }); }
  };

  const recordQuizOutcomes = async (answers: QuizAnswer[]) => {
    if (!session) return;
    try {
      await api.recordOutcomes(session.user.id, answers.map((answer) => ({ termId: answer.termId, mode: 'quiz', correct: answer.correct ?? false })));
      await reload();
    } catch (error) { setNotice({ kind: 'error', text: `Quiz đã nộp nhưng chưa ghi được lịch sử: ${messageOf(error)}` }); }
  };

  if (!configured) return <ConfigurationRequired />;
  if (loading) return <main><section className="empty">Đang mở sổ tay…</section></main>;
  if (!session) return <AuthGate />;
  if (recoveringPassword) return <PasswordRecovery onDone={() => setRecoveringPassword(false)} />;
  if (deletion?.deletionRequestedAt || deletion?.purgedAt) return <DeletionRecovery status={deletion} onRestored={async () => { await api.restoreAccount(); setDeletion(null); await reload(); }} />;

  const activeTerms = terms.filter((term) => !term.archivedAt);
  return <main>
    <header>
      <div><p className="eyebrow">SỔ TAY CÁ NHÂN</p><h1>JNOTE <span>日本語</span></h1></div>
      <div className="account"><p className="online">● Đã đồng bộ Supabase</p><small>{session.user.email}</small><div><button onClick={() => setShowAccount(!showAccount)}>Tài khoản</button><button onClick={() => void supabase?.auth.signOut()}>Đăng xuất</button></div></div>
    </header>
    <nav>{(Object.keys(viewNames) as View[]).map((item) => <button type="button" className={view === item ? 'active' : ''} onClick={() => setView(item)} key={item}>{viewNames[item]}</button>)}</nav>
    {notice && <p className={`notice ${notice.kind}`} role="status">{notice.text}<button type="button" onClick={() => setNotice(null)}>Đóng</button></p>}
    {showAccount && <AccountPanel session={session} terms={terms} onClose={() => setShowAccount(false)} onDeleted={(deadline) => { setDeletion({ deletionRequestedAt: new Date().toISOString(), restoreUntil: deadline, purgedAt: null }); void supabase?.auth.signOut(); }} />}
    {view === 'dashboard' && <Dashboard terms={activeTerms} stats={stats} go={setView} />}
    {view === 'notebook' && <Notebook terms={terms} onCreate={createTerm} onUpdate={updateTerm} />}
    {view === 'flashcard' && <Flashcards terms={activeTerms} onRate={recordOutcome} />}
    {view === 'study' && <Study terms={activeTerms} onOutcome={recordOutcome} />}
    {view === 'quiz' && <Quiz terms={activeTerms} onQuizComplete={recordQuizOutcomes} />}
  </main>;
}

function PasswordRecovery({ onDone }: { onDone: () => void }) {
  const [password, setPassword] = useState(''); const [confirm, setConfirm] = useState(''); const [status, setStatus] = useState(''); const [busy, setBusy] = useState(false);
  const submit = async (event: FormEvent) => {
    event.preventDefault();
    if (!supabase) return;
    if (password !== confirm) { setStatus('Hai mật khẩu chưa khớp.'); return; }
    setBusy(true); const { error } = await supabase.auth.updateUser({ password }); setBusy(false);
    if (error) { setStatus(error.message); return; }
    setStatus('Đã cập nhật mật khẩu. Bạn có thể vào sổ tay.');
  };
  return <main><section className="auth-card"><p className="eyebrow">ĐẶT LẠI MẬT KHẨU</p><h2>Chọn mật khẩu mới</h2><form onSubmit={submit}><label>Mật khẩu mới<input type="password" value={password} onChange={(event) => setPassword(event.target.value)} minLength={6} required autoComplete="new-password" /></label><label>Nhập lại mật khẩu<input type="password" value={confirm} onChange={(event) => setConfirm(event.target.value)} minLength={6} required autoComplete="new-password" /></label><button className="primary" disabled={busy}>{busy ? 'Đang lưu…' : 'Lưu mật khẩu mới'}</button></form>{status && <p className="notice success">{status}</p>}<button type="button" onClick={onDone}>Vào sổ tay</button></section></main>;
}

function ConfigurationRequired() {
  return <main><section className="empty"><p className="eyebrow">CẦN CẤU HÌNH</p><h2>JNOTE cần kết nối Supabase</h2><p>Thêm URL và Publishable key của Supabase vào <code>.env.local</code>, dựa theo <code>.env.example</code>, rồi khởi động lại ứng dụng.</p></section></main>;
}

function AuthGate() {
  const [kind, setKind] = useState<'signin' | 'signup'>('signin');
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [status, setStatus] = useState('');
  const [busy, setBusy] = useState(false);
  const submit = async (event: FormEvent) => {
    event.preventDefault(); if (!supabase) return;
    setBusy(true); setStatus('');
    const response = kind === 'signin'
      ? await supabase.auth.signInWithPassword({ email, password })
      : await supabase.auth.signUp({ email, password, options: { emailRedirectTo: window.location.origin } });
    setBusy(false);
    setStatus(response.error ? response.error.message : kind === 'signup' ? 'Đã tạo tài khoản. Hãy xác minh email trước khi đăng nhập.' : 'Đăng nhập thành công.');
  };
  const resetPassword = async () => {
    if (!supabase || !email) { setStatus('Hãy nhập email trước.'); return; }
    setBusy(true);
    const { error } = await supabase.auth.resetPasswordForEmail(email, { redirectTo: window.location.origin });
    setBusy(false); setStatus(error ? error.message : 'Đã gửi email đặt lại mật khẩu.');
  };
  return <main><section className="auth-card"><p className="eyebrow">JNOTE · 日本語</p><h2>{kind === 'signin' ? 'Đăng nhập sổ tay' : 'Tạo sổ tay cá nhân'}</h2><p>Dữ liệu từ vựng chỉ hiển thị trong tài khoản của bạn.</p>
    <form onSubmit={submit}><label>Email<input type="email" value={email} onChange={(event) => setEmail(event.target.value)} required autoComplete="email" /></label><label>Mật khẩu<input type="password" value={password} onChange={(event) => setPassword(event.target.value)} required minLength={6} autoComplete={kind === 'signin' ? 'current-password' : 'new-password'} /></label><button className="primary" disabled={busy}>{busy ? 'Đang xử lý…' : kind === 'signin' ? 'Đăng nhập' : 'Tạo tài khoản'}</button></form>
    {status && <p className="notice success">{status}</p>}<div className="auth-actions"><button type="button" onClick={() => setKind(kind === 'signin' ? 'signup' : 'signin')}>{kind === 'signin' ? 'Tạo tài khoản mới' : 'Đã có tài khoản'}</button><button type="button" onClick={() => void resetPassword()} disabled={busy}>Quên mật khẩu</button></div>
  </section></main>;
}

function csvCell(value: string | number | boolean | null) {
  const text = value === null ? '' : String(value);
  return `"${text.replaceAll('"', '""')}"`;
}

function AccountPanel({ session, terms, onClose, onDeleted }: { session: Session; terms: Term[]; onClose: () => void; onDeleted: (deadline: string) => void }) {
  const [password, setPassword] = useState(''); const [status, setStatus] = useState(''); const [busy, setBusy] = useState(false);
  const exportCsv = async () => {
    setBusy(true); setStatus('');
    try {
      const outcomes = await api.fetchExportRows();
      const rows: Array<Array<string | number | boolean | null>> = [
        ['record_type', 'term_id', 'japanese', 'vietnamese', 'modes', 'archived_at', 'learning_mode', 'correct', 'rating', 'recorded_at'],
        ...terms.map((term) => ['term', term.id, term.japanese, term.vietnamese, term.modes.join('|'), term.archivedAt, null, null, null, term.createdAt]),
        ...outcomes.map((outcome) => ['outcome', outcome.term_id, null, null, null, null, outcome.mode, outcome.correct, outcome.rating, outcome.created_at]),
      ];
      const blob = new Blob([`\uFEFF${rows.map((row) => row.map(csvCell).join(',')).join('\n')}`], { type: 'text/csv;charset=utf-8' });
      const href = URL.createObjectURL(blob); const link = document.createElement('a'); link.href = href; link.download = `jnote-export-${new Date().toISOString().slice(0, 10)}.csv`; link.click(); URL.revokeObjectURL(href);
      setStatus('Đã tải tệp CSV chỉ chứa dữ liệu của tài khoản này.');
    } catch (error) { setStatus(messageOf(error)); } finally { setBusy(false); }
  };
  const deleteAccount = async (event: FormEvent) => {
    event.preventDefault();
    if (!supabase || !session.user.email) return;
    setBusy(true); setStatus('');
    const signedIn = await supabase.auth.signInWithPassword({ email: session.user.email, password });
    if (signedIn.error) { setBusy(false); setStatus('Không thể xác nhận mật khẩu: ' + signedIn.error.message); return; }
    try { const deadline = await api.requestDeletion(); setStatus(`Đã ẩn dữ liệu. Bạn có thể khôi phục đến ${new Date(deadline).toLocaleString('vi-VN')}.`); onDeleted(deadline); } catch (error) { setStatus(messageOf(error)); } finally { setBusy(false); }
  };
  return <section className="paper account-panel"><div className="toolbar"><h2>Dữ liệu & tài khoản</h2><button type="button" onClick={onClose}>Đóng</button></div><p>Xuất CSV trước khi xóa nếu bạn muốn giữ bản sao. Dữ liệu trong sổ tay sẽ bị ẩn ngay và tự xóa sau 30 ngày nếu không khôi phục.</p><div className="actions"><button type="button" onClick={() => void exportCsv()} disabled={busy}>Xuất CSV</button></div><form className="danger-zone" onSubmit={deleteAccount}><h3>Yêu cầu xóa dữ liệu</h3><p>Nhập mật khẩu để xác nhận lại danh tính. Bạn sẽ được đăng xuất sau khi gửi yêu cầu.</p><input type="password" value={password} onChange={(event) => setPassword(event.target.value)} minLength={6} required autoComplete="current-password" placeholder="Mật khẩu hiện tại" /><button className="danger" disabled={busy}>{busy ? 'Đang xử lý…' : 'Xóa dữ liệu và đăng xuất'}</button></form>{status && <p className="notice success">{status}</p>}</section>;
}

function DeletionRecovery({ status, onRestored }: { status: DeletionStatus; onRestored: () => Promise<void> }) {
  const [message, setMessage] = useState(''); const [busy, setBusy] = useState(false);
  if (status.purgedAt) return <main><section className="auth-card"><p className="eyebrow">DỮ LIỆU ĐÃ XÓA</p><h2>Thời hạn khôi phục đã kết thúc</h2><p>Dữ liệu học đã được xóa khỏi JNOTE. Hãy liên hệ chủ dự án nếu bạn cần xóa luôn tài khoản xác thực.</p><button onClick={() => void supabase?.auth.signOut()}>Đăng xuất</button></section></main>;
  const restore = async () => { setBusy(true); try { await onRestored(); } catch (error) { setMessage(messageOf(error)); } finally { setBusy(false); } };
  return <main><section className="auth-card"><p className="eyebrow">TÀI KHOẢN ĐANG CHỜ XÓA</p><h2>Dữ liệu đã được ẩn</h2><p>Bạn có thể khôi phục trước {status.restoreUntil ? new Date(status.restoreUntil).toLocaleString('vi-VN') : 'khi hết hạn'}.</p><button className="primary" disabled={busy} onClick={() => void restore()}>{busy ? 'Đang khôi phục…' : 'Khôi phục dữ liệu'}</button><button onClick={() => void supabase?.auth.signOut()}>Đăng xuất</button>{message && <p className="notice error">{message}</p>}</section></main>;
}

function Dashboard({ terms, stats, go }: { terms: Term[]; stats: LearningStats; go: (view: View) => void }) {
  const total = stats.correct + stats.wrong;
  const rate = total ? Math.round((stats.correct / total) * 100) : 0;
  return <section className="hero"><div><p className="eyebrow">HÔM NAY</p><h2>Học từng từ, nhớ thật lâu.</h2><p>Ghi từ mới như trên giấy, đánh dấu cách học và luyện tập ngay khi sẵn sàng.</p><div className="actions"><button className="primary" onClick={() => go('notebook')}>Thêm từ mới</button><button onClick={() => go('study')}>Bắt đầu học</button></div></div><aside><b>{terms.length}</b><span>Từ đang dùng</span><b>{rate}%</b><span>Độ chính xác</span><b>{stats.correct}</b><span>Lần đúng</span><b>{stats.wrong}</b><span>Cần ôn lại</span></aside></section>;
}

function Notebook({ terms, onCreate, onUpdate }: { terms: Term[]; onCreate: (japanese: string, vietnamese: string) => Promise<void>; onUpdate: (id: string, patch: Pick<Term, 'modes'> | Pick<Term, 'archivedAt'>) => Promise<void> }) {
  const [japanese, setJapanese] = useState(''); const [vietnamese, setVietnamese] = useState('');
  const [query, setQuery] = useState(''); const [filter, setFilter] = useState<'all' | Mode>('all'); const [showArchived, setShowArchived] = useState(false); const [saving, setSaving] = useState(false);
  const visible = terms.filter((term) => Boolean(term.archivedAt) === showArchived && (filter === 'all' || term.modes.includes(filter)) && `${term.japanese} ${term.vietnamese}`.toLocaleLowerCase().includes(query.toLocaleLowerCase()));
  const add = async (event: FormEvent) => {
    event.preventDefault(); const jp = japanese.trim(); const vi = vietnamese.trim();
    if (!jp || !vi) return;
    setSaving(true); try { await onCreate(jp, vi); setJapanese(''); setVietnamese(''); } catch { /* displayed by the app */ } finally { setSaving(false); }
  };
  const toggle = async (term: Term, mode: Mode) => { const modes = term.modes.includes(mode) ? term.modes.filter((item) => item !== mode) : [...term.modes, mode]; await onUpdate(term.id, { modes }); };
  return <section className="paper"><div className="toolbar"><h2>Sổ tay từ vựng</h2><input aria-label="Tìm từ" placeholder="Tìm Nhật hoặc Việt…" value={query} onChange={(event) => setQuery(event.target.value)} /><select aria-label="Lọc nhãn" value={filter} onChange={(event) => setFilter(event.target.value as 'all' | Mode)}><option value="all">Mọi nhãn</option>{(Object.keys(modeNames) as Mode[]).map((mode) => <option key={mode} value={mode}>{modeNames[mode]}</option>)}</select><button type="button" onClick={() => setShowArchived(!showArchived)}>{showArchived ? 'Xem từ đang dùng' : 'Xem lưu trữ'}</button></div>
    {!showArchived && <form className="entry" onSubmit={add}><input value={japanese} maxLength={200} onChange={(event) => setJapanese(event.target.value)} placeholder="Tiếng Nhật" aria-label="Tiếng Nhật" required /><input value={vietnamese} maxLength={500} onChange={(event) => setVietnamese(event.target.value)} placeholder="Nghĩa tiếng Việt" aria-label="Nghĩa tiếng Việt" required /><button className="primary" disabled={saving}>{saving ? 'Đang thêm…' : 'Thêm từ'}</button></form>}
    <div className="table"><div className="row head"><span>TIẾNG NHẬT</span><span>NGHĨA TIẾNG VIỆT</span><span>CHẾ ĐỘ HỌC</span><span /></div>{visible.slice(0, 50).map((term) => <div className="row" key={term.id}><b>{term.japanese}</b><span>{term.vietnamese}</span><div className="tags">{!showArchived && (Object.keys(modeNames) as Mode[]).map((mode) => <button type="button" aria-pressed={term.modes.includes(mode)} className={term.modes.includes(mode) ? 'tag on' : 'tag'} onClick={() => void toggle(term, mode)} key={mode}>{modeNames[mode]}</button>)}</div><button type="button" className="archive" onClick={() => void onUpdate(term.id, { archivedAt: term.archivedAt ? null : new Date().toISOString() })}>{term.archivedAt ? 'Khôi phục' : 'Lưu trữ'}</button></div>)}</div>{!visible.length && <p className="empty">Chưa có từ phù hợp.</p>}<p className="table-note">Hiển thị tối đa 50 dòng; tìm kiếm để thu hẹp danh sách.</p>
  </section>;
}

function Flashcards({ terms, onRate }: { terms: Term[]; onRate: (outcome: { termId: string; mode: Mode; correct: boolean | null; rating?: 'remembered' | 'needs_review' }) => Promise<void> }) {
  const pool = terms.filter((term) => term.modes.includes('flashcard')); const [index, setIndex] = useState(0); const [flipped, setFlipped] = useState(false); const [saving, setSaving] = useState(false);
  const term = pool[index % Math.max(pool.length, 1)];
  if (!term) return <section className="empty">Hãy gắn nhãn Flashcard cho ít nhất một từ trước khi học.</section>;
  const rate = async (remembered: boolean) => { setSaving(true); await onRate({ termId: term.id, mode: 'flashcard', correct: remembered, rating: remembered ? 'remembered' : 'needs_review' }); setSaving(false); setIndex((current) => current + 1); setFlipped(false); };
  return <section className="session"><p className="eyebrow">FLASHCARD · {index % pool.length + 1}/{pool.length}</p><button type="button" className="card" onClick={() => setFlipped(!flipped)} onKeyDown={(event) => { if (event.key === ' ' || event.key === 'Enter') { event.preventDefault(); setFlipped(!flipped); } }}><span>{flipped ? term.vietnamese : term.japanese}</span><small>{flipped ? 'Nhấn để xem tiếng Nhật' : 'Nhấn Space/Enter để lật'}</small></button>{flipped && <div className="actions"><button className="primary" disabled={saving} onClick={() => void rate(true)}>Đã nhớ</button><button disabled={saving} onClick={() => void rate(false)}>Cần ôn</button></div>}</section>;
}

function Study({ terms, onOutcome }: { terms: Term[]; onOutcome: (outcome: { termId: string; mode: Mode; correct: boolean }) => Promise<void> }) {
  const [source, setSource] = useState<'all' | 'study'>('study'); const [questionMode, setQuestionMode] = useState<QuestionMode>('mixed'); const [direction, setDirection] = useState<Direction>('jp_to_vi'); const [count, setCount] = useState('10');
  const [deck, setDeck] = useState<Term[] | null>(null); const [index, setIndex] = useState(0); const [answer, setAnswer] = useState(''); const [feedback, setFeedback] = useState<boolean | null>(null);
  const pool = selectedTerms(terms, source); const term = deck?.[index]; const expected = term ? expectedFor(term, direction) : '';
  const configuredType: Exclude<QuestionMode, 'mixed'> = questionMode === 'mixed' ? (index % 2 ? 'written' : 'multiple_choice') : questionMode;
  const options = useMemo(() => term ? shuffle(Array.from(new Set([expected, ...terms.filter((item) => item.id !== term.id).map((item) => expectedFor(item, direction))]))).slice(0, 4) : [], [term, expected, terms, direction]);
  const questionType = configuredType === 'multiple_choice' && options.length < 4 ? 'written' : configuredType;
  const begin = () => { setDeck(shuffle(pool).slice(0, countFor(count, pool.length))); setIndex(0); setAnswer(''); setFeedback(null); };
  const evaluate = (value: string) => { if (!term || feedback !== null) return; const correct = isAnswerCorrect(value, expected); setFeedback(correct); void onOutcome({ termId: term.id, mode: 'study', correct }); };
  const next = () => { setIndex((current) => current + 1); setAnswer(''); setFeedback(null); };
  if (!deck) return <SessionSetup title="Học tập" subtitle="Làm xong mỗi câu sẽ có kết quả ngay." source={source} setSource={setSource} questionMode={questionMode} setQuestionMode={setQuestionMode} direction={direction} setDirection={setDirection} count={count} setCount={setCount} available={pool.length} onStart={begin} />;
  if (!term) return <section className="session"><h2>Hoàn thành học tập</h2><p>Bạn đã làm hết {deck.length} câu.</p><button className="primary" onClick={() => setDeck(null)}>Tạo lượt mới</button></section>;
  return <section className="session"><p className="eyebrow">HỌC TẬP · CÂU {index + 1}/{deck.length} · {directionNames[direction]}</p><h2>{promptFor(term, direction)}</h2><p>{questionType === 'multiple_choice' ? 'Chọn đáp án đúng.' : 'Tự nhập đáp án.'}</p>{questionType === 'multiple_choice' ? <div className="choices">{options.map((option) => <button type="button" className={feedback !== null && option === expected ? 'correct' : ''} disabled={feedback !== null} onClick={() => evaluate(option)} key={option}>{option}</button>)}</div> : <form onSubmit={(event) => { event.preventDefault(); evaluate(answer); }}><input autoFocus value={answer} disabled={feedback !== null} onChange={(event) => setAnswer(event.target.value)} placeholder="Nhập đáp án" /><button disabled={feedback !== null}>Kiểm tra</button></form>}{feedback !== null && <div className={feedback ? 'feedback good' : 'feedback bad'}>{feedback ? 'Đúng rồi!' : 'Chưa đúng.'} Đáp án: <b>{expected}</b><button type="button" onClick={next}>Câu tiếp</button></div>}</section>;
}

function SessionSetup(props: { title: string; subtitle: string; source: 'all' | 'study'; setSource: (source: 'all' | 'study') => void; questionMode: QuestionMode; setQuestionMode: (mode: QuestionMode) => void; direction: Direction; setDirection: (direction: Direction) => void; count: string; setCount: (count: string) => void; available: number; onStart: () => void }) {
  return <section className="session"><h2>{props.title}</h2><p>{props.subtitle}</p><div className="config-grid"><label>Nguồn từ<select value={props.source} onChange={(event) => props.setSource(event.target.value as 'all' | 'study')}><option value="study">Chỉ từ đánh dấu Học tập</option><option value="all">Tất cả từ đang dùng</option></select></label><label>Dạng câu<select value={props.questionMode} onChange={(event) => props.setQuestionMode(event.target.value as QuestionMode)}>{(Object.keys(questionModeNames) as QuestionMode[]).map((mode) => <option value={mode} key={mode}>{questionModeNames[mode]}</option>)}</select></label><label>Hướng hỏi<select value={props.direction} onChange={(event) => props.setDirection(event.target.value as Direction)}>{(Object.keys(directionNames) as Direction[]).map((direction) => <option value={direction} key={direction}>{directionNames[direction]}</option>)}</select></label><label>Số câu<select value={props.count} onChange={(event) => props.setCount(event.target.value)}><option value="10">10 câu</option><option value="20">20 câu</option><option value="all">Tất cả ({props.available})</option></select></label></div><p className="table-note">Có {props.available} từ phù hợp. Trắc nghiệm sẽ tự chuyển thành tự luận nếu chưa đủ đáp án nhiễu.</p><button className="primary" disabled={!props.available} onClick={props.onStart}>Bắt đầu học</button></section>;
}

function Quiz({ terms, onQuizComplete }: { terms: Term[]; onQuizComplete: (answers: QuizAnswer[]) => Promise<void> }) {
  const [source, setSource] = useState<'all' | 'quiz'>('quiz'); const [questionMode, setQuestionMode] = useState<QuestionMode>('mixed'); const [direction, setDirection] = useState<Direction>('jp_to_vi'); const [count, setCount] = useState('10'); const [minutes, setMinutes] = useState(10);
  const [attempt, setAttempt] = useState<QuizAttempt | null>(null); const [answers, setAnswers] = useState<QuizAnswer[]>([]); const [index, setIndex] = useState(0); const [answer, setAnswer] = useState(''); const [result, setResult] = useState<QuizResult | null>(null); const [busy, setBusy] = useState(false); const [error, setError] = useState(''); const [now, setNow] = useState(Date.now());
  const pool = selectedTerms(terms, source === 'all' ? 'all' : 'quiz'); const current = answers[index]; const term = current ? terms.find((item) => item.id === current.termId) : undefined; const expected = term && attempt ? expectedFor(term, attempt.direction) : '';
  const options = useMemo(() => term && attempt ? shuffle(Array.from(new Set([expected, ...terms.filter((item) => item.id !== term.id).map((item) => expectedFor(item, attempt.direction))]))).slice(0, 4) : [], [term, expected, terms, attempt]);
  const questionType = current?.questionType === 'multiple_choice' && options.length < 4 ? 'written' : current?.questionType;
  const secondsLeft = attempt ? Math.max(0, Math.ceil((new Date(attempt.deadlineAt).getTime() - now) / 1000)) : 0;

  const hydrate = async (nextAttempt: QuizAttempt) => { const nextAnswers = await api.loadQuizAnswers(nextAttempt.id); setAttempt(nextAttempt); setAnswers(nextAnswers); setIndex(0); setAnswer(nextAnswers[0]?.answer ?? ''); };
  useEffect(() => { void (async () => { try { const active = await api.loadActiveQuiz(); if (active) await hydrate(active); } catch (nextError) { setError(messageOf(nextError)); } })(); }, []);
  useEffect(() => { if (!attempt || result) return; const timer = window.setInterval(() => setNow(Date.now()), 500); return () => window.clearInterval(timer); }, [attempt?.id, result]);
  useEffect(() => { if (attempt && !result && secondsLeft === 0 && !busy) void finishQuiz(); }, [secondsLeft, attempt?.id, result, busy]);
  useEffect(() => { setAnswer(answers[index]?.answer ?? ''); }, [index, answers]);

  const saveCurrent = async () => {
    if (!current) return;
    await api.saveQuizAnswer(current, answer);
    setAnswers((items) => items.map((item) => item.id === current.id ? { ...item, answer } : item));
  };
  const startQuiz = async () => {
    setBusy(true); setError('');
    try { const nextAttempt = await api.startQuiz({ termIds: shuffle(pool).slice(0, countFor(count, pool.length)).map((term) => term.id), durationSeconds: minutes * 60, sourceMode: source, questionMode, direction }); await hydrate(nextAttempt); setResult(null); } catch (nextError) { setError(messageOf(nextError)); } finally { setBusy(false); }
  };
  async function finishQuiz() {
    if (!attempt || busy) return;
    setBusy(true); setError('');
    try { await saveCurrent(); const nextResult = await api.submitQuiz(attempt.id); const finalAnswers = await api.loadQuizAnswers(attempt.id); setAnswers(finalAnswers); setResult(nextResult); await onQuizComplete(finalAnswers); } catch (nextError) { setError(messageOf(nextError)); } finally { setBusy(false); }
  }
  const changeQuestion = async (target: number) => { try { await saveCurrent(); setIndex(target); } catch (nextError) { setError(messageOf(nextError)); } };
  const reset = () => { setAttempt(null); setAnswers([]); setResult(null); setIndex(0); setAnswer(''); setNow(Date.now()); };

  if (!attempt) return <section className="session"><h2>Làm bài</h2><p>Kết quả chỉ hiện sau khi nộp. Hạn nộp được tính ở máy chủ và lượt đang làm có thể tiếp tục trên thiết bị khác.</p><div className="config-grid"><label>Nguồn từ<select value={source} onChange={(event) => setSource(event.target.value as 'all' | 'quiz')}><option value="quiz">Chỉ từ đánh dấu Làm bài</option><option value="all">Tất cả từ đang dùng</option></select></label><label>Dạng câu<select value={questionMode} onChange={(event) => setQuestionMode(event.target.value as QuestionMode)}>{(Object.keys(questionModeNames) as QuestionMode[]).map((mode) => <option value={mode} key={mode}>{questionModeNames[mode]}</option>)}</select></label><label>Hướng hỏi<select value={direction} onChange={(event) => setDirection(event.target.value as Direction)}>{(Object.keys(directionNames) as Direction[]).map((item) => <option value={item} key={item}>{directionNames[item]}</option>)}</select></label><label>Số câu<select value={count} onChange={(event) => setCount(event.target.value)}><option value="10">10 câu</option><option value="20">20 câu</option><option value="all">Tất cả ({pool.length})</option></select></label><label>Thời gian (phút)<input type="number" min="1" max="120" value={minutes} onChange={(event) => setMinutes(Math.max(1, Math.min(120, Number(event.target.value) || 1)))} /></label></div>{error && <p className="error">{error}</p>}<button className="primary" disabled={!pool.length || busy} onClick={() => void startQuiz()}>{busy ? 'Đang tạo bài…' : 'Bắt đầu Quiz'}</button></section>;
  if (result) return <section className="session"><p className="eyebrow">{result.status === 'expired' ? 'HẾT GIỜ · ĐÃ TỰ NỘP' : 'ĐÃ NỘP BÀI'}</p><h2>Kết quả Quiz</h2><p className="score">{result.correctCount}/{result.questionCount}</p><div className="result-list">{answers.map((item) => { const itemTerm = terms.find((candidate) => candidate.id === item.termId); const itemExpected = itemTerm ? expectedFor(itemTerm, attempt.direction) : ''; return <div className={item.correct ? 'result correct' : 'result wrong'} key={item.id}><b>Câu {item.position}: {item.correct ? 'Đúng' : 'Chưa đúng'}</b><span>{itemTerm ? promptFor(itemTerm, attempt.direction) : 'Từ đã lưu trữ'}</span><span>Bạn trả lời: {item.answer || '—'} · Đáp án: {itemExpected}</span></div>; })}</div><button className="primary" onClick={reset}>Làm bài mới</button></section>;
  if (!current || !term) return <section className="empty">Không thể tải câu hỏi Quiz.</section>;
  return <section className="session"><p className="eyebrow">QUIZ · CÂU {index + 1}/{answers.length} · CÒN {Math.floor(secondsLeft / 60)}:{String(secondsLeft % 60).padStart(2, '0')} · {directionNames[attempt.direction]}</p><h2>{promptFor(term, attempt.direction)}</h2><p>{questionType === 'multiple_choice' ? 'Chọn đáp án, rồi chuyển câu hoặc nộp bài.' : 'Nhập đáp án; kết quả sẽ giữ kín đến lúc nộp.'}</p>{questionType === 'multiple_choice' ? <div className="choices">{options.map((option) => <button type="button" className={answer === option ? 'selected' : ''} onClick={() => setAnswer(option)} key={option}>{option}</button>)}</div> : <input className="quiz-input" autoFocus value={answer} onBlur={() => void saveCurrent()} onChange={(event) => setAnswer(event.target.value)} placeholder="Nhập đáp án" />}{error && <p className="error">{error}</p>}<div className="actions quiz-actions"><button type="button" disabled={index === 0 || busy} onClick={() => void changeQuestion(index - 1)}>Câu trước</button>{index + 1 < answers.length ? <button type="button" disabled={busy} onClick={() => void changeQuestion(index + 1)}>Lưu và câu tiếp</button> : <button type="button" disabled={busy} onClick={() => void saveCurrent()}>Lưu câu trả lời</button>}<button type="button" className="primary" disabled={busy} onClick={() => void finishQuiz()}>{busy ? 'Đang nộp…' : 'Nộp bài'}</button></div></section>;
}

import { supabase } from './supabase';
import type { DeletionStatus, Direction, LearningStats, Mode, QuestionMode, QuizAnswer, QuizAttempt, QuizResult, Term } from './types';

type DbTerm = {
  id: string; japanese: string; vietnamese: string; modes: Mode[]; archived_at: string | null; created_at: string;
};
type DbAttempt = {
  id: string; source_mode: 'all' | 'quiz'; question_mode: QuestionMode; direction: Direction; question_count: number;
  duration_seconds: number; started_at: string; deadline_at: string; status: QuizAttempt['status']; submitted_at: string | null;
};
type DbAnswer = {
  id: string; attempt_id: string; term_id: string; position: number; question_type: QuizAnswer['questionType'];
  answer: string | null; correct: boolean | null; answered_at: string | null;
};

function client() {
  if (!supabase) throw new Error('Supabase chưa được cấu hình.');
  return supabase;
}

function mapTerm(row: DbTerm): Term {
  return { id: row.id, japanese: row.japanese, vietnamese: row.vietnamese, modes: row.modes ?? [], archivedAt: row.archived_at, createdAt: row.created_at };
}

function mapAttempt(row: DbAttempt): QuizAttempt {
  return {
    id: row.id, sourceMode: row.source_mode, questionMode: row.question_mode, direction: row.direction,
    questionCount: row.question_count, durationSeconds: row.duration_seconds, startedAt: row.started_at,
    deadlineAt: row.deadline_at, status: row.status, submittedAt: row.submitted_at,
  };
}

function mapAnswer(row: DbAnswer): QuizAnswer {
  return {
    id: row.id, attemptId: row.attempt_id, termId: row.term_id, position: row.position, questionType: row.question_type,
    answer: row.answer, correct: row.correct, answeredAt: row.answered_at,
  };
}

export async function fetchTerms(): Promise<Term[]> {
  const { data, error } = await client().from('vocabulary_terms').select('*').order('created_at', { ascending: false });
  if (error) throw error;
  return (data as DbTerm[]).map(mapTerm);
}

export async function createTerm(userId: string, japanese: string, vietnamese: string): Promise<Term> {
  const { data, error } = await client().from('vocabulary_terms').insert({ user_id: userId, japanese, vietnamese }).select().single();
  if (error) throw error;
  return mapTerm(data as DbTerm);
}

export async function updateTerm(id: string, patch: Pick<Term, 'modes'> | Pick<Term, 'archivedAt'>): Promise<Term> {
  const dbPatch = 'modes' in patch ? { modes: patch.modes, updated_at: new Date().toISOString() } : { archived_at: patch.archivedAt, updated_at: new Date().toISOString() };
  const { data, error } = await client().from('vocabulary_terms').update(dbPatch).eq('id', id).select().single();
  if (error) throw error;
  return mapTerm(data as DbTerm);
}

export async function fetchStats(): Promise<LearningStats> {
  const { data, error } = await client().from('learning_outcomes').select('correct');
  if (error) throw error;
  return (data as Array<{ correct: boolean | null }>).reduce<LearningStats>((stats, outcome) => ({
    correct: stats.correct + (outcome.correct ? 1 : 0),
    wrong: stats.wrong + (outcome.correct === false ? 1 : 0),
  }), { correct: 0, wrong: 0 });
}

export async function recordOutcomes(userId: string, outcomes: Array<{ termId: string; mode: Mode; correct: boolean | null; rating?: 'remembered' | 'needs_review' }>) {
  if (!outcomes.length) return;
  const { error } = await client().from('learning_outcomes').insert(outcomes.map((outcome) => ({
    user_id: userId, term_id: outcome.termId, mode: outcome.mode, correct: outcome.correct, rating: outcome.rating ?? null,
  })));
  if (error) throw error;
}

export async function startQuiz(config: {
  termIds: string[]; durationSeconds: number; sourceMode: 'all' | 'quiz'; questionMode: QuestionMode; direction: Direction;
}): Promise<QuizAttempt> {
  const { data, error } = await client().rpc('start_jnote_quiz', {
    p_term_ids: config.termIds, p_duration_seconds: config.durationSeconds, p_source_mode: config.sourceMode,
    p_question_mode: config.questionMode, p_direction: config.direction,
  });
  if (error) throw error;
  return mapAttempt((Array.isArray(data) ? data[0] : data) as DbAttempt);
}

export async function loadActiveQuiz(): Promise<QuizAttempt | null> {
  const { data, error } = await client().from('quiz_attempts').select('*').eq('status', 'active').order('started_at', { ascending: false }).limit(1).maybeSingle();
  if (error) throw error;
  return data ? mapAttempt(data as DbAttempt) : null;
}

export async function loadQuizAnswers(attemptId: string): Promise<QuizAnswer[]> {
  const { data, error } = await client().from('quiz_answers').select('*').eq('attempt_id', attemptId).order('position');
  if (error) throw error;
  return (data as DbAnswer[]).map(mapAnswer);
}

export async function saveQuizAnswer(answer: QuizAnswer, value: string) {
  const { error } = await client().rpc('save_jnote_quiz_answer', { p_answer_id: answer.id, p_answer: value });
  if (error) throw error;
}

export async function submitQuiz(attemptId: string): Promise<QuizResult> {
  const { data, error } = await client().rpc('submit_jnote_quiz', { p_attempt_id: attemptId });
  if (error) throw error;
  const row = (Array.isArray(data) ? data[0] : data) as { status: QuizResult['status']; correct_count: number; question_count: number; submitted_at: string };
  return { status: row.status, correctCount: row.correct_count, questionCount: row.question_count, submittedAt: row.submitted_at };
}

export async function getDeletionStatus(): Promise<DeletionStatus | null> {
  const { data, error } = await client().rpc('get_jnote_deletion_status');
  if (error) throw error;
  const row = (Array.isArray(data) ? data[0] : data) as { deletion_requested_at: string | null; restore_until: string | null; purged_at: string | null } | null;
  return row ? { deletionRequestedAt: row.deletion_requested_at, restoreUntil: row.restore_until, purgedAt: row.purged_at } : null;
}

export async function requestDeletion(): Promise<string> {
  const { data, error } = await client().rpc('request_jnote_account_deletion');
  if (error) throw error;
  return data as string;
}

export async function restoreAccount() {
  const { error } = await client().rpc('restore_jnote_account');
  if (error) throw error;
}

export async function fetchExportRows() {
  const { data, error } = await client().from('learning_outcomes').select('term_id, mode, correct, rating, created_at').order('created_at', { ascending: true });
  if (error) throw error;
  return data as Array<{ term_id: string; mode: Mode; correct: boolean | null; rating: string | null; created_at: string }>;
}

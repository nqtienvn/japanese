-- JNOTE account recovery and server-side answer deadline guard.
-- Apply after 20260806_jnote.sql.

create extension if not exists pg_cron;

create table if not exists public.jnote_account_lifecycle (
  user_id uuid primary key references auth.users(id) on delete cascade,
  deletion_requested_at timestamptz,
  restore_until timestamptz,
  purged_at timestamptz,
  check (
    (deletion_requested_at is null and restore_until is null)
    or (deletion_requested_at is not null and restore_until is not null)
  )
);

alter table public.jnote_account_lifecycle enable row level security;

create or replace function public.jnote_account_is_active()
returns boolean
language sql
stable
security definer
set search_path = public
as $$
  select not exists (
    select 1 from public.jnote_account_lifecycle lifecycle
    where lifecycle.user_id = auth.uid()
      and (lifecycle.deletion_requested_at is not null or lifecycle.purged_at is not null)
  )
$$;

drop policy if exists "term owner only" on public.vocabulary_terms;
drop policy if exists "outcome owner only" on public.learning_outcomes;
drop policy if exists "quiz owner only" on public.quiz_attempts;
drop policy if exists "quiz answer owner only" on public.quiz_answers;

create policy "term owner only" on public.vocabulary_terms
  for all using (auth.uid() = user_id and public.jnote_account_is_active())
  with check (auth.uid() = user_id and public.jnote_account_is_active());
create policy "outcome owner only" on public.learning_outcomes
  for all using (auth.uid() = user_id and public.jnote_account_is_active())
  with check (auth.uid() = user_id and public.jnote_account_is_active());
create policy "quiz owner only" on public.quiz_attempts
  for all using (auth.uid() = user_id and public.jnote_account_is_active())
  with check (auth.uid() = user_id and public.jnote_account_is_active());
create policy "quiz answer owner read only" on public.quiz_answers
  for select using (
    public.jnote_account_is_active()
    and exists (select 1 from public.quiz_attempts attempt where attempt.id = attempt_id and attempt.user_id = auth.uid())
  );

alter function public.submit_jnote_quiz(uuid) security definer;

create or replace function public.start_jnote_quiz(
  p_term_ids uuid[],
  p_duration_seconds integer,
  p_source_mode text,
  p_question_mode text,
  p_direction text
)
returns public.quiz_attempts
language plpgsql
security definer
set search_path = public
as $$
declare
  attempt public.quiz_attempts;
  expected_count integer;
begin
  if auth.uid() is null or not public.jnote_account_is_active() then
    raise exception 'Active authentication is required';
  end if;
  if p_duration_seconds not between 60 and 7200 then
    raise exception 'Duration must be between 60 and 7200 seconds';
  end if;
  if p_source_mode not in ('all', 'quiz') or p_question_mode not in ('multiple_choice', 'written', 'mixed') or p_direction not in ('jp_to_vi', 'vi_to_jp') then
    raise exception 'Invalid quiz configuration';
  end if;

  select count(*) into expected_count
  from public.vocabulary_terms
  where user_id = auth.uid() and archived_at is null and id = any(p_term_ids);
  if coalesce(array_length(p_term_ids, 1), 0) not between 1 and 100 or expected_count <> array_length(p_term_ids, 1) then
    raise exception 'Quiz terms must be active terms owned by the current user';
  end if;

  update public.quiz_attempts
  set status = 'expired', submitted_at = now()
  where user_id = auth.uid() and status = 'active' and deadline_at <= now();

  insert into public.quiz_attempts (user_id, source_mode, question_mode, direction, question_count, duration_seconds, deadline_at)
  values (auth.uid(), p_source_mode, p_question_mode, p_direction, array_length(p_term_ids, 1), p_duration_seconds, now() + make_interval(secs => p_duration_seconds))
  returning * into attempt;

  insert into public.quiz_answers (attempt_id, term_id, position, question_type)
  select attempt.id, term_id, position,
    case when p_question_mode = 'mixed' then case when position % 2 = 0 then 'written' else 'multiple_choice' end else p_question_mode end
  from unnest(p_term_ids) with ordinality as questions(term_id, position);
  return attempt;
end;
$$;

create or replace function public.save_jnote_quiz_answer(p_answer_id uuid, p_answer text)
returns void
language plpgsql
security definer
set search_path = public
as $$
begin
  if auth.uid() is null or not public.jnote_account_is_active() then
    raise exception 'Active authentication is required';
  end if;

  update public.quiz_answers answer_row
  set answer = p_answer, answered_at = now()
  from public.quiz_attempts attempt
  where answer_row.id = p_answer_id
    and attempt.id = answer_row.attempt_id
    and attempt.user_id = auth.uid()
    and attempt.status = 'active'
    and attempt.deadline_at > now();

  if not found then
    raise exception 'The Quiz answer is no longer editable';
  end if;
end;
$$;

create or replace function public.submit_jnote_quiz(p_attempt_id uuid)
returns table (status text, correct_count integer, question_count integer, submitted_at timestamptz)
language plpgsql
security definer
set search_path = public
as $$
declare
  attempt public.quiz_attempts;
  final_status text;
begin
  if auth.uid() is null or not public.jnote_account_is_active() then
    raise exception 'Active authentication is required';
  end if;

  select * into attempt
  from public.quiz_attempts
  where id = p_attempt_id and user_id = auth.uid()
  for update;

  if not found then
    raise exception 'Quiz attempt not found';
  end if;
  if attempt.status <> 'active' then
    raise exception 'Quiz attempt is already closed';
  end if;

  update public.quiz_answers answer_row
  set correct = answer_row.answered_at is not null
    and answer_row.answered_at <= attempt.deadline_at
    and public.jnote_normalize_answer(answer_row.answer) = public.jnote_normalize_answer(
      case attempt.direction when 'jp_to_vi' then term.vietnamese else term.japanese end
    )
  from public.vocabulary_terms term
  where answer_row.attempt_id = attempt.id and term.id = answer_row.term_id;

  final_status := case when now() >= attempt.deadline_at then 'expired' else 'submitted' end;
  update public.quiz_attempts set status = final_status, submitted_at = now() where id = attempt.id;

  return query
  select final_status, count(*) filter (where answer_row.correct), count(*), now()
  from public.quiz_answers answer_row where answer_row.attempt_id = attempt.id;
end;
$$;

create or replace function public.get_jnote_deletion_status()
returns table (deletion_requested_at timestamptz, restore_until timestamptz, purged_at timestamptz)
language sql
stable
security definer
set search_path = public
as $$
  select lifecycle.deletion_requested_at, lifecycle.restore_until, lifecycle.purged_at
  from public.jnote_account_lifecycle lifecycle
  where lifecycle.user_id = auth.uid()
$$;

create or replace function public.request_jnote_account_deletion()
returns timestamptz
language plpgsql
security definer
set search_path = public
as $$
declare
  issued_at bigint;
  deadline timestamptz := now() + interval '30 days';
begin
  if auth.uid() is null then
    raise exception 'Authentication is required';
  end if;
  issued_at := coalesce((auth.jwt() ->> 'iat')::bigint, 0);
  if issued_at = 0 or now() - to_timestamp(issued_at) > interval '5 minutes' then
    raise exception 'Sign in again before deleting your account';
  end if;

  insert into public.jnote_account_lifecycle (user_id, deletion_requested_at, restore_until, purged_at)
  values (auth.uid(), now(), deadline, null)
  on conflict (user_id) do update set deletion_requested_at = excluded.deletion_requested_at, restore_until = excluded.restore_until, purged_at = null;
  return deadline;
end;
$$;

create or replace function public.restore_jnote_account()
returns void
language plpgsql
security definer
set search_path = public
as $$
begin
  update public.jnote_account_lifecycle
  set deletion_requested_at = null, restore_until = null
  where user_id = auth.uid() and purged_at is null and restore_until > now();
  if not found then
    raise exception 'This account cannot be restored';
  end if;
end;
$$;

create or replace function public.purge_expired_jnote_accounts()
returns integer
language plpgsql
security definer
set search_path = public
as $$
declare
  purged_count integer;
begin
  delete from public.learning_outcomes outcome
  using public.jnote_account_lifecycle lifecycle
  where outcome.user_id = lifecycle.user_id and lifecycle.restore_until <= now() and lifecycle.purged_at is null;
  delete from public.quiz_attempts attempt
  using public.jnote_account_lifecycle lifecycle
  where attempt.user_id = lifecycle.user_id and lifecycle.restore_until <= now() and lifecycle.purged_at is null;
  delete from public.vocabulary_terms term
  using public.jnote_account_lifecycle lifecycle
  where term.user_id = lifecycle.user_id and lifecycle.restore_until <= now() and lifecycle.purged_at is null;
  update public.jnote_account_lifecycle
  set purged_at = now()
  where restore_until <= now() and purged_at is null;
  get diagnostics purged_count = row_count;
  return purged_count;
end;
$$;

do $$
begin
  if not exists (select 1 from cron.job where jobname = 'jnote-purge-expired-accounts') then
    perform cron.schedule('jnote-purge-expired-accounts', '0 3 * * *', 'select public.purge_expired_jnote_accounts()');
  end if;
end $$;

revoke all on function public.jnote_account_is_active() from public, anon;
revoke all on function public.save_jnote_quiz_answer(uuid, text) from public, anon;
revoke all on function public.get_jnote_deletion_status() from public, anon;
revoke all on function public.request_jnote_account_deletion() from public, anon;
revoke all on function public.restore_jnote_account() from public, anon;
revoke all on function public.purge_expired_jnote_accounts() from public, anon, authenticated;
grant execute on function public.jnote_account_is_active() to authenticated;
grant execute on function public.save_jnote_quiz_answer(uuid, text) to authenticated;
grant execute on function public.get_jnote_deletion_status() to authenticated;
grant execute on function public.request_jnote_account_deletion() to authenticated;
grant execute on function public.restore_jnote_account() to authenticated;

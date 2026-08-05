-- JNOTE initial schema for a client-provisioned Supabase project.
-- Run once through the Supabase SQL Editor after reviewing the migration.

create extension if not exists pgcrypto;

create table if not exists public.vocabulary_terms (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  japanese text not null check (char_length(japanese) between 1 and 200),
  vietnamese text not null check (char_length(vietnamese) between 1 and 500),
  modes text[] not null default '{}' check (modes <@ array['flashcard', 'study', 'quiz']::text[]),
  archived_at timestamptz,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (user_id, japanese, vietnamese)
);

create index if not exists vocabulary_terms_owner_active_idx
  on public.vocabulary_terms (user_id, created_at desc)
  where archived_at is null;

create table if not exists public.learning_outcomes (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  term_id uuid not null references public.vocabulary_terms(id) on delete cascade,
  mode text not null check (mode in ('flashcard', 'study', 'quiz')),
  correct boolean,
  rating text check (rating in ('remembered', 'needs_review')),
  created_at timestamptz not null default now()
);

create index if not exists learning_outcomes_owner_created_idx
  on public.learning_outcomes (user_id, created_at desc);

create table if not exists public.quiz_attempts (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  source_mode text not null default 'quiz' check (source_mode in ('all', 'quiz')),
  question_mode text not null check (question_mode in ('multiple_choice', 'written', 'mixed')),
  direction text not null check (direction in ('jp_to_vi', 'vi_to_jp')),
  question_count integer not null check (question_count between 1 and 100),
  duration_seconds integer not null check (duration_seconds between 60 and 7200),
  started_at timestamptz not null default now(),
  deadline_at timestamptz not null,
  status text not null default 'active' check (status in ('active', 'submitted', 'expired')),
  submitted_at timestamptz
);

create unique index if not exists quiz_attempts_one_active_per_user_idx
  on public.quiz_attempts (user_id)
  where status = 'active';

create index if not exists quiz_attempts_owner_created_idx
  on public.quiz_attempts (user_id, started_at desc);

create table if not exists public.quiz_answers (
  id uuid primary key default gen_random_uuid(),
  attempt_id uuid not null references public.quiz_attempts(id) on delete cascade,
  term_id uuid not null references public.vocabulary_terms(id) on delete cascade,
  position integer not null check (position between 1 and 100),
  question_type text not null check (question_type in ('multiple_choice', 'written')),
  answer text,
  correct boolean,
  answered_at timestamptz,
  created_at timestamptz not null default now(),
  unique (attempt_id, term_id),
  unique (attempt_id, position)
);

create index if not exists quiz_answers_attempt_position_idx
  on public.quiz_answers (attempt_id, position);

alter table public.vocabulary_terms enable row level security;
alter table public.learning_outcomes enable row level security;
alter table public.quiz_attempts enable row level security;
alter table public.quiz_answers enable row level security;

do $$
begin
  if not exists (select 1 from pg_policies where schemaname = 'public' and tablename = 'vocabulary_terms' and policyname = 'term owner only') then
    create policy "term owner only" on public.vocabulary_terms
      for all using (auth.uid() = user_id) with check (auth.uid() = user_id);
  end if;
  if not exists (select 1 from pg_policies where schemaname = 'public' and tablename = 'learning_outcomes' and policyname = 'outcome owner only') then
    create policy "outcome owner only" on public.learning_outcomes
      for all using (auth.uid() = user_id) with check (auth.uid() = user_id);
  end if;
  if not exists (select 1 from pg_policies where schemaname = 'public' and tablename = 'quiz_attempts' and policyname = 'quiz owner only') then
    create policy "quiz owner only" on public.quiz_attempts
      for all using (auth.uid() = user_id) with check (auth.uid() = user_id);
  end if;
  if not exists (select 1 from pg_policies where schemaname = 'public' and tablename = 'quiz_answers' and policyname = 'quiz answer owner only') then
    create policy "quiz answer owner only" on public.quiz_answers
      for all using (
        exists (select 1 from public.quiz_attempts a where a.id = attempt_id and a.user_id = auth.uid())
      ) with check (
        exists (select 1 from public.quiz_attempts a where a.id = attempt_id and a.user_id = auth.uid())
      );
  end if;
end $$;

create or replace function public.jnote_normalize_answer(value text)
returns text
language sql
immutable
set search_path = public
as $$
  select lower(trim(regexp_replace(normalize(coalesce(value, ''), NFC), '\\s+', ' ', 'g')))
$$;

create or replace function public.start_jnote_quiz(
  p_term_ids uuid[],
  p_duration_seconds integer,
  p_source_mode text,
  p_question_mode text,
  p_direction text
)
returns public.quiz_attempts
language plpgsql
set search_path = public
as $$
declare
  attempt public.quiz_attempts;
  expected_count integer;
begin
  if auth.uid() is null then
    raise exception 'Authentication is required';
  end if;
  if p_duration_seconds not between 60 and 7200 then
    raise exception 'Duration must be between 60 and 7200 seconds';
  end if;
  if p_source_mode not in ('all', 'quiz') or p_question_mode not in ('multiple_choice', 'written', 'mixed') or p_direction not in ('jp_to_vi', 'vi_to_jp') then
    raise exception 'Invalid quiz configuration';
  end if;

  select count(*) into expected_count
  from public.vocabulary_terms
  where user_id = auth.uid()
    and archived_at is null
    and id = any(p_term_ids);

  if coalesce(array_length(p_term_ids, 1), 0) not between 1 and 100 or expected_count <> array_length(p_term_ids, 1) then
    raise exception 'Quiz terms must be active terms owned by the current user';
  end if;

  update public.quiz_attempts
  set status = 'expired', submitted_at = now()
  where user_id = auth.uid() and status = 'active' and deadline_at <= now();

  insert into public.quiz_attempts (
    user_id, source_mode, question_mode, direction, question_count, duration_seconds, deadline_at
  ) values (
    auth.uid(), p_source_mode, p_question_mode, p_direction, array_length(p_term_ids, 1), p_duration_seconds,
    now() + make_interval(secs => p_duration_seconds)
  ) returning * into attempt;

  insert into public.quiz_answers (attempt_id, term_id, position, question_type)
  select
    attempt.id,
    term_id,
    position,
    case
      when p_question_mode = 'mixed' then case when position % 2 = 0 then 'written' else 'multiple_choice' end
      else p_question_mode
    end
  from unnest(p_term_ids) with ordinality as questions(term_id, position);

  return attempt;
end;
$$;

create or replace function public.submit_jnote_quiz(p_attempt_id uuid)
returns table (status text, correct_count integer, question_count integer, submitted_at timestamptz)
language plpgsql
set search_path = public
as $$
declare
  attempt public.quiz_attempts;
  final_status text;
begin
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

  update public.quiz_answers qa
  set correct = public.jnote_normalize_answer(qa.answer) = public.jnote_normalize_answer(
    case attempt.direction when 'jp_to_vi' then term.vietnamese else term.japanese end
  )
  from public.vocabulary_terms term
  where qa.attempt_id = attempt.id and term.id = qa.term_id;

  final_status := case when now() >= attempt.deadline_at then 'expired' else 'submitted' end;
  update public.quiz_attempts
  set status = final_status, submitted_at = now()
  where id = attempt.id;

  return query
  select
    final_status,
    count(*) filter (where qa.correct),
    count(*),
    now()
  from public.quiz_answers qa
  where qa.attempt_id = attempt.id;
end;
$$;

revoke all on function public.start_jnote_quiz(uuid[], integer, text, text, text) from public, anon;
revoke all on function public.submit_jnote_quiz(uuid) from public, anon;
grant execute on function public.start_jnote_quiz(uuid[], integer, text, text, text) to authenticated;
grant execute on function public.submit_jnote_quiz(uuid) to authenticated;

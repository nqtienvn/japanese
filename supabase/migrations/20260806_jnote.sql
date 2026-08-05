-- Apply only to a Client-provisioned Supabase project after reviewing this migration.
create table if not exists public.vocabulary_terms (id uuid primary key default gen_random_uuid(), user_id uuid not null references auth.users(id) on delete cascade, japanese text not null check (char_length(japanese) between 1 and 200), vietnamese text not null check (char_length(vietnamese) between 1 and 500), modes text[] not null default '{}', archived_at timestamptz, created_at timestamptz not null default now(), unique (user_id, japanese, vietnamese));
alter table public.vocabulary_terms enable row level security;
create policy "term owner only" on public.vocabulary_terms for all using (auth.uid() = user_id) with check (auth.uid() = user_id);

create table if not exists public.learning_outcomes (
  id uuid primary key default gen_random_uuid(), user_id uuid not null references auth.users(id) on delete cascade,
  term_id uuid not null references public.vocabulary_terms(id) on delete cascade,
  mode text not null check (mode in ('flashcard','study','quiz')), correct boolean, rating text check (rating in ('remembered','needs_review')),
  created_at timestamptz not null default now()
);
create table if not exists public.quiz_attempts (
  id uuid primary key default gen_random_uuid(), user_id uuid not null references auth.users(id) on delete cascade,
  source_mode text not null default 'quiz', question_count integer not null check (question_count between 1 and 100),
  started_at timestamptz not null default now(), deadline_at timestamptz not null, status text not null default 'active' check (status in ('active','submitted','expired')),
  submitted_at timestamptz
);
create unique index if not exists one_active_quiz_per_user on public.quiz_attempts(user_id) where status = 'active';
create table if not exists public.quiz_answers (
  id uuid primary key default gen_random_uuid(), attempt_id uuid not null references public.quiz_attempts(id) on delete cascade,
  term_id uuid not null references public.vocabulary_terms(id), answer text, correct boolean, answered_at timestamptz not null default now(), unique(attempt_id, term_id)
);
alter table public.learning_outcomes enable row level security;
alter table public.quiz_attempts enable row level security;
alter table public.quiz_answers enable row level security;
create policy "outcome owner only" on public.learning_outcomes for all using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "quiz owner only" on public.quiz_attempts for all using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "quiz answer owner only" on public.quiz_answers for all using (exists (select 1 from public.quiz_attempts a where a.id = attempt_id and a.user_id = auth.uid())) with check (exists (select 1 from public.quiz_attempts a where a.id = attempt_id and a.user_id = auth.uid()));

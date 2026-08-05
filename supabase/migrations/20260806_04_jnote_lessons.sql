-- Named lessons group the vocabulary captured in JNOTE.

create table if not exists public.lessons (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  title text not null check (char_length(trim(title)) between 1 and 160),
  created_at timestamptz not null default now(),
  unique (user_id, title)
);

create index if not exists lessons_owner_created_idx on public.lessons (user_id, created_at desc);

alter table public.lessons enable row level security;
alter table public.vocabulary_terms add column if not exists lesson_id uuid references public.lessons(id) on delete set null;
create index if not exists vocabulary_terms_owner_lesson_idx on public.vocabulary_terms (user_id, lesson_id, created_at desc);

create policy "lesson owner only" on public.lessons
  for all using (auth.uid() = user_id and public.jnote_account_is_active())
  with check (auth.uid() = user_id and public.jnote_account_is_active());

drop policy if exists "term owner only" on public.vocabulary_terms;
create policy "term owner only" on public.vocabulary_terms
  for all using (
    auth.uid() = user_id
    and public.jnote_account_is_active()
    and (lesson_id is null or exists (select 1 from public.lessons lesson where lesson.id = lesson_id and lesson.user_id = auth.uid()))
  ) with check (
    auth.uid() = user_id
    and public.jnote_account_is_active()
    and (lesson_id is null or exists (select 1 from public.lessons lesson where lesson.id = lesson_id and lesson.user_id = auth.uid()))
  );

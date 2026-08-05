-- Apply only to a Client-provisioned Supabase project after reviewing this migration.
create table if not exists public.vocabulary_terms (id uuid primary key default gen_random_uuid(), user_id uuid not null references auth.users(id) on delete cascade, japanese text not null check (char_length(japanese) between 1 and 200), vietnamese text not null check (char_length(vietnamese) between 1 and 500), modes text[] not null default '{}', archived_at timestamptz, created_at timestamptz not null default now(), unique (user_id, japanese, vietnamese));
alter table public.vocabulary_terms enable row level security;
create policy "term owner only" on public.vocabulary_terms for all using (auth.uid() = user_id) with check (auth.uid() = user_id);

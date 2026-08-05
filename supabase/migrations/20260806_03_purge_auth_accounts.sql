-- Permanently remove an expired JNOTE account as well as its owner-scoped data.
-- The auth.users foreign keys cascade to all JNOTE records.

create or replace function public.purge_expired_jnote_accounts()
returns integer
language plpgsql
security definer
set search_path = public, auth
as $$
declare
  purged_count integer;
begin
  delete from auth.users account
  using public.jnote_account_lifecycle lifecycle
  where account.id = lifecycle.user_id
    and lifecycle.restore_until <= now()
    and lifecycle.purged_at is null;
  get diagnostics purged_count = row_count;
  return purged_count;
end;
$$;

create table if not exists public.taohua_power_state (
  id text primary key,
  members jsonb not null default '[]'::jsonb,
  updated_at timestamptz not null default now()
);
alter table public.taohua_power_state enable row level security;
grant select, insert, update on public.taohua_power_state to anon, authenticated;
create policy "taohua shared read" on public.taohua_power_state for select to anon, authenticated using (id='main');
create policy "taohua shared insert" on public.taohua_power_state for insert to anon, authenticated with check (id='main');
create policy "taohua shared update" on public.taohua_power_state for update to anon, authenticated using (id='main') with check (id='main');

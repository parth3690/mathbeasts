-- Math Beasts Academy: family sync table (run once in Supabase SQL Editor)
create table if not exists public.kv (
  family     text        not null,
  k          text        not null,
  v          text        not null,
  updated_at timestamptz not null default now(),
  primary key (family, k)
);

alter table public.kv enable row level security;

-- The app uses the public anon key; the secret family code keeps families separate.
create policy "kv select" on public.kv for select using (true);
create policy "kv insert" on public.kv for insert with check (true);
create policy "kv update" on public.kv for update using (true);

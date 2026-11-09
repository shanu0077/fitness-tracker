create table if not exists public.fitness_tracker_data (
  user_id uuid primary key references auth.users(id) on delete cascade,
  data jsonb not null,
  updated_at timestamptz not null default now()
);

alter table public.fitness_tracker_data enable row level security;

drop policy if exists "Users can read own fitness data" on public.fitness_tracker_data;
create policy "Users can read own fitness data"
  on public.fitness_tracker_data for select
  using (auth.uid() = user_id);

drop policy if exists "Users can insert own fitness data" on public.fitness_tracker_data;
create policy "Users can insert own fitness data"
  on public.fitness_tracker_data for insert
  with check (auth.uid() = user_id);

drop policy if exists "Users can update own fitness data" on public.fitness_tracker_data;
create policy "Users can update own fitness data"
  on public.fitness_tracker_data for update
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);

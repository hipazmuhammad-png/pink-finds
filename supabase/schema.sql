create extension if not exists pgcrypto;
create table if not exists public.products(id uuid primary key default gen_random_uuid(),name text not null,price_text text,category text,image_url text,affiliate_url text not null,badge text,rating numeric(2,1),sold_text text,published boolean not null default true,created_at timestamptz not null default now());
create table if not exists public.click_events(id bigint generated always as identity primary key,product_id uuid references public.products(id) on delete cascade,created_at timestamptz not null default now());
create table if not exists public.admins(user_id uuid primary key references auth.users(id) on delete cascade);
alter table public.products enable row level security; alter table public.click_events enable row level security; alter table public.admins enable row level security;
create or replace function public.is_admin() returns boolean language sql security definer set search_path=public as $$ select exists(select 1 from public.admins where user_id=auth.uid()); $$;
create policy "read published products" on public.products for select using (published=true or public.is_admin());
create policy "admin insert" on public.products for insert with check (public.is_admin());
create policy "admin update" on public.products for update using (public.is_admin()) with check (public.is_admin());
create policy "admin delete" on public.products for delete using (public.is_admin());
create policy "public click insert" on public.click_events for insert with check (true);
create policy "admin click read" on public.click_events for select using (public.is_admin());
-- Setelah membuat user di Supabase Auth, jalankan:
-- insert into public.admins(user_id) values ('UUID_USER_KAMU');
-- Gallery of Sin — Step 5: audio metadata and security checks
-- Run in Supabase SQL Editor as the project owner.
create table if not exists public.song_audio (
 id uuid primary key default gen_random_uuid(),
 song_id text not null references public.songs(id) on delete cascade,
 storage_path text not null unique,
 title text not null,
 description text not null default '',
 file_name text not null,
 created_by uuid not null references auth.users(id),
 created_at timestamptz not null default now()
);
alter table public.song_audio enable row level security;
drop policy if exists "Band read audio" on public.song_audio;
create policy "Band read audio" on public.song_audio for select to authenticated using ((select public.is_band_member()));
drop policy if exists "Band add audio" on public.song_audio;
create policy "Band add audio" on public.song_audio for insert to authenticated
with check ((select public.is_band_member()) and created_by = (select auth.uid()) and storage_path like song_id || '/%');
drop policy if exists "Band delete audio" on public.song_audio;
create policy "Band delete audio" on public.song_audio for delete to authenticated using ((select public.is_band_member()));
-- Prevent accidental public disclosure of private workspaces. RLS should already be enabled.
-- Keep Storage buckets song-audio and song-artwork PRIVATE.
-- Review Storage policies manually to ensure no permissive public policies exist.

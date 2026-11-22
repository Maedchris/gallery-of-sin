MÆD — Gallery of Sin, version 3 (Supabase Studio Mode)

1. In Supabase SQL Editor, run gallery_of_sin_step5.sql (included in the ZIP).
2. In Supabase Dashboard > Project Settings / API Keys, copy Project URL and PUBLISHABLE key.
3. Edit config.js with those two values. NEVER use secret/service_role key.
4. In Authentication > URL Configuration, set Site URL to your GitHub Pages URL when published.
5. Upload ALL files in this folder to your GitHub repository (public repo for GitHub Pages).
6. In repository Settings > Pages, deploy from branch main, folder / (root).
7. Open the published website, click Studio Mode and sign in with the account approved in band_members.
8. Test Gallery View without logging in, then Studio Mode with a band member account.

IMPORTANT:
- Gallery content and placeholder images are PUBLIC. Do not put unreleased recordings or private notes into this repository.
- config.js contains ONLY a public/publishable key. Access is enforced by Supabase RLS and private Storage policies.
- Check that song-audio and song-artwork buckets are PRIVATE and no other permissive policies exist.
- If email/password login fails, check Authentication > Providers > Email and your user's password.
- Keep backups of the Supabase database and files; do not rely on the free tier as your only archive.
- Studio Mode requires an internet connection and the Supabase CDN library.
- Audio upload UI limit is 25 MB; the Supabase project's actual maximum may be lower.
- This first Studio Mode supports workspace editing, new ideas and audio uploads/playback.
  Artwork upload and public publishing of selected work are future features.

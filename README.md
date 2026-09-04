# Pink Finds V5 Production
Next.js + Supabase affiliate showcase.

## Setup
1. `npm install`
2. Salin `.env.example` menjadi `.env.local`.
3. Isi URL dan anon key Supabase.
4. Jalankan `supabase/schema.sql` di Supabase SQL Editor.
5. Buat user admin di Supabase Authentication > Users.
6. Masukkan UUID user ke tabel `admins`.
7. `npm run dev`, lalu buka `/login`.

## Deploy
Push ke GitHub, import ke Vercel, dan isi environment variables yang sama.

## Affiliate
Website mengarahkan pengunjung melalui `/go/[id]`, mencatat klik, lalu redirect ke affiliate URL. Untuk metadata otomatis dari link TikTok, gunakan API/OAuth resmi TikTok Shop setelah app creator memperoleh akses. Jangan menaruh client secret di frontend.

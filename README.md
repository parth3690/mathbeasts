MATH BEASTS ACADEMY v3 (with family cloud sync) — DEPLOYMENT GUIDE
==================================================================

This folder is a complete static website (index.html + app.js). Any free
static host works. supabase-setup.sql is for the optional cloud sync.

STEP 1 — PUT THE SITE ONLINE (pick one, all free)
  A) Netlify Drop: go to https://app.netlify.com/drop and drag this folder in.
     Instant public URL like https://your-site.netlify.app
  B) GitHub Pages: upload index.html + app.js to a repo, then
     Settings -> Pages -> Deploy from branch -> main -> / (root).
  C) Vercel / Cloudflare Pages: upload-folder flow, point at this folder.

STEP 2 — ENABLE AI QUESTIONS (one-time per device)
  Open the site -> "Settings — AI question engine" -> paste your Anthropic
  API key (console.anthropic.com -> API Keys) -> Save.

STEP 3 — ENABLE FAMILY SYNC (one-time total, ~3 minutes)
  1. Create a free account at https://supabase.com -> "New project"
     (any name/region; the free tier is plenty).
  2. In the project: SQL Editor -> New query -> paste the contents of
     supabase-setup.sql -> Run. You should see "Success".
  3. Project Settings -> API: copy the "Project URL" and the "anon public" key.
  4. On the website: "Family sync" settings -> paste both, invent a secret
     family code (treat it like a password, e.g. purple-walrus-8231) -> Connect.
     Your existing progress on that device uploads automatically.
  5. On every other device (iPad, phones): open the site, enter the SAME
     three values, tap Connect. Done — all devices now share kids, progress,
     XP, badges, and exam history. Saves sync automatically; opening a kid
     pulls the latest from the cloud.

HOW SYNC BEHAVES
  - Last write wins per record; fine for family use (avoid two people
    editing the same kid at the same instant).
  - The Anthropic API key is NOT synced — enter it on each device.
  - If the cloud is unreachable, the app quietly falls back to local data.

SECURITY NOTES (worth reading once)
  - The anon key + family code together are what protect your data, and both
    live in the web page's settings. Anyone with both could read/write your
    family's progress records (names, scores — nothing sensitive beyond that).
    Use an unguessable family code and don't share the URL + code publicly.
  - The Anthropic key is stored per-device and sent only to Anthropic. AI
    generation bills to it (~a fraction of a cent per exam/lesson).
  - "Add to Home Screen" on iPhone/iPad gives a fullscreen app experience.

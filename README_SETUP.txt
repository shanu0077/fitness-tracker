FITNESS TRACKER — CLOUD SETUP

This package preserves the existing food, workout, body-measurement, history, chart, backup and restore features, and adds Supabase cloud sync plus a mobile-installable PWA shell.

1) Create a free Supabase project at https://supabase.com/ and open SQL Editor.
2) Run the SQL in supabase_setup.sql.
3) In Project Settings > API, copy the Project URL and the anon/public key (never use the service_role key).
4) Deploy the contents of this folder to an HTTPS static host (for example Netlify Drop or GitHub Pages). Upload index.html, manifest.webmanifest, sw.js, and icon.svg together. Do not open index.html as a local file if you want cloud sync or installation.
5) Open the deployed URL in Safari on iPhone. In the Cloud account panel, enter the Supabase Project URL and anon/public key, tap Save connection, then create an account or sign in.
6) Add to Home Screen from Safari Share > Add to Home Screen.

IMPORTANT DATA NOTES
- Existing local entries stay in this browser. On first cloud sign-in, if cloud data exists, the app asks whether to load it. If no cloud record exists, local data is uploaded.
- Cloud sync runs after each change. Keep using the Backup tab to download periodic JSON backups.
- Use a strong unique password. Supabase email confirmation may need to be completed before first sign-in, depending on project settings.
- The anon/public key is intended for browser use; row-level security in the supplied SQL restricts each account to its own record. Never put a service_role key in this app.
- This is a single-user-per-account tracker. It does not sync data between different accounts.

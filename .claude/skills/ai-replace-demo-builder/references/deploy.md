# AI Replace — Deploying a demo (Vercel + GitHub)

Each demo is a single static `.html` file, so hosting is trivial — no build step, no
framework, no server. Pick whichever path fits the closer's comfort level.

A clean per-prospect URL works best on a call. Two common patterns:
- **One repo per prospect** → `printmoz-demo.vercel.app` (cleanest, throwaway).
- **One repo, many demos** → put each demo at `/printmoz/index.html` → `demos.vercel.app/printmoz`.

## Fastest: drag-and-drop to Vercel (no Git needed)

1. Rename the file to `index.html`.
2. Go to vercel.com → **Add New… → Project → Deploy** (or use the drop-zone for a static folder).
3. Drop the folder containing `index.html`. Vercel detects it as a static site automatically.
4. You get a live URL in ~20 seconds. Share that on the call.

## Recommended: GitHub → Vercel (re-deployable, versioned)

Per-prospect repo:
```bash
mkdir printmoz-demo && cd printmoz-demo
cp /path/to/demo.html index.html
git init && git add . && git commit -m "Printmoz AI CS Rep demo"
# create an empty repo on github.com first, then:
git remote add origin https://github.com/<you>/printmoz-demo.git
git push -u origin main
```
Then in Vercel: **Add New… → Project → Import** the repo. No framework preset needed
(it's static). Deploy → live URL. Every `git push` redeploys automatically.

A custom domain (e.g. `demos.getaireplace.com`) can be added in Vercel → Project → Settings
→ Domains, pointed at a subdomain you control.

## Notes

- The file references Google Fonts via CDN, so the deployed page needs internet (it will, on
  Vercel). For a fully offline screen-share, the closer can just open the local `.html` file.
- Nothing in the demo is secret, but these URLs are public once deployed — use unguessable repo/
  path names if you don't want prospects finding each other's demos.
- **Account creation, connecting GitHub to Vercel, and pushing live are done with your own logins**
  — set those up once, then each new demo is a 20-second deploy.

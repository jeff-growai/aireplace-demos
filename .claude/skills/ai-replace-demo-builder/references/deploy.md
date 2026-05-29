# AI Replace — Deploying a demo

Each demo is a single static `.html` file committed to the monorepo at
`prospects/<slug>/index.html`. A Vercel Git integration auto-deploys every push,
so the deploy step is just a git commit + push.

## Monorepo layout

```
aireplace-demos/
├── vercel.json          ← rewrites /:slug → /prospects/:slug/index.html
├── new-demo.sh          ← commit + push script called by the skill
└── prospects/
    ├── printmoz/
    │   └── index.html
    └── <next-prospect>/
        └── index.html
```

**Live URL pattern:** `https://demos.getaireplace.com/<slug>`

## Automated deploy (built into the skill)

After writing `prospects/<slug>/index.html`, the skill runs:

```bash
bash new-demo.sh <slug>
```

That script:
1. Stages `prospects/<slug>/index.html`
2. Commits `demo: <slug>`
3. Pushes to `origin main` → Vercel detects the push and deploys in ~20 s
4. Prints the live URL: `https://demos.getaireplace.com/<slug>`

Nothing else needed. The URL is ready to paste into the follow-up email or
share on the second call.

## Slug naming convention

`<slug>` = brand name, lowercase, hyphens for spaces. Examples:
- Printmoz → `printmoz`
- Garden Cup → `garden-cup`
- V Shred → `v-shred`

## Manual fallback (if auto-deploy fails)

```bash
cd "C:\Users\Jeff\Documents\GROW AI\Claude\AIR Demo"
mkdir -p prospects/<slug>
cp /path/to/demo.html prospects/<slug>/index.html
git add prospects/<slug>/index.html
git commit -m "demo: <slug>"
git push origin main
```

Vercel deploys automatically within ~20 seconds of the push.

## One-time infrastructure (already set up)

- GitHub repo: `jeff-growai/aireplace-demos` (private)
- Vercel project: `aireplace-demos.vercel.app`, connected to the GitHub repo
- Custom domain: `demos.getaireplace.com` → Vercel project
- `vercel.json` rewrite: `/:slug` → `/prospects/:slug/index.html`

## Notes

- Demos reference Google Fonts via CDN — they need internet to render the fonts
  on Vercel (fine). For a fully offline screen-share the closer opens the local file.
- URLs are public once deployed. The repo is private, but the Vercel URLs are live.
  Use unguessable slugs if you don't want prospects finding each other's demos.
- Account creation, GitHub/Vercel connection, and domain DNS are done once and
  never repeated. Each new demo is fully automated from here.

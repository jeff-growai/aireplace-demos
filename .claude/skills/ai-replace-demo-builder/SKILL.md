---
name: ai-replace-demo-builder
description: >-
  Builds personalised, animated single-file HTML sales demos for AI Replace — a
  done-for-you AI automation agency. Each demo simulates one of the 7 AI roles
  (AI CS Rep, AI Moderator, AI Analyst, AI Outreach Rep, AI SDR, AI Ad Tracker,
  AI Retention Rep) doing a prospect's real work overnight, ending on an approval
  flow and a "this runs before you open your laptop" close. Use this skill
  WHENEVER the user provides an AI Replace prospect/sales-call brief, mentions
  building a "demo" / "prospect demo" / "sales demo" for a brand, references a
  client brand to showcase AI automation for, or asks to build/personalise an
  AI Replace walkthrough — even if they don't say the word "skill". If a brand
  name + a role + pain points are mentioned in an AI Replace context, build the
  demo with this skill.
---

# AI Replace — Demo Builder

Build a highly personalised, animated HTML demo for a specific prospect, based on
a sales-call brief. The demo is what a closer screen-shares on the second call: it
plays itself, shows the prospect's *own* business being run by an AI role overnight,
and lands on the approval button + coffee-cup close.

**The output is always a single self-contained `.html` file** — pure HTML/CSS/JS,
Google Fonts only, no frameworks, no build step. It must run by double-clicking it
in any browser, and deploy to Vercel/GitHub as a static file with zero config.

## The most important thing: clone the reference demo

`assets/reference-demo.html` is a complete, working, gold-standard demo (Printmoz ·
AI CS Rep). **Do not rebuild a demo from scratch.** Start from this file, keep its
structure, animation engine, IDs, and CSS, and swap in the new prospect's content.
This is how you avoid the freeze bugs and design drift that prose instructions cause.
The engine is data-driven: in almost all cases you only edit the `NAME` variable, the
`EMAILS` array, the topbar brand name, and the colour variables in `:root`.

## Workflow

1. **Read the brief.** Get the intake fields (see "Intake brief" below). If the user
   hasn't given them, ask for the missing ones before building.
2. **Say this, then research:** *"I have the brief. Before I build, I'll research
   [brand URL] to pull real product names, brand colours, and tone. Give me a moment."*
   Then actually do it:
   - `web_fetch` the brand site → real product names, brand voice, colour palette, logo style.
   - `web_search` the founder/team if names are needed for personalisation.
   - `web_search` top products / real data points to reference.
3. **Pick the role.** Match what was discussed on the call to one of the 7 roles. See
   `references/playbook.md` → "Role selection". The chosen role determines whether the
   flow uses an approval step.
4. **Read the build spec.** Read `references/build-spec.md` in full before editing code.
   It contains the 8 non-negotiable design principles and the critical technical rules
   (innerHTML, stable IDs, class-name collisions, file size, async pattern). Violating
   these is what breaks demos.
5. **Clone and personalise** `assets/reference-demo.html`:
   - Topbar: `[Client brand] | AI Replace.` (keep the separator and AI Replace wordmark).
   - `:root` colours: adapt to the client's brand; keep contrast/readability.
   - `NAME`: the founder's first name (used in the approve hint, confirmations, stats).
   - `EMAILS` (or the role's equivalent feed): 4–6 scenarios built from real details.
     The **first scenario must be the exact pain point from the call** — they should see
     their own problem in the first 30 seconds.
   - Stats labels and the end-screen stat line.
6. **Validate before delivering** (see "Validation").
7. **Write** the single `.html` file to `prospects/<slug>/index.html` in the repo root,
   where `<slug>` is the brand name lowercased and hyphenated (e.g. `printmoz`,
   `garden-cup`). Create the folder if it doesn't exist. Then deploy:
   ```bash
   bash new-demo.sh <slug>
   ```
   This commits the file, pushes to GitHub, and triggers a Vercel auto-deploy (~20 s).
   Print the live URL on completion: `https://demos.getaireplace.com/<slug>`

## Intake brief

Collect this from the closer. Ask only for what's missing — infer the rest from research.

```
Client:        [Brand name]
URL:           [Website]
Founder name:  [First name — appears in the UI]
Industry:      [eCommerce / SaaS / Services / etc.]
Role to demo:  CS / Moderator / Analyst / Outreach / SDR / Ad Tracker / Retention
Business size: [Revenue range or employee count if known]
Pain points:   [What specific problems did they mention on the call?]
Real details:  [Products, tools they use (Shopify/Klaviyo/etc.), team names, specific
               scenarios discussed — e.g. "a large customer who went quiet"]
Brand notes:   [Colours if known, tone (formal/casual/technical/warm), their terminology]
```

If the user gives only a brand + a role, that's enough to start — research fills the rest.

## Building scenarios (the content that makes it land)

Each scenario in the feed follows the same 4-step beat the engine already implements:
arrive → classify (4 cards) → draft (+approve) → confirmation + stats. For each one, define:
sender + context · arrival line (narrative bar, 1 plain-English sentence) · reading line ·
4 classification cards (type / key data / priority / action) · draft label · draft narrative
line · draft body (full reply in the brand's voice) · done line · minutes saved · founder
seconds. See `references/playbook.md` → "Scenario construction" and the worked Printmoz
example. **Use real product names, real tools, and dollar amounts realistic for their size.**

## Validation (do this every time, before presenting)

- Open the file's `<script>` and run `node --check` on it — JS must parse cleanly. A single
  syntax error freezes the whole demo on the loading spinner.
- Confirm file size is under ~30,000 characters (`wc -c`). Compress CSS / shorten JS names
  if over.
- Grep for the failure modes in `references/build-spec.md` → "Do not do these": no
  `textContent` on the narrative bar, no dynamic IDs on the approve elements, no duplicate/
  collided class names, no auto-replay.
- Sanity-check the personalisation: the founder's real name, real products, and the call's
  pain point as scenario #1 are all present.

## Reference files

- `references/playbook.md` — The offer, the 7 AI roles + which use an approval flow,
  validated pain points, role selection, scenario construction, the worked Printmoz example,
  the examples library, and "what makes a demo land". Read for *what to put in* the demo.
- `references/build-spec.md` — The 8 non-negotiable design principles and the critical
  technical rules + "do not do these". Read for *how to build it correctly*. **Always read
  this before editing the HTML.**
- `references/deploy.md` — How to ship the finished `.html` on Vercel + GitHub.
- `assets/reference-demo.html` — The gold-standard template to clone.

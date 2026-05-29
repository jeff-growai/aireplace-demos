# AI Replace — Build Spec (how to build it correctly)

Read this before editing the HTML. The reference template already obeys all of it; this
exists so you keep it that way when you change content, and so you can extend it for other
roles without reintroducing the classic freeze bugs.

## Stack

Pure HTML/CSS/JS, single file. No frameworks, no dependencies except Google Fonts
(Montserrat for headlines/UI, JetBrains Mono for code/data labels). Must work by opening
the file in any browser. Keep it **under 30,000 characters** — compress CSS and use short
JS variable names if it grows; build via a script if needed to avoid truncation.

## Brand identity

AI Replace base palette: dark green `#111F17`, teal `#0A8C6E`, teal-dark `#076B53`,
teal-light `#E4F4EF`, background `#F5F8F6`, white `#FFFFFF`. For client-branded demos, adapt
the scheme to the client's brand (their logo colours, fonts, personality) while keeping the
AI Replace wordmark in the topbar. **Topbar is always `[Client brand] | AI Replace.`** — side
by side with a separator.

## The 8 non-negotiable design principles

1. **One thing at a time.** Never show two things competing for attention. A prominent narrative
   callout bar (dark navy background, white headline) at the top of the right panel tells the
   viewer in plain English exactly what's happening at every moment. It's the first thing they read.
2. **Guided walkthrough format.** Left panel = inbox/feed (always-visible context). Right panel =
   active content that changes. The narrative bar drives attention. Each item follows the exact
   4-step sequence: arrive → classify (cards) → draft (+approve) → confirmation + stats update.
3. **The approve button is the centrepiece.** Large (16px+, generous padding), slow pulsing glow
   when visible, subtitle "[Name] approves · email sends instantly", on screen 2+ seconds before
   the simulated approval, and the most visually prominent element when shown.
4. **Classification cards.** 4 per item, appearing one at a time with ~360ms stagger. Card 1 type
   (navy) · card 2 key data/finding (amber for flags, teal for positive) · card 3 priority/urgency
   (navy or amber) · card 4 action taken (always teal — positive).
5. **Content clears between items.** When a new item arrives, the right panel immediately clears to
   a blank state ("New email detected · AI Replace is reading…") BEFORE the cards show. Never show
   the previous item's draft while a new one is being classified.
6. **No auto-replay.** End on the final state (last item approved, or the summary screen) and stay
   there. To watch again, reload the page.
7. **Stats bar at the bottom,** 4 stats updating in real time: Handled (total processed) · [Name]
   approved (clicks) · Saved today (minutes) · [Name]'s time spent (seconds total — the powerful one).
8. **Inbox dims when not the focus.** During classifying (the thinking step), the inbox panel dims to
   ~28% opacity so attention stays on the right panel. When the draft is shown, the inbox returns to
   full opacity.

## Critical technical rules (these prevent freeze bugs)

1. **Use `innerHTML`, not `textContent`,** for any element that receives HTML entities or formatted
   text. With `textContent`, `&middot;` renders as the literal string, not the dot. The narrative-bar
   `setN()` function must use `innerHTML`.
2. **Email/body strings — newline encoding.** Store body text with real newline characters. In JS
   string literals, `\n` must be a proper newline escape, not a literal backslash-n. (The reference
   uses `white-space:pre-wrap` on the draft body and `\n` in the strings.)
3. **Stable element IDs.** The approve elements use fixed global IDs: `APW` (approve wrapper), `APL`
   (approved line), and a fixed compose/body id. NEVER use dynamic IDs like `ab_e1` / `al_ct_e1` —
   per-item IDs create mismatches that freeze the demo. The engine reuses the same nodes each loop.
4. **Class-name collisions.** Never reuse a CSS class for two purposes. The classic mistake is `.ca`
   for both a content-area div and classify-card variants. Use distinct names (e.g. amber card is its
   own class).
5. **Async/await pattern.** All animation sequences use `async/await` with a Promise-based `sleep()`.
   Every step is awaited. Don't fire-and-forget — that's what causes overlapping states.

### setN() — the narrative bar (always innerHTML)

```javascript
function setN(icon, step, title, theme) {
  document.getElementById('narr').className = 'narr' + (theme ? ' ' + theme : '');
  document.getElementById('ni').innerHTML = icon;   // innerHTML, not textContent
  document.getElementById('ns').innerHTML = step;
  document.getElementById('nt').innerHTML = title;
}
```

### Approve button — fixed IDs, show/hide via class

```html
<div class="appwrap" id="APW">
  <button class="appbtn">✓ Approve &amp; Send</button>
  <div class="app-hint">Dom approves · email sends instantly</div>
</div>
<div class="appln" id="APL"></div>
```

```javascript
document.getElementById('APW').classList.add('vis');     // show with glow
await sleep(2400);
document.getElementById('APW').classList.remove('vis');  // simulate the click
await sleep(300);
var al = document.getElementById('APL');
al.textContent = '✓ ' + NAME + ' approved · sent ' + e.t;
al.classList.add('vis');
```

## Adapting the template for a different role

The reference is the AI CS Rep (approval flow). To build another role, keep the engine and:
- **Rename the feed** to fit the role (e.g. "Ad comments" for Moderator, "Leads" for SDR,
  "Data sources" for Analyst).
- **No-approval roles** (Moderator, Analyst, Ad Tracker, SDR qualification): skip the `APW`/`APL`
  beat and go straight from the draft/finding to the confirmation line. For the Moderator, the
  "action" is a real-time *hide* — show it happening (2.8s avg) rather than an approve click.
- **Adjust the stats labels** to the role's currency (comments hidden, leads qualified, $ recovered,
  budget reallocated) — but always keep "[Name]'s time spent" as the closing stat.

## Do not do these

- ❌ `textContent` on the narrative bar (entities render literally)
- ❌ Dynamic per-item IDs on the approve button / approved line (freezes the demo)
- ❌ Reusing a class name for two purposes
- ❌ Auto-replay (it restarts mid-pitch)
- ❌ Showing the previous item's draft when a new item arrives (clear the panel first)
- ❌ Generic product names (always research and use real ones)
- ❌ Rushing past the approve button (it needs 2+ seconds, pulsing — it's the centrepiece)
- ❌ Showing everything at once (one thing at a time, always)

# AI Replace — Playbook (what to put in the demo)

Table of contents:
1. About AI Replace (the offer)
2. The 7 AI roles
3. Role selection
4. Validated pain points
5. Scenario construction
6. Worked example — Printmoz (AI CS Rep)
7. Examples library
8. What makes a demo land

---

## 1. About AI Replace (the offer)

A done-for-you AI automation agency. AI Replace researches the client's business,
builds their custom AI system, deploys it on the client's own private server, and hands
it over. The client owns everything forever. One-time fee, built in 30 days.

- $28,000 flat fee · 30-day build
- Deployed on the client's own Hostinger VPS (private server — they own it)
- Client owns everything at handover — no subscriptions, no vendor lock-in
- Built on OpenClaw + n8n + Claude API
- Guarantee: keep building until spec is met; full refund after 3 revision cycles if it doesn't work
- 48-hour client response requirement, or the guarantee pauses
- 3 months complimentary support after handover

**Tagline:** "Built in 30 days. On your private server. One-time fee. You own it forever."
**Target client:** eCommerce brands or growing businesses doing $50k+/month with manual
operations eating time and headcount.
**Website:** getaireplace.com · **Operating entity:** Airam Technologies LLC DBA AI Replace (Dubai, UAE)
**Headcount + tools replaced across all 7 roles:** $9,000–$19,000/mo.

---

## 2. The 7 AI roles

Always use these exact names.

1. **AI CS Rep** — Handles every customer email automatically (order tracking, returns,
   product questions, FAQs) in the brand's voice, 24/7. Connects to Shopify to pull real
   order data before drafting. *Replaces a $2,000–$4,000/mo CS VA.*
2. **AI Moderator** — Monitors Meta ad comments in real time via the Meta Graph API. Hides
   negative/defamatory/damaging comments before new viewers see them. Avg hide time 2.8s.
   *Replaces brand damage, ad-performance degradation, manual comment management.*
3. **AI Analyst** — Pulls from Shopify, Klaviyo, Google Analytics and revenue sheets weekly,
   finds gaps/opportunities, emails the founder a plain-English brief with action items, and
   assigns tasks to the team (Asana or equivalent). *Replaces an $800–$2,000/mo reporting VA.*
4. **AI Outreach Rep** — Researches influencers/prospects, reads recent content (last 6 posts,
   engagement, niche fit), scores brand fit, finds contact email, writes a personalised email
   referencing something specific, sends with auto follow-ups. *Replaces GRIN ($2,083/mo) or
   an outreach VA.*
5. **AI SDR** — Qualifies inbound leads via AI chat (ManyChat or quiz funnels), scores against
   the brand's criteria, routes qualified leads to a booked call and unqualified to a lower-ticket
   offer. Can trigger a VAPI AI phone call for deeper qualification. *Replaces $1,500–$5,000/mo
   manual lead qualification.*
6. **AI Ad Tracker** — Reconciles Meta-reported ROAS against actual Shopify revenue, identifies
   which campaigns are truly profitable vs inflated by attribution, recommends budget reallocation.
   *Replaces Hyros ($1,600/mo) or Triple Whale ($300–$700/mo).*
7. **AI Retention Rep** — Runs abandoned-cart sequences, win-back campaigns for lapsed customers,
   and post-purchase upsell/cross-sell emails (Shopify + Klaviyo). Identifies high-value customers
   who haven't reordered and drafts personalised outreach for founder approval. *Replaces a
   $1,500–$3,000/mo email/retention VA.*

---

## 3. Role selection

Match the demo to what the prospect raised on the call:

| They said… | Role |
|---|---|
| "CS emails taking too much time" | AI CS Rep |
| "Negative comments on our ads" | AI Moderator |
| "Reports nobody has time to pull" | AI Analyst |
| "Influencer outreach we never get to" | AI Outreach Rep |
| "Leads going cold / no follow-up system" | AI SDR |
| "ROAS data doesn't match Shopify" | AI Ad Tracker |
| "Abandoned carts / no retention sequences" | AI Retention Rep |

**Approval flow per role** (the reference template implements the approval flow; remove the
approve step for the "no approval" roles by skipping the `APW`/`APL` beat and going straight
to the confirmation line):

- AI CS Rep → **approval** (founder reviews before sending)
- AI Moderator → **no approval** (automated, real-time hiding — show the hide happening)
- AI Analyst → **no approval** (sends the brief directly to the founder's inbox)
- AI Outreach Rep → **approval** (founder approves each outreach)
- AI SDR → **no approval** on qualification; **approval** on the VAPI call trigger
- AI Ad Tracker → **no approval** (reports/recommends); founder acts on the recommendation
- AI Retention Rep → **approval** for reactivation outreach

---

## 4. Validated pain points

From 9,200 data points across Reddit, Trustpilot, G2, Shopify App Store. Use these to make
demos feel true:

1. **Manual work / time drain** — founders and teams spending 40+ hrs/week on repetitive tasks:
   CS emails, reporting, outreach, comment moderation.
2. **VA trust and training barrier** — cost, turnover, and training time for VAs handling
   sensitive business data.
3. **Broken ad attribution post-iOS 14/15** — Meta reports ROAS that doesn't match Shopify;
   budget decisions made on bad data.
4. **Influencer/UGC outreach grind** — hours researching creators and writing personalised
   emails that never get done.

---

## 5. Scenario construction

Build 4–6 scenarios. Each becomes one object in the engine's data array. For every scenario define:

- **Sender + context** — who it's from, what it's about (use a real-sounding customer/vendor type).
- **Arrival line** — narrative bar, 1 plain-English sentence: what just arrived.
- **Reading line** — what the AI is doing while it "reads".
- **4 classification cards** — type (navy) / key data (amber for flags, teal for positive) /
  priority (navy or amber) / action taken (always teal).
- **Draft label** — the header above the drafted item.
- **Draft narrative line** — narrative bar during the compose step.
- **Draft body** — the full drafted reply in the brand's voice: realistic and specific.
- **Done line** — what was saved, in concrete terms.
- **Minutes saved** and **founder seconds** — realistic numbers.

Use real details: real product names from their site, real customer types, real vendors/tools,
dollar amounts consistent with their business size, and real team member names from the call.
The closer the demo is to their actual business, the harder it hits.

The **first scenario is the pain point from the call** — they must see their exact problem first.

**End screen** (always): coffee-cup emoji · bold headline "This runs every morning before
[Name] opens his/her laptop." · stat line "[X] emails handled · [Y] minutes saved · [Name]
spent [Z] seconds total".

---

## 6. Worked example — Printmoz (AI CS Rep)

The reference template *is* this demo. Context that shaped it: Dom Smith, owner of Printmoz
(printmoz.com), a custom print/signage company in Temecula CA; spends ~2 hrs/day on email
(14 hrs/week) he wants back for direct sales; three email types dominate (sales/bid, admin/billing,
agency coordination); has Shopify, no CRM; mentioned a cold email to the SF Zoo that opened a new
relationship (→ the reactivation scenario); his SEO agency sends monthly focus pages for approval;
goal is to sell the business in 4–5 years and reduce personal involvement.

The 5 scenarios: (1) school-district quote request → sales opportunity; (2) HP Financial Services
invoice reminder → admin/billing; (3) customer order status → AI queries Shopify, drafts reply with
real tracking; (4) AI-initiated Stripe reactivation → a $3,200 customer quiet 94 days, personalised
outreach (the SF Zoo story); (5) SEO agency monthly focus pages → AI summarises and drafts approval
with a priority note. Final stat line: "5 emails handled · 42 minutes saved · Dom spent 65 seconds total".

---

## 7. Examples library (built reference demos)

| Brand | Role | Key hook |
|---|---|---|
| printmoz.com | AI CS Rep | Shopify lookup + Stripe reactivation intelligence |
| seekinghealth.com | AI Analyst | Shopify + Klaviyo → weekly brief to Dr. Ben Lynch → Asana tasks |
| vshred.com | AI SDR | ManyChat lead qual → VAPI phone call → HTC/LTC routing |
| jamieanne.co | AI CS Rep | Skincare brand voice, pregnancy safety question, Osmosis products |
| gardencup.com | AI Outreach Rep | Creator research → personalised emails → soggy salad hook |
| biolongevitylabs.com | AI Moderator | Peptide brand, scam accusations hidden in real time |

---

## 8. What makes a demo land on a sales call

1. **The prospect's name is in the UI** — their actual name, not "BrandCo". "Dom approved · sent 8:14am".
2. **Their real products are referenced** — "Vinyl Banner 3'×6'", not "Product A".
3. **The pain point from the call is the first scenario** — they see their exact problem in 30 seconds.
4. **Dollar amounts are realistic for their size** — a $50k/yr business isn't recovering $50k carts.
5. **The approve button is given time** — 2+ seconds, pulsing. This is the product. Don't rush it.
6. **Time saved is concrete** — "Dom spent 65 seconds total" beats "saves hours every week".
7. **The tool integration is visible** — when the AI pulls a real Shopify tracking number, that's the
   "how is this possible" moment. Make it explicit in a classification card.
8. **End on the coffee screen** — the emotional close. Let it sit while the closer talks.

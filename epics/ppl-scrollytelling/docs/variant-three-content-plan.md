# Variant Three — Content Plan

**Status**: Draft, for review before building `explorations/03-variant-three.html`
**Continuity**: Same underlying scenario as Variant One/Two (healthcare scheduling buyer;
Carepoint Scheduler / SwiftDesk Health / Meridian Care OS) so the epic tells one story
explored three ways. Ratings, prices, and match% below are carried over unchanged from
Variant One/Two where they already exist.

## 0. What's different about this variant

Variant One and Two both lean on a single "match %" as the reason to trust a
recommendation. Variant Three's differentiator, per the `ue` audit
([[handoff]](./handoffs/advisor-wizard-recommendations-scrollytelling-handoff.md)), is
**real-shaped evidence standing in for a buyer-voice quote we don't have**:

- There's no call transcript for this flow — the wizard is self-serve, not an advisor
  call — so there's nothing to quote back to the buyer the way a "coming full circle"
  beat normally would.
- Instead, every recommended product carries 1-2 **attributed reviewer quotes**, each
  explicitly tagged to one of the *buyer's own stated priorities* — real G2 review
  content standing in for social proof, not invented buyer dialogue.
- Match % is kept, but demoted to illustrative/placeholder framing (per handoff §3 — no
  scoring engine exists) rather than the star of the argument. The requirement-quote
  coverage does the real persuasive work: Carepoint isn't the top pick because "91%,"
  it's the top pick because it's the only one with real evidence against all three
  stated priorities.
- Sub-rating bars (Ease of Use / Support / Value / Functionality) are **deliberately
  omitted** — unlike pros/cons, features, and reviews, the handoff + `ue` audit never
  confirmed those are real, queryable fields for this data. Flag as a possible addition
  later if confirmed, not something to fabricate now.

---

## 1. Sample dataset (data contract)

Shaped to match the real field names from the handoff (§2 wizard qualification, §4
per-product) and the `ue` audit (real review-quote shape from
`Reviews::SentimentFilteredReviewComponent`, real pros/cons shape from
`AggregatedSentimentSnippet`).

### 1.1 Buyer / wizard submission

```jsonc
{
  "company_size": "51-100",
  "industry": "Healthcare",
  "number_of_users": "21-100",
  "applications": [
    "Integrations with other tools",
    "Reporting & analytics",
    "Security & compliance"
  ],
  "currently_using": "Spreadsheets and a legacy on-prem scheduling tool",
  "why_shopping": "Our current tool doesn't scale with our patient volume, and we're spending too much time on manual scheduling.",
  "key_features": "Automated scheduling, HIPAA-compliant messaging, and reporting dashboards.",
  "already_evaluated": "A couple of generic scheduling apps — none had healthcare-specific compliance features.",
  "deployment": "Cloud",
  "price_range": "$10,000 - $25,000 per year",
  "timeframe": "Immediate",
  "buyer_request": "A demo",
  "integration": "integrated_suite"  // derived: 3 applications selected → 2+
}
```

Category link (market → categories, handoff §2): **Healthcare Scheduling Software**.

### 1.2 Products

Each product below only uses field types the handoff/audit confirmed real: identity,
rating, pricing, pros/cons (aggregated sentiment snippets), features (name + per-feature
rating), and individual attributed review quotes. `matchReasons` and `match_pct` are
explicitly placeholder (no scoring engine exists — handoff §3).

#### Carepoint Scheduler — Top Pick

| Field | Value |
|---|---|
| Vendor / est. | Carepoint Health, 2015 |
| Rating | 4.6 / 5 (312 reviews) |
| Price | $18,000/year · Cloud · Free demo |
| Match % (placeholder) | 91% |
| "Would recommend" stat | 94% |
| Standout stat | 40+ EHR integrations · 2 wk median setup |

Pros/cons (`AggregatedSentimentSnippet`-shaped — `text`, `sentiment_type`, `review_count`):
- Pro — "EHR Integrations" (134 reviews)
- Pro — "Reporting Dashboards" (98 reviews)
- Con — "Onboarding Time" (22 reviews)

Features (highlighted = matches a stated application/priority):
- EHR Integrations — 4.8★ **(highlighted — Integrations)**
- HIPAA-Compliant Messaging — 4.7★ **(highlighted — Security & compliance)**
- Reporting Dashboards — 4.6★ **(highlighted — Reporting & analytics)**
- Automated Scheduling — 4.5★
- Patient Reminders — 4.3★
- Mobile App — 4.1★

Review quotes:
1. *"The EHR sync just works — we stopped double-entering patient data on day one."*
   — Office Manager · Mid-Market Healthcare (51-100 employees) · 5/5 · title: "Finally,
   integrations that don't need a consultant" · **matches: Integrations with other tools**
2. *"Our compliance officer actually trusts the reporting now — it maps straight to our
   audit checklist."* — Practice Administrator · Mid-Market Healthcare · 4.5/5 · title:
   "Reporting we don't have to rebuild in Excel" · **matches: Reporting & analytics**

#### SwiftDesk Health

| Field | Value |
|---|---|
| Vendor / est. | SwiftDesk, 2018 |
| Rating | 4.3 / 5 (188 reviews) |
| Price | $9,200/year |
| Match % (placeholder) | 78% |
| "Would recommend" stat | 89% |
| Standout stat | $0 implementation fee · 12k+ active clinics |

Pros/cons:
- Pro — "Value for Money" (71 reviews)
- Con — "EHR Integration Depth" (40 reviews) — only connects to two of the buyer's
  named EHR systems (carried over from Variant One's "why-line")

Features:
- HIPAA-Compliant Messaging — 4.4★ **(highlighted — Security & compliance)**
- Reporting Dashboards — 4.0★ **(highlighted — Reporting & analytics)**
- Automated Scheduling — 4.5★
- Mobile App — 4.2★
- Patient Reminders — 4.1★
- EHR Integrations — 3.4★ *(not highlighted — the weak spot)*

Review quotes:
1. *"Messaging is HIPAA-compliant out of the box, which is all our compliance team
   asked for."* — Clinic Director · Small Business Healthcare (11-50 employees) · 4/5 ·
   title: "Does compliance without the overhead" · **matches: Security & compliance**
2. *"It's the cheapest option that still checked our must-haves — we just accepted we'd
   outgrow the integrations eventually."* — Office Administrator · Small Business
   Healthcare · 4/5 · title: "Good value, if you don't need deep EHR ties" · **general
   value quote, not tagged to a priority** (used to honestly surface the tradeoff)

#### Meridian Care OS

| Field | Value |
|---|---|
| Vendor / est. | Meridian Systems, 2011 |
| Rating | 4.7 / 5 (95 reviews) |
| Price | $24,500/year |
| Match % (placeholder) | 74% |
| "Would recommend" stat | 97% |
| Standout stat | <1 wk implementation · 24/7 support |

Pros/cons:
- Pro — "Implementation Speed" (33 reviews)
- Con — "Price" (19 reviews) — priced above the buyer's stated range

Features:
- Reporting Dashboards — 4.8★ **(highlighted — Reporting & analytics)**
- HIPAA-Compliant Messaging — 4.9★ **(highlighted — Security & compliance)**
- EHR Integrations — 4.5★ **(highlighted — Integrations)**
- Automated Scheduling — 4.6★
- Mobile App — 4.4★

Review quotes:
1. *"Every report we need for state audits is already a template — we just export it."*
   — Compliance Manager · Enterprise Healthcare (100-500 employees) · 5/5 · title:
   "Built like compliance was the first requirement, not an afterthought" · **matches:
   Security & compliance**
2. *"Implementation was under a week, which our old vendor said was impossible."* — IT
   Director · Enterprise Healthcare · 4.5/5 · title: "Fastest go-live we've had with
   clinical software" · **general quote (speed), ties to the buyer's "Immediate"
   timeframe rather than a named application priority**

---

## 2. Section-by-section content plan

Mapped to the SA reference's 8-beat structure, using only the real-shaped data above —
no invented buyer dialogue.

### Beat: You / Need — Hero + "What you told us"

- Eyebrow: *Your recommendation*
- Headline: **"You Told Us What Mattered. Here's Who's Actually Delivering It."**
- Sub: *Three healthcare scheduling platforms, evaluated against the three things you
  said couldn't slip — not just a match score.*
- Chips: `51–100 employees` `Healthcare` `Cloud` `Immediate` `$10,000–$25,000/year`
- Labeled callouts (styled as stated-answers, not spoken quotes — no blockquote+cite):
  - "Why you're shopping" → `why_shopping`
  - "What you need" → `key_features`
  - "What you've already tried" → `already_evaluated` *(new vs. V1/V2 — adds a beat of
    credibility: we know what didn't work)*
- Priority chips (from `applications`): `Integrations with other tools` `Reporting &
  analytics` `Security & compliance`
- Derived narrative line (the `integration` computed fact, per handoff §2): *"Since you
  flagged three priorities instead of one, we weighted platforms that handle all three
  together — not just the cheapest single-purpose tool."*

### Beat: Go / Search — The Landscape

Category-level framing, no product names yet (mirrors SA's rule — tease, don't reveal):

> Healthcare scheduling tools split hard on one axis: built for a single clinic, or
> built to survive an audit. <span class="highlight">Compliance and integration depth
> are what separate them</span> — not the scheduling grid itself, which looks similar
> everywhere.
>
> For a buyer moving immediately, on a defined budget, that means ruling out anything
> that treats HIPAA-compliant messaging or EHR sync as an add-on rather than core.

### Beat: Find / Take — Recommendations intro + 3 product cards

Intro line: *"These three are the strongest fit for what you told us mattered —
Integrations with other tools, Reporting & analytics, and Security & compliance."*

Per product, in card order (Carepoint → SwiftDesk → Meridian):
1. Header + badge (Top Pick / Free Trial-equivalent "Free demo" / none)
2. Stats row: rating, price, "would recommend" stat with count-up, standout stat
3. Pros/cons snippets (1 pro + 1 con minimum)
4. Feature chips, highlighted ones matching buyer's 3 priorities
5. Two attributed review quotes, each visibly tagged to the priority it matches (e.g. a
   small `Matches: Reporting & analytics` label above or beside the quote)
6. Narrative pitch (2 short paragraphs, ~80-100 words, SA-prompt-style: don't restate
   what the card UI already shows, focus on *why this buyer specifically*)

Draft pitch copy:

**Carepoint Scheduler** — *"With three priorities instead of one, most platforms make
you trade off — Carepoint doesn't. Its EHR sync covers 40+ systems, its messaging is
HIPAA-compliant by default, and its reporting dashboards are the reason 94% of
reviewers say they'd recommend it. At $18,000/year with a free demo, it's the only one
of the three with real evidence against everything you flagged."*

**SwiftDesk Health** — *"At $9,200/year, SwiftDesk is the value play — and its
HIPAA-compliant messaging genuinely holds up, per reviewers who cite it by name. The
honest tradeoff: it only connects to two of the EHR systems on your list today, so it
fits best if integration depth can wait."*

**Meridian Care OS** — *"Meridian's reporting and compliance tooling are the strongest
of the three — reviewers specifically cite audit-ready templates, not just dashboards.
It's priced above your stated range at $24,500/year, but if compliance reporting is the
priority that can't slip, it's the one built around that from the start."*

### Beat: Return — Resolution (no buyer-quote-echo)

Replaces SA's "reprise the buyer's own words" mechanic, since we have no transcript to
echo. Instead, a single narrated paragraph ties the three *stated* priorities directly
to the evidence just shown:

> You flagged integrations, reporting, and compliance as non-negotiable — not
> hypothetically, but as the reason your current tool doesn't work anymore. Carepoint is
> the only recommendation with reviewer-verified strength in all three, which is why the
> evidence above outweighs the match score next to its name.

### Beat: Change — Next steps

- One `<p>` per product, "choose this if...":
  - *Carepoint Scheduler — choose this if you want all three priorities covered without
    a compromise.*
  - *SwiftDesk Health — choose this if budget matters more than deep EHR integration,
    for now.*
  - *Meridian Care OS — choose this if compliance reporting is the one thing that
    absolutely cannot slip, and budget has room.*
- Insight-card bottom line: *"For the priorities you named, Carepoint Scheduler is the
  strongest fit-to-evidence ratio of the three."*
- CTA: reuse the real **"Get Expert Advice"** advisor-router component
  (`Products::Compare::AdvisorCtaCardComponent`, per handoff §6) as the "still want to
  talk to a human?" escape hatch, alongside the standard next action.
- Persistent `Sample data` badge stays, as in Variant One/Two.

---

## 3. Decisions (resolved)

1. **Section-indicator pill + instant data-overview stats**: in scope for V3, adapted
   from the SA reference app — a fixed top-center pill showing the current section name
   while scrolling, and an instant (no-animation-wait) stats strip up top (15 min-style
   call stat replaced with something real to us, e.g. "3 priorities" / "3 matches" /
   requirement count) before the reveal-on-scroll content.
2. **Quote priority tags**: reuse the exact same badge component/style as the hero's
   priority chips (`elv-status-badge`), just relabeled per quote (e.g. "Matches:
   Reporting & analytics") — same shape/color as the hero chips so the thread from
   "you said this mattered" → "here's proof" reads as one visual system, not a new one.
3. **3 products**: confirmed, keeping Carepoint / SwiftDesk / Meridian as in V1/V2.

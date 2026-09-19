# Advisor Wizard → Recommendations: Content Handoff for Scrollytelling Spike

**Date**: 2026-09-18
**Author**: Sam Childs (via Claude)
**Status**: Handoff — for an agent spiking on scrollytelling conventions/assets
**Branch**: `schildsG2/advisor-wizard-fullpage`
**Related doc**: `docs/handoffs/advisor-wizard-exploration.md` (original wizard-field spike, 2026-09-03)

---

## Scope of this document

This is a **data handoff, not a design brief**. It exists to answer one question: *what information does the recommendations page have to display?* It deliberately says nothing about scrollytelling conventions, animation, pacing, or asset style — that's the receiving agent's spike to run. Where a decision has already been made about layout paradigm (see §6), it's stated as a constraint to design within, not a suggestion to second-guess.

---

## 1. Where this fits

The **advisor wizard** (`app/controllers/software_advice_advisor_router_controller.rb`, 11 steps under `app/views/software_advice_advisor_router/steps/`) collects buyer qualification info through a full-page flow. Its outcome is pivoting: originally "fill this out so a human advisor calls you," now "answer these and get a recommended list of products" (see `[[advisor-wizard-outcome-pivot]]` memory).

**Today, the destination after submission doesn't exist.** The success step (`app/views/software_advice_advisor_router/steps/_step_success.html.slim:9-10`) has an explicit TODO:

```
/ TODO: href is a placeholder (sends the buyer back where they came from) until the
/ actual recommendations output page exists — swap this once that destination ships.
```

That missing page is what the scrollytelling spike is for.

Two earlier layout directions were explored and are **not** what we're building now, but are worth knowing about so they don't get silently re-litigated:
- A **compare-page-style layout** (product cards, pros/cons, integrations, reviews, etc., stacked vertically) — prototyped in Figma (see §7). This is being **superseded by scrollytelling as the presentation paradigm**. The *content sections* it validated (what data to show) are still relevant — see §4 — even though the layout won't be a static comparison page.
- **Redirecting to G2's actual compare page** with the recommended products pre-selected — investigated and **shelved** (`[[advisor-wizard-compare-redirect-shelved]]` memory). The product-slug part of that would still work as a deep link if ever needed as a secondary "compare these yourself" exit, but it's not the primary experience.

---

## 2. Data guaranteed to exist: what the buyer told us

Every wizard submission produces a `SoftwareAdviceFormFill` with a `metadata['qualification']` jsonb hash (not dedicated DB columns — see `[[advisor-wizard-metadata-storage]]` memory). These are the fields a scrollytelling narrative can draw on to personalize the story ("based on what you told us..."):

**Company profile**
| Field | Values |
|---|---|
| `company_size` | 1-10, 11-50, 51-100, 100-500, 500+ employees |
| `industry` | free text (e.g. Construction, Healthcare, Finance) |
| `annual_revenue` | <$1M, $1-5M, $5-10M, $10-50M, $50M+ |
| `number_of_users` | 2-5, 6-20, 21-100, 100+ |

**Need signals**
| Field | Values |
|---|---|
| `applications` | multi-select: Core/must-have features, Integrations with other tools, Reporting & analytics, Mobile access, Customer support & onboarding, Security & compliance |
| `currently_using` | free text — what they use today |
| `why_shopping` | free text, required — motivation to switch |
| `key_features` | free text, required — specific must-haves |
| `already_evaluated` | free text, required — competitors already looked at |
| `deployment` | Cloud, On-premise, Not determined — required |
| `price_range` | free text, required (e.g. "$10,000 - $25,000 per year") |

**Timing/intent**
| Field | Values |
|---|---|
| `timeframe` | Immediate, 1-3mo, 3-6mo, 6-12mo, Just researching — required |
| `buyer_request` | A demo, Pricing information, General information |

**Derived (not directly asked)**
- `integration` — computed as `best_of_breed` (1 application selected) vs `integrated_suite` (2+), from `applications` count. Currently only used to route the lead into the PPL/advisor system, but it's a good example of a "computed narrative fact" — e.g. a beat like *"Since you need things to work together, we weighted integration support heavily"* — rather than raw field values.

**Identity/logistics (steps 9–11): name, company name, job title, city/state/zip, email, phone, contact preference.** These exist but are *not* candidate content for the story — they're who-to-reach-you fields, not why-we-picked-this signal.

**Category linkage:** the wizard's `market` (`SoftwareAdviceMarket`) has a `has_many :categories` association — this is the **only structured link** from the wizard to an actual G2 product category today (e.g. picking the "Inventory Management" market maps to G2's Inventory Management category).

---

## 3. Critical gap: there is no recommendation engine yet

Grepped the wizard controller and adjacent models specifically for this — confirmed **no matching, scoring, or confidence logic exists anywhere in this codebase** for turning wizard answers into a ranked product list. What exists:
- `SoftwareAdviceMarket → categories` gives you *a category*, not specific ranked products.
- Nothing computes a "match %" or "confidence" value for any product against a buyer's answers.

**Implication for the spike:** design against a data contract, not real data. Assume the page will eventually receive something like *an ordered list of N products, each with a confidence/match value and supporting attributes (§4)* — but that ranking/scoring logic doesn't exist and isn't in scope for this spike either. Prototype with placeholder values, and treat "how confidence is computed" as an open dependency to flag back, not a problem to solve as part of the storytelling exploration.

---

## 4. Data that IS available per-product, once a product list exists

From auditing G2's compare page, research boards, and best-of lists (all real, working code — not mockups), the following attributes are real and renderable for any product once selected:

- **Identity**: logo, name, vendor, category — `Elevate::ProductDetails::Component`
- **Rating**: star rating + review count — `Elevate::StarRating::Component`
- **Pricing**: starting price, free trial/demo flags — `app/views/comparisons/sections/_pricing.html.slim`
- **Pros & Cons**: AI-derived sentiment snippets, real per-product — `Comparisons::Sections::ProsAndConsComponent` (pulls `top_sentiment_snippets`)
- **Integrations**: list of related/integrated products — `_integrations.html.slim`
- **Screenshots**: product UI screenshots — `_screenshots.html.slim`
- **Key features**: named features with per-product star ratings — `_features.html.slim`
- **Reviews**: individual review snippets (reviewer, quote, role) — `_reviews.html.slim`
- **AI summary**: an existing "AI-generated summary" content block (sparkle icon, generated description) on the compare page — `_glance.html.slim`. This is a good existing mechanism for turning free-text wizard fields (`why_shopping`, `key_features`, etc.) into a natural-language narrative beat instead of raw form dump.

**Caveat — not verified as real data:** the Figma exploration mock (§7) includes a "Who uses this" block (e.g. "Popular among small businesses," "Most common industries: X% / Y%," "Top use cases") and an "XX% of users recommend this product" stat. I did not confirm these are backed by real, queryable data in this codebase — treat them as illustrative/placeholder from the mock, not confirmed available content, until someone checks.

---

## 5. "Based on your criteria" — prior art for personalization copy

We'd previously drafted placeholder chip content pulling from §2's fields, for a compare-page-style header. It's not a mandate for the scrollytelling version, just a reference for what "explain the why" content could look like:

> Based on your criteria: `51–100 employees` · `Core / must-have features` · `Integrations with other tools` · `$10,000–$25,000/year` · `Cloud` · `Immediate`

The recommendation (not a requirement) was to surface ~4-5 of the most explanatory fields rather than all of them, and to consider turning the free-text fields into one AI-summarized sentence rather than literal chips. Whatever narrative form the scrollytelling version takes, the underlying source fields are the same ones in §2.

---

## 6. Decisions already made (don't re-litigate without cause)

- **Outcome pivot**: the page's job is to hand the buyer a recommendation, not just promise a future phone call. Contact fields are supporting, not the payoff.
- **Compare-page redirect**: shelved. Don't propose sending buyers to G2's actual `/compare/*products` page as the primary outcome.
- **Presentation paradigm**: scrollytelling, not a static compare-page-style stacked layout — that's the reason for this handoff.
- **Existing "Get Expert Advice" CTA** (`Products::Compare::AdvisorCtaCardComponent`, extending `AdvisorRouter::CtaCardComponent`) is already wired to launch this very wizard (`[[advisor-wizard-cta-entry-point]]` memory). It's a ready-made component for a "still want to talk to a human?" fallback/escape hatch woven into the scrollytelling narrative, rather than something to build from scratch.

---

## 7. Reference links

- Figma — applied/repurposed compare layout: https://www.figma.com/design/onn8HlR0LT5rk2XotF2RxC/IDL--MVP-to-PPL-advisors-?node-id=828-25981
- Figma — original source layout + states: https://www.figma.com/design/onn8HlR0LT5rk2XotF2RxC/IDL--MVP-to-PPL-advisors-?node-id=811-84582
- Wizard steps: `app/views/software_advice_advisor_router/steps/_step_1.html.slim` through `_step_11.html.slim`, `_step_success.html.slim`
- Wizard controller: `app/controllers/software_advice_advisor_router_controller.rb`
- Locale copy: `config/locales/en.yml`, `advisor_wizard:` key
- Model: `app/models/software_advice_form_fill.rb`, `app/models/software_advice_market.rb`
- Compare page sections (real, reusable rendering logic): `app/views/comparisons/sections/`
- Prior wizard-field spike: `docs/handoffs/advisor-wizard-exploration.md`

**Note on branch state**: this branch (`schildsG2/advisor-wizard-fullpage`) is significantly behind `main`, including unrelated compare-page redesign work landed there (see `[[advisor-wizard-fullpage-main-drift]]` memory) — if the receiving agent needs to check current live behavior of anything referenced above, verify against `main`, not just this branch.

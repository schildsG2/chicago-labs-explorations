# PPL Scrollytelling Epic — Agent Context

## Epic Overview

**PPL Scrollytelling** explores a scroll-driven narrative format for the
**advisor wizard's recommendations page** — the destination a buyer lands on after
completing the [PPL Form Flow](../ppl-form-flow/) wizard, which today doesn't exist yet
(see the content handoff below). Sticky visuals paired with scroll-triggered copy beats,
rather than a static stacked compare-page-style layout.

**Problem Space:**
- The advisor wizard's success step currently has a TODO placeholder — there is no
  recommendations destination page yet
- A static compare-page-style layout (product cards, pros/cons, integrations, reviews)
  was prototyped in Figma but is being **superseded by scrollytelling** as the
  presentation paradigm — see the content handoff, §1 and §6
- There is **no recommendation/matching engine yet** — this epic prototypes against a
  data contract (an ordered list of products with placeholder confidence/match values),
  not real ranked data

**Hypothesis:**
A scrollytelling format — a fixed/sticky visual that updates as the reader scrolls
through short narrative beats grounded in the buyer's own wizard answers ("based on
what you told us...") — can build understanding of and confidence in a product
recommendation faster and more memorably than a conventional stacked compare page.

> The specific narrative structure, visual metaphor, and pacing are this epic's
> job to design — the handoff below is a data contract, not a design brief.

## Key References

- **Content handoff**: [`./docs/handoffs/advisor-wizard-recommendations-scrollytelling-handoff.md`](./docs/handoffs/advisor-wizard-recommendations-scrollytelling-handoff.md) —
  data contract for what the advisor wizard → recommendations page has to display (buyer
  qualification fields, per-product attributes, what's real vs. placeholder). This is a
  **data handoff, not a design brief** — it says nothing about scrollytelling conventions,
  animation, or pacing; that's this epic's job. Read this before building any exploration
  that claims to show real recommendation content.
- **Techniques spike**: [`/research/spikes/scrollytelling-techniques-spike.html`](../../research/spikes/scrollytelling-techniques-spike.html) —
  audit of 3 live scrollytelling sites + a 7-technique video breakdown, distilled into a toolkit of what's achievable
  given this epic's constraint: **no video, no 3D assets** — delight has to come from typography, data
  visualization, and card/UI composition. Read this before designing a new exploration's motion/visual approach.
- **Brand guidance**: [`/research/spikes/scrollytelling-brand-guidance.html`](../../research/spikes/scrollytelling-brand-guidance.html) —
  G2 brand-creator skill's rules (color/type tokens, voice, motion anti-patterns) translated for scrollytelling
  specifically. Notes one deliberate override: this epic follows **Elevate's `text-default` (#201f23)**, not the
  brand skill's marketing-collateral black (#111), since this is a product UI surface. Read this alongside the
  techniques spike before writing any narrative copy or choosing colors/motion for an exploration.
- **Related epic**: [`../ppl-form-flow/`](../ppl-form-flow/) — PPL qualification wizard flow (the wizard that produces the data above)
- **Explorations**: `./explorations/` (numbered, hypothesis-driven — one variant per scrollytelling approach)

## Design Principles

Follow Elevate design system specifications:
- Use `shared/elevate-prototyping-kit/` for all CSS (tokens, components, utilities, icons)
- Purple accent (#5746b2) for brand elements and primary CTAs
- Never pure black — use `text-default` (#201f23)
- 4px spacing base for all layout
- Scroll-driven motion should be subtle and performant — avoid janky scroll-jacking

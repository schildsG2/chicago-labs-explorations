# Bulk Purchase (Elevate)

**This is the Elevate-converted version of the bulk-purchase epic.** Uses UE Elevate design system components and tokens for 1:1 production fidelity. Compare with the [original version](../bulk-purchase/).

Redesign of the credits and subscription purchasing flow. Exploring how to present credit bundles, subscription tiers, and upgrade paths in a way that reduces friction and clarifies value.

## Current Direction

`07-radio-expansion` — radio-based selection with expandable detail. Most refined exploration to date.

## Explorations

| # | Name | Hypothesis |
|---|------|-----------|
| 01 | credits-first | Lead with credit amount; pricing is secondary |
| 02 | dual-status | Show current plan + upgrade side by side |
| 03 | smart-unified | Single unified view that adapts to plan state |
| 04 | tab-toggle | Tab between credits and subscription views |
| 05 | side-by-side-cards | Card grid comparison layout |
| 06 | tabbed-selection | Tabbed quantity selector |
| 07 | radio-expansion | Radio group with expandable tier detail |

## Additional Pages

- `manage-plan/index.html` — Active plan management view
- `manage-plan/inactive.html` — Inactive/lapsed state

## Research

- [Credit & Subscription Pricing Research](../../research/spikes/bulk-purchase-credit-subscription-pricing.md) — Competitive pricing patterns from Adobe, ElevenLabs, and others

## Open Questions

- [ ] How do we handle the transition from trial → paid without breaking the current flow?
- [ ] Does the radio pattern still work at 5+ tiers?

---

## Elevate Conversion Notes

This version uses:
- **Elevate design tokens** for colors, spacing, typography
- **Elevate component classes** (`.btn`, `.btn--primary`, etc.)
- **Elevate utilities** (`elv-flex`, `elv-gap-4`, etc.)
- **Production-ready CSS** symlinked from UE

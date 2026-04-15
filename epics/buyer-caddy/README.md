# Epic: Buyer Caddy

Surfacing buyer tech stack intelligence within G2's email personalization workflow. The core idea: when a rep unlocks a company, they see what software that company uses, which informs smarter, more relevant outreach.

## Current Direction

`04-stack-aware-email` — inline stack display within the email composition context. Most integrated exploration to date.

## Explorations

| # | Name | Hypothesis |
|---|------|-----------|
| 01 | tech-stack-filter | Filter companies by tech stack before unlock |
| 02 | stack-preview-column | Stack as a data column in the prospect table |
| 03 | unlock-enrichment | Stack revealed at moment of unlock |
| 04 | stack-aware-email | Stack embedded inline in email editor context |
| 05 | intent-trigger-events | Combine stack + trigger events (funding, hires) |

### Layout Variants
- `stack-layout-01-pill-cloud` — Products as a pill/tag cloud
- `stack-layout-02-flat-table` — Tabular list with categories
- `stack-layout-03-category-cards` — Grouped by category cards

### Stack States
- `stack-state-loading` / `stack-state-refreshing` / `stack-state-error`
- `stack-state-null` / `stack-state-stale` / `stack-state-no-credits`

### Unlock Flow Variants
- `unlock-01-stack-enrichment` — Unlock reveals stack
- `unlock-02-email-personalization` — Unlock flows into email generation
- `unlock-03-trigger-events` — Unlock with event feed

## Research

- [BuyerCaddy API Spike](../../research/spikes/buyercaddy-api-spike.md) — Full API reference: endpoints, auth, integration flow, gaps to validate

## Open Questions

- [ ] Credit cost per API call — needs pricing breakdown from BuyerCaddy before designing the unlock flow
- [ ] `find-techstacks-for-company` endpoint returns person profiles, not stack data — needs hands-on testing
- [ ] Caching strategy: how often does stack data need to be refreshed?

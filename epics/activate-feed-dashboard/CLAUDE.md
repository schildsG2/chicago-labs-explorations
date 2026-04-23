# Activate Feed Dashboard — Epic Context

## Problem Framing

G2 Activate users need a clear, actionable view of which companies are viewing their profile, with emphasis on:
- **Real-time engagement signals**: Who's looking now
- **Intent indicators**: High vs. medium vs. low engagement
- **Company context**: Size, location, industry to inform outreach strategy
- **Velocity**: When companies viewed (recency matters)

The feed is the primary engagement surface — it's where users decide who to reach out to and when. Every iteration should make that decision faster and more confident.

## Current Direction

Two-column dashboard layout:
- **Left panel**: High-level stats (locked vs. unlocked companies) and primary CTA to G2 Activate
- **Right panel**: Scrollable feed of company cards, each showing:
  - Blurred company name (unlock gate)
  - Employee count
  - Location
  - Industry
  - Intent signal (chip/badge)
  - Timestamp

Focus is on the **feed experience**: card density, information hierarchy, intent signal clarity, and scroll behavior.

## Epic Goal

Iterate toward the optimal feed presentation that:
1. Makes intent signals immediately scannable
2. Provides enough context to prioritize outreach without overwhelming
3. Creates urgency through recency and intent visualization
4. Maintains unlock motivation (blurred names as teaser)

## Design Constraints

- **Elevate-first**: All components from Elevate design system
- **Information density**: Feed should feel rich but not cluttered
- **Mobile consideration**: Layout should adapt to narrower viewports
- **Performance**: Feed may contain 100+ items, scroll must be smooth

## Key Questions to Explore

1. **Card density**: How much whitespace is optimal for scanning?
2. **Intent visualization**: Are chips sufficient or do we need stronger signals (icons, colors, positioning)?
3. **Grouping**: Should high-intent companies be visually separated from medium/low?
4. **Timestamp prominence**: How much weight should recency have in the hierarchy?
5. **Company info priority**: Employee count, location, and industry — what order matters most?

## Next Explorations

- [ ] Alternative intent visualizations (beyond chips)
- [ ] Grouping strategies (high intent at top, visual dividers)
- [ ] Compact vs. spacious card variants
- [ ] Filter/sort controls for the feed
- [ ] Mobile-optimized layout (single column)

## Related Epics

- **Bulk Purchase**: Purchasing flow after user decides to unlock companies
- **Buyer Caddy**: Intelligence that could enhance company cards with tech stack data

## Resources

- [Elevate Design System](../../../shared/elevate-lite/design-system/DESIGN.md)
- [Elevate Component Templates](../../../shared/elevate-lite/components/templates/)
- [G2 Activate (Live)](https://www.g2.com/activate) — reference for current implementation

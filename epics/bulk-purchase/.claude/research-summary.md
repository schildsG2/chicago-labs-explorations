# ElevenLabs Credit + Subscription Pricing Research Summary

## Research Completed: April 10, 2026

### Overview
Comprehensive research conducted on ElevenLabs' credit-based subscription pricing model, including pricing tiers, credit system mechanics, dashboard UI patterns, and upgrade flows.

### Key Findings

#### 1. Pricing Structure
- **7-tier model**: Free → Starter ($5) → Creator ($22) → Pro ($99) → Scale ($330) → Business ($1,320) → Enterprise (custom)
- **Credit allocations**: 10k, 30k, 100k, 500k, 2M credits per month
- **Annual discount**: ~17% savings (2 months free)
- **Visual pattern**: Card-based layout with side-by-side comparison tables

#### 2. Credit System Terminology
- **Primary unit**: "Credits" (synonymous with "characters per month")
- **Conversion**: 1 credit = 1 character (standard models), 0.5-1 credit for Flash/Turbo models
- **Usage translation**: Always shows credit-to-minute conversion (e.g., "10k credits = ~10 min")
- **Rollover**: Unused credits carry forward up to 2 months on paid plans

#### 3. Dashboard & UI Patterns
- **Access**: Profile icon (top right) → Subscription
- **Usage Analytics**: Developers sidebar → Usage tab
  - Metrics: Credits, Minutes, Seconds to First Byte
  - Breakdown by: Voice, Product, API key
  - Date ranges: Day, Week, Month, Cumulative
  - Export to CSV
- **Design aesthetic**: "Clean and in control", minimal yet powerful

#### 4. Upgrade/Purchase Flows
- **Immediate upgrades**: New billing cycle starts right away, unused credits roll over
- **Downgrades**: Take effect at cycle end, preserve quota until then
- **Usage-Based Billing (UBB)**: Available Creator+, with configurable thresholds
- **Payment methods**: Credit Card, Apple Pay, Google Pay, UPI (India)
- **Platform split**: Web (Stripe) vs Mobile (App Store) management

#### 5. Standout UX Patterns
1. **Credit translation** for user understanding
2. **Usage-based billing** as safety net (configurable thresholds)
3. **Generous rollover** (2 months)
4. **Commercial rights prominence** (critical differentiator)
5. **Model-based pricing** (incentivizes efficiency)
6. **Workspace abstraction** (personal vs team contexts)
7. **Progressive disclosure** (features revealed by tier)

#### 6. Visual Patterns Identified
- Card-based tier presentation
- Side-by-side comparison tables
- Prominent CTAs for commercial rights messaging
- Profile icon as primary navigation point
- Sidebar navigation pattern
- Modal overlays for subscription management
- Metric/breakdown menu pattern for analytics

### Research Limitations
- **No direct screenshots obtained** due to site access restrictions
- Relied on official documentation, help articles, and third-party reviews
- Figma Community file exists but was inaccessible

### Next Steps Required
1. **Manual screenshot collection**:
   - Visit elevenlabs.io/pricing (pricing page layout)
   - Sign into account (dashboard, subscription settings, usage analytics)
   - Capture checkout/upgrade flows if accessible
2. **Add screenshots to Figma** with descriptive labels
3. **Annotate visual patterns** (spacing, typography, color usage)

### Sources
**Primary**: elevenlabs.io (pricing, docs, blog, help center)
**Secondary**: SaaSworthy, Flexprice, BIGVU, UXSnaps
**Design**: GitHub elevenlabs/ui, ui.elevenlabs.io

### Deliverable Location
**Figma**: File 7tZuGDPePNGXddvLMr3gqb
**Section**: "ElevenLabs Research" (1400x3067px frame)
**Contents**: 7 organized sections with comprehensive findings

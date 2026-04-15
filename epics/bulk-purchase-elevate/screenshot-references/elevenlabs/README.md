# ElevenLabs Credit + Subscription Pricing UI Research

**Date Collected:** April 10, 2026  
**Researcher:** Claude Code Agent  
**Purpose:** Visual research for credit-based subscription pricing patterns

---

## Overview

ElevenLabs uses a hybrid pricing model combining:
- **Fixed monthly subscriptions** with included credit allocations
- **Usage-based billing** (optional overage charges)
- **Credit rollover** up to 2 months worth of credits
- **Tiered discounts** for higher volume plans

---

## Pricing Tiers (2026)

### Plan Structure

| Plan | Price/Month | Credits Included | Equivalent Minutes (TTS) | Key Features |
|------|-------------|------------------|-------------------------|--------------|
| **Free** | $0 | 10,000 | ~10 min | Non-commercial use, no commercial rights |
| **Starter** | $5 | 30,000 | ~30 min | Entry point for commercial use, instant voice cloning |
| **Creator** | $22 ($11 first month) | 100,000 | ~100 min | Professional voice cloning, 30 custom voices |
| **Pro** | $99 | 500,000 | ~500 min | 160 custom voices, priority processing, extended audio (60 min) |
| **Scale** | $330 | 2,000,000 | ~2,000 min | 660 custom voices, 3-seat workspaces, multi-user collaboration |
| **Business** | $1,320 | 11,000,000 | ~11,000 min | 5-seat workspaces, advanced team features |
| **Enterprise** | Custom | Custom | Custom | SSO, HIPAA/BAA compliance, custom SLAs |

### Credit System

- **1 credit = 1 character** (Multilingual v2 model)
- **0.5 credits per character** (Flash and Turbo models)
- Credits reset monthly on billing anniversary
- Unused credits roll over for up to 2 months on paid plans
- Annual billing offers ~17% savings (2 free months)

---

## Usage-Based Pricing (Overages)

ElevenLabs offers optional usage-based billing on Creator, Pro, Scale, and Business plans.

### How It Works

1. User enables usage-based billing in subscription settings
2. Once monthly quota is exhausted, additional usage is charged at per-unit rates
3. Billing occurs at end of cycle OR immediately if overages exceed 2x monthly subscription fee
4. Tiered pricing: higher plans get lower overage rates

### Overage Pricing Examples

| Feature | Creator | Pro | Scale | Business |
|---------|---------|-----|-------|----------|
| **TTS (per 1K chars)** | $0.30 | $0.24 | $0.18 | $0.12 |
| **Voice Tools (per min)** | $0.30 | $0.24 | $0.18 | $0.12 |
| **STT API (per hour)** | $0.40 | $0.32 | $0.26 | $0.22 |
| **Dubbing (per min)** | $0.60 | $0.48 | $0.36 | $0.24 |

**Strategic Note:** If regularly using >1.5x plan quota, it's typically cheaper to upgrade to the next tier.

---

## UI Elements & Navigation

### Dashboard Access Points

Based on documentation and reviews, the ElevenLabs interface includes:

#### Main Navigation (Left Sidebar)
- Home Dashboard
- Text-to-Speech tools
- Voice Library
- Studio (audiobook/podcast creation)
- Dubbing
- Image & Video generation
- Agents (conversational AI)
- Music creation
- **Developers** (bottom of sidebar)

#### Profile Menu (Top Right)
- **Subscription** - billing, plan details, usage-based billing toggle
- Account settings
- Workspace management

### Credit & Usage Tracking

#### Subscription Page
Accessible via: Profile Icon → Subscription

**Features:**
- Current spend display
- Invoice history (via "Manage Subscription" button)
- Enable/disable usage-based billing toggle
- Payment method management
- Plan upgrade/downgrade options

#### Developers Tab
Accessible via: Sidebar → Developers (at bottom)

**Three Sub-Tabs:**

1. **Usage Tab**
   - Metrics dropdown: Credits, Minutes Used, Seconds to First Byte
   - Breakdown options: By voice, by product, by API key
   - Time period filters: Day, week, month, cumulative
   - Multi-seat workspaces can filter by individual user or group
   - Export to CSV

2. **Analytics Tab**
   - API request monitoring
   - Success rate tracking
   - Average latency metrics
   - Webhook activity

3. **Request Log Tab**
   - Individual API request inspection
   - Debugging and monitoring

### Dashboard Features Mentioned in Reviews

**Main Dashboard:**
- Dark-themed interface
- Unified view of all features
- Quick access to latest creations
- Feature categories organized by type (Video, Audio)

**Voice Controls:**
- Model selection dropdown (V3, Multilingual V2, Flash V2.5)
- Right sidebar with 3 adjustment levers:
  - Stability
  - Similarity  
  - Style exaggeration

**Voice Library:**
- 10,000+ community voices
- Filters: category, gender, age, accent, use case

---

## Key Pricing Communication Patterns

### Terminology Used

- **Credits** (not "tokens" or "API calls")
- **Characters** as unit of measurement
- **Monthly quota** (not "limit" - positive framing)
- **Usage-based billing** (not "overages" - opt-in framing)
- **Commercial rights** as tier differentiator
- **Custom voices** as slot-based feature quota

### Plan Positioning

1. **Free** - "Experimentation" (explicitly non-commercial)
2. **Starter** - "Entry point for commercial use"
3. **Creator** - "Most popular" (highlighted in marketing)
4. **Pro** - "Agencies, production studios, app developers"
5. **Scale** - "Growing businesses" (team collaboration emphasis)
6. **Business** - "Enterprise-level needs"

### Credit Rollover Messaging

- Positioned as benefit: "unused credits carry over"
- Capped at 2 months to prevent indefinite accumulation
- Only applies to paid plans (Free plan credits don't roll over)

---

## Missing Visual Assets

Despite extensive research, actual UI screenshots were not readily available through public channels. The following would be valuable to collect:

### High Priority
1. **Pricing page layout** - how tiers are visually compared
2. **Subscription page** - billing details and credit quota display
3. **Usage analytics dashboard** - credit consumption visualization
4. **Checkout flow** - plan selection and payment process
5. **Credit balance indicator** - where/how shown in main UI

### Medium Priority
6. **Usage-based billing toggle** - settings interface
7. **Plan upgrade modal** - in-app upgrade experience
8. **Out of credits notification** - warning/prompt design
9. **Invoice/billing history view**
10. **Mobile app credit display** (iOS/Android)

---

## Research Methods Used

### Web Searches Conducted
- "elevenlabs pricing screenshot 2026"
- "elevenlabs dashboard UI credits balance"
- "elevenlabs checkout upgrade flow screenshot"
- "elevenlabs buy credits a la carte purchase"
- "elevenlabs review screenshot dashboard 2026"
- "elevenlabs pricing comparison table image"

### Sites Consulted
- ElevenLabs official pricing page
- ElevenLabs documentation (elevenlabs.io/docs)
- ElevenLabs help center
- Third-party review sites (NerdyNav, DevOpsCube, etc.)
- SaaS comparison platforms (SaaSworthy, G2, Capterra)
- Pricing analysis blogs (Flexprice, Orb, eesel AI)

### Limitations Encountered
- Most review sites use text descriptions rather than screenshots
- ElevenLabs website uses JavaScript-rendered content (WebFetch returned only CSS)
- Help center documentation is text-based without embedded screenshots
- Reddit/YouTube searches yielded no specific UI screenshot results
- Rate limiting prevented access to some third-party sites

---

## Sources

### Official Documentation
- [ElevenLabs Pricing Page](https://elevenlabs.io/pricing)
- [Billing Documentation](https://elevenlabs.io/docs/overview/administration/billing)
- [Usage Analytics Documentation](https://elevenlabs.io/docs/overview/administration/usage-analytics)
- [Workspaces Documentation](https://elevenlabs.io/docs/overview/administration/workspaces/overview)
- [Credit Usage Help Article](https://help.elevenlabs.io/hc/en-us/articles/32811122443665-How-can-I-see-information-about-credit-usage-for-my-account)
- [What are Credits?](https://help.elevenlabs.io/hc/en-us/articles/27562020846481-What-are-credits)
- [Credit Rollover](https://help.elevenlabs.io/hc/en-us/articles/27561768104081-How-does-credit-rollover-work)
- [Usage-Based Billing](https://help.elevenlabs.io/hc/en-us/articles/27378406011409-What-is-usage-based-billing)

### Third-Party Analysis
- [BIGVU: ElevenLabs Pricing 2026 Breakdown](https://bigvu.tv/blog/elevenlabs-pricing-2026-plans-credits-commercial-rights-api-costs/)
- [Flexprice: Complete Guide to Plans & Overages](https://flexprice.io/blog/elevenlabs-pricing-breakdown)
- [NerdyNav: ElevenLabs Review 2026](https://nerdynav.com/elevenlabs-review/)
- [DevOpsCube: ElevenLabs Review 2026](https://devopscube.com/elevenlabs-review/)
- [SaaSworthy: Compare Plans](https://www.saasworthy.com/product/elevenlabs-io/pricing)

### Product Updates
- [Usage Analytics Dashboard Announcement](https://elevenlabs.io/blog/usage-analytics-dashboard)
- [Conversational AI Pricing Cut](https://elevenlabs.io/blog/we-cut-our-pricing-for-conversational-ai)

---

## Key Visual Patterns Observed

Based on textual descriptions from reviews and documentation:

### Design Language
- **Dark theme** primary interface
- **Clean, minimal** aesthetic
- **Sidebar navigation** (features on left, profile top-right)
- **Three-panel layouts** common (nav, main content, controls)

### Pricing Page
- **Columnar comparison** table for tiers
- **"Most Popular"** badge highlighting (Creator plan)
- **Character count** as primary quota metric
- **Feature checkmarks** for tier differentiation
- **Annual discount** callouts (17% savings)

### Dashboard Credit Display
- **Credits as primary metric** in Usage tab
- **Multiple visualization modes** (day/week/month/cumulative)
- **Breakdown filters** to segment usage
- **CSV export** for detailed analysis

### Terminology Consistency
- Consistently uses "credits" not "tokens"
- "Monthly quota" not "limit"
- "Usage-based billing" not "overages"
- "Commercial rights" as key differentiator

---

## Recommendations for Further Research

### Direct Access Methods
1. **Sign up for free account** - capture actual UI screenshots
2. **Trial paid plan** - document upgrade flow and subscription page
3. **Contact ElevenLabs** - request press kit or UI screenshots
4. **User interviews** - ask paying customers to share screenshots

### Alternative Research
1. **YouTube tutorials** - screen recordings may show UI
2. **Product Hunt** - launch posts often include screenshots
3. **Twitter/X** - users sometimes share subscription screenshots
4. **Discord/Slack communities** - active users might share UI examples

### Specific Flows to Document
1. Free → Starter upgrade journey
2. Credit exhaustion warning experience
3. Usage-based billing enablement flow
4. First invoice/billing cycle experience
5. Mobile app credit purchase (iOS/Android in-app purchase)

---

## Notes for Implementation

### Patterns to Consider Adopting

1. **Hybrid Model Benefits**
   - Fixed monthly base provides predictability
   - Usage-based option reduces "fear of running out"
   - Rollover rewards consistent users

2. **Transparent Metering**
   - Multiple breakdown views (by product, time, API key)
   - Real-time usage tracking
   - Export capability for analysis

3. **Upgrade Pathways**
   - Clear "upgrade prevents this problem" messaging when hitting limits
   - Immediate upgrade option (doesn't wait for next cycle)
   - Credit carry-forward on upgrades

4. **Terminology Choices**
   - "Credits" more tangible than "API calls"
   - "Quota" less limiting than "limit"
   - "Usage-based" more positive than "overages"

### Questions Raised

1. How prominent is credit balance in main UI?
2. What triggers upgrade prompts (90% used? 100%? after exhaustion?)
3. How are usage-based charges communicated before they occur?
4. Is there in-app credit purchasing separate from plan upgrades?
5. How do they handle the transition from free to paid (first payment UX)?

---

## Additional Resources Identified

### Mobile Apps (Potential Screenshot Sources)

ElevenLabs has two official mobile apps with app store screenshots available:

1. **ElevenLabs: AI Voice Generator**
   - iOS App Store: [apps.apple.com/us/app/elevenlabs-ai-voice-generator/id6743162587](https://apps.apple.com/us/app/elevenlabs-ai-voice-generator/id6743162587)
   - Features screenshots of voice generation UI
   - Shows credit/character display on mobile

2. **ElevenReader - Read Text Aloud**
   - iOS App Store: [apps.apple.com/us/app/elevenreader-read-text-aloud/id6479373050](https://apps.apple.com/us/app/elevenreader-read-text-aloud/id6479373050)
   - Available on both iOS and Android
   - 32+ languages supported

**Action:** Visit app stores to capture official screenshots showing mobile credit display

### Pitch Deck (Historical Pricing)

ElevenLabs' pitch deck materials are available through:
- [Best Pitch Deck breakdown](https://bestpitchdeck.com/eleven-labs)
- [Slidebean templates](https://slidebean.com/templates/eleven-labs)
- [VIP Graphics analysis](https://vip.graphics/elevenlabs-pitch-deck/)

These may contain early pricing strategy slides showing their original business model.

### Third-Party Comparison Articles

Articles with pricing comparison tables:
- [DEV.to: Complete Guide to Overages](https://dev.to/flexprice_8116ed925/the-complete-guide-to-elevenlabs-plans-overages-and-usage-based-pricing-3jam) - Contains structured pricing table
- [Medium: Pricing Plans breakdown](https://medium.com/@zakariaibraahim56/elevenlabs-pricing-plans-features-perks-price-details-6db81f3c60b5)

---

## File Inventory

Currently this directory contains:
- `README.md` - this documentation file

**Planned additions:**
- Screenshots from app stores (iOS/Android)
- Screenshots from hands-on testing
- Competitor comparison visuals
- Flow diagrams of upgrade journeys
- Annotated wireframes based on descriptions
- Captured mobile app screenshots showing credit UI

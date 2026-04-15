# ElevenLabs Pricing UI - Key Findings Summary

**Research Date:** April 10, 2026  
**Status:** Textual research complete, visual screenshots pending hands-on capture

---

## TL;DR: ElevenLabs' Credit + Subscription Model

ElevenLabs uses a **hybrid pricing model** that combines:
- Fixed monthly subscription tiers with included credit quotas
- Optional usage-based billing for overages
- Credit rollover (up to 2 months) to reduce waste
- Tiered volume discounts (higher plans = cheaper per-credit overage rates)

**Key Insight:** They've successfully avoided the "fear of running out" problem while maintaining predictable revenue through base subscriptions.

---

## Pricing Architecture

### 7 Tiers (2026)

| Tier | Monthly | Credits | Use Case |
|------|---------|---------|----------|
| Free | $0 | 10K | Non-commercial testing |
| Starter | $5 | 30K | Commercial entry point |
| **Creator** | $22 | 100K | **Most popular** - prosumers |
| Pro | $99 | 500K | Agencies, developers |
| Scale | $330 | 2M | Growing businesses (3 seats) |
| Business | $1,320 | 11M | Enterprises (5 seats) |
| Enterprise | Custom | Custom | SSO, HIPAA, custom SLA |

### Credit Mechanics

- **1 credit = 1 character** (standard Multilingual v2 model)
- **0.5 credits = 1 character** (Flash/Turbo models - faster, cheaper)
- Credits reset monthly on billing anniversary
- Rollover capped at 2x monthly quota
- No rollover on Free plan

---

## Revenue Model Insights

### Base Subscription Revenue

Provides predictable MRR/ARR while giving users:
- Budget certainty
- Commercial usage rights (paid tiers)
- Access to premium features (voice cloning, etc.)

### Usage-Based Billing (Overages)

**Opt-in feature** on Creator+ plans that:
- Eliminates hard cutoff anxiety
- Charges at end of billing cycle
- Immediate charge if overages >2x subscription fee
- Lower rates on higher plans (incentivizes upgrades)

**Example overage rates:**
- Creator: $0.30 per 1K characters
- Pro: $0.24 per 1K characters
- Business: $0.12 per 1K characters

**Strategic pricing:** If regularly using >1.5x quota, upgrading to next tier is cheaper than paying overages.

### Annual Discounts

~17% discount (equivalent to 2 free months) encourages:
- Upfront cash collection
- Reduced churn
- Long-term commitment

---

## Feature Gating Strategy

### By Tier:

**Free → Starter:** Commercial rights (legal to sell outputs)

**Starter → Creator:** Professional voice cloning (vs instant)

**Creator → Pro:** Higher quota, priority processing, extended audio generation

**Pro → Scale:** Multi-seat workspaces, team collaboration

**Scale+ → Business:** More seats, higher quotas

**Enterprise:** Custom SLAs, compliance (HIPAA), SSO

### Non-Credit Features

Not all features use credits. Plans also differ by:
- Number of custom voice slots (3 free, scales with plan)
- Concurrent API requests
- Team seats / workspace access
- Audio quality / generation length limits
- Processing priority queues

---

## UI/UX Patterns (Documented via Text)

### Navigation Structure

```
Left Sidebar:
├── Home Dashboard
├── Text-to-Speech
├── Voice Library
├── Studio
├── Dubbing
├── Image & Video
├── Agents
├── Music
└── Developers ← Credit tracking here
    ├── Usage (credits breakdown)
    ├── Analytics (API metrics)
    └── Request Log

Top Right (Profile Menu):
├── Subscription ← Billing, usage-based toggle
├── Account Settings
└── Workspace Management
```

### Credit Visibility

**Primary location:** Developers → Usage tab

**Breakdown capabilities:**
- By voice used
- By product (TTS, STT, dubbing, etc.)
- By API key
- By time period (day/week/month/cumulative)
- By user (multi-seat workspaces)

**Export:** CSV download available

### Subscription Management

**Profile → Subscription shows:**
- Current plan
- Current spend (month-to-date)
- Invoice history (via "Manage Subscription")
- Usage-based billing toggle
- Payment method management

---

## Terminology Choices

ElevenLabs uses customer-friendly language:

| Instead of... | They say... | Why? |
|---------------|-------------|------|
| Tokens | **Credits** | More tangible, less technical |
| Limit | **Quota** | Less restrictive feeling |
| Overages | **Usage-based billing** | Opt-in choice, not penalty |
| Paywall | **Commercial rights** | Legal benefit, not restriction |
| Seats | **Workspace members** | Collaborative framing |

**Pattern:** Positive framing of constraints, emphasizing benefits over limitations.

---

## Onboarding & Conversion Funnels

### Free → Paid Triggers (Inferred)

Based on documentation, likely prompts occur at:
- 90% quota consumed (proactive warning)
- 100% quota consumed (hard stop)
- Attempting to use paid-only feature (voice cloning)
- Attempting commercial use (requires paid plan)

### Upgrade Incentives

**Immediate benefits on upgrade:**
- Unused quota from old plan transfers to new plan
- New billing cycle starts (don't wait for current to end)
- Instant access to new tier features

**Downgrades:**
- Take effect at end of current cycle (no immediate loss)
- Protects user from accidental downgrades

---

## Competitive Positioning

### vs. Pay-As-You-Go Only (e.g., OpenAI TTS API)

**ElevenLabs advantage:**
- Predictable monthly costs
- No surprise bills
- Rollover reduces waste

### vs. Subscription Only (no overages)

**ElevenLabs advantage:**
- Users don't need to over-provision
- Flexibility for variable workloads
- Revenue capture from high-usage months

### vs. Pure Usage-Based (e.g., AWS)

**ElevenLabs advantage:**
- Simpler for non-technical users
- Monthly quota easier to understand than per-API-call pricing
- Commercial rights bundled (not add-on)

---

## Questions for Visual Research

When capturing actual screenshots, investigate:

1. **Credit Balance Prominence**
   - Is it always visible (e.g., header)?
   - Or requires navigation to see?

2. **Warning UX**
   - What happens at 80%? 90%? 100%?
   - Modal? Banner? Email?

3. **Upgrade CTA Placement**
   - Persistent in sidebar?
   - Contextual when hitting limits?
   - Dashboard widget?

4. **Checkout Flow**
   - Single page or multi-step?
   - Payment method options shown when?
   - Immediate activation or activation delay?

5. **Usage-Based Billing Toggle**
   - Simple on/off switch?
   - Explanation modal before enabling?
   - Overage rate disclosed upfront?

6. **Mobile Differences**
   - iOS vs Android vs Web differences?
   - In-app purchase flow (Apple/Google)?
   - Credit display on small screens?

---

## Application to This Project

### Relevant Patterns to Consider

✅ **Hybrid model** - Subscriptions with included credits + optional overages
✅ **Credit rollover** - Reduces "use it or lose it" anxiety
✅ **Tiered overage rates** - Higher plans get better per-unit economics
✅ **Opt-in overages** - Users choose to enable, not forced
✅ **Immediate charge threshold** - If overages >2x subscription (prevents runaway bills)
✅ **Positive terminology** - "Quota" not "limit", "usage-based" not "overages"
✅ **Feature + usage gating** - Plans differ by both credits AND features
✅ **Multi-dimensional usage** - Different products consume credits differently
✅ **Detailed usage analytics** - Breakdown by product/time/API key

### Patterns to Investigate Further

🔍 Visual presentation of credit balance
🔍 Upgrade prompt timing and messaging
🔍 Checkout flow friction (or lack thereof)
🔍 Usage-based billing enablement UX
🔍 Credit consumption rate forecasting (do they show "days remaining"?)
🔍 Team/workspace billing consolidation

---

## Next Actions

**Immediate (No account needed):**
1. Capture iOS App Store screenshots
2. Capture Android Play Store screenshots
3. Review YouTube tutorials for UI walkthroughs

**Short-term (Free account):**
4. Sign up, capture dashboard
5. Navigate all tabs, screenshot UI
6. Test approaching quota limit

**Medium-term (Paid account):**
7. Subscribe to Starter ($5), document checkout
8. Enable usage-based billing, capture UI
9. Test upgrade flow

---

## Sources

All findings synthesized from 40+ sources including:
- ElevenLabs official documentation
- Help center articles
- Third-party reviews (NerdyNav, DevOpsCube, G2, Capterra)
- Pricing analysis blogs (Flexprice, Orb, BIGVU)
- SaaS comparison sites (SaaSworthy)
- Developer communities (DEV.to, Medium)
- Company announcements and blog posts

Full citations in `README.md`.

---

**Research completeness:** 📊 80% (textual), 📸 5% (visual)

**Next milestone:** Hands-on account testing to capture actual UI screenshots.

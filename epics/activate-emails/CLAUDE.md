# G2 Activate Email Templates — Epic Context

> Email design explorations for G2 Activate weekly digest

---

## Overview

**G2 Activate Email Templates** explores visual approaches for the weekly prospect digest email sent to G2 Activate customers. The email summarizes new prospects showing buying intent, segmented by company size, with CTAs to unlock the full prospect list.

**Purpose:**
- Compare different visual treatments for prospect metrics
- Validate email template compatibility across clients
- Refine information hierarchy and call-to-action prominence

---

## Problem Space

**What we're solving:**
Customers need a clear, actionable weekly summary of new prospects that:
- Immediately communicates value (prospect count, buying signals)
- Breaks down prospects by company size segments
- Drives them back to the G2 Activate dashboard

**Current challenge:**
Finding the optimal visual treatment for the metrics breakdown that:
- Renders reliably across email clients
- Maintains visual hierarchy
- Stays on-brand with Elevate design system

---

## Email Content Structure

All variants share the same core content:

**Header:**
- G2 logo
- Title: "G2 Activate Weekly Digest for [Product Name]"

**Body:**
- Personalized greeting (recipient first name)
- Summary sentence: "[X] new prospects, [Y] showing strong buying signals"
- **Metrics breakdown** (company size segments) ← **varies by option**
- Top locations (e.g., "San Francisco, New York, Austin")

**CTA:**
- "Unlock these prospects in G2 Activate today..."
- Purple button linking to dashboard

**Footer:**
- Manage preferences and contact links

---

## Design Options

### Option 1: Subtle Background Boxes
- Light gray rounded boxes (#F8F8F8)
- Horizontal layout in table cells
- Number and label inline
- Most compact, subtle emphasis

### Option 2: Purple Accent Numbers
- Same gray boxes as Option 1
- Purple accent on numbers (#5746B2)
- Stronger visual hierarchy
- Brand color reinforcement

### Option 3: Bordered Boxes
- White background with borders
- Purple numbers
- More defined separation
- Cleaner, less "boxy" feel

### Option 4: Vertical Stack Layout (Production Choice)
- Purple numbers stacked above labels
- Larger numbers (24px)
- Even spacing across three columns
- Strongest visual emphasis on metrics

---

## Technical Constraints

**Email client compatibility:**
- Must use table-based layout (not flexbox/grid)
- Inline styles only (no external CSS)
- Minimal reliance on font loading
- Safe fallback fonts

**Variables (ERB template):**
- `@recipient_first_name` - Greeting
- `@prospect_count` - Total prospects
- `@high_intent_count` - Strong buying signals
- `@company_size_breakdown[:small_business]`
- `@company_size_breakdown[:mid_market]`
- `@company_size_breakdown[:enterprise]`
- `@top_locations` - Array of location strings
- `@product.name` - Product name
- `@dashboard_url` - CTA link

---

## Design Principles

**Email-specific considerations:**
- Information density: maximize signal, minimize noise
- Scannability: key numbers must jump out
- Mobile-responsive: 500px max width, scales down
- Accessibility: semantic HTML, proper alt text

**Brand alignment:**
- Purple (#5746B2) for brand and CTAs
- Figtree typography (with web-safe fallbacks)
- Calm density: information-rich but not cluttered
- Trust-first: numbers and locations build credibility

---

## Files

**Explorations:**
- `g2-activate-digest-preview-option1.html` - Subtle gray boxes
- `g2-activate-digest-preview-option2.html` - Purple accent numbers
- `g2-activate-digest-preview-option3.html` - Bordered boxes
- `g2-activate-digest-preview-option4.html` - Vertical stack (production)
- `g2-activate-digest-preview.html` - Latest iteration
- `g2-activate-digest.html` - Production template with ERB variables

**Documentation:**
- `ENGINEER_NOTES.md` - Implementation details and variable mapping
- `metrics-styling-options.md` - Visual treatment comparison

---

## Next Steps

- [ ] Finalize hosted G2 logo URL
- [ ] Test rendering across email clients (Gmail, Outlook, Apple Mail)
- [ ] Validate with actual prospect data
- [ ] A/B test click-through rates across options

---

## Questions or Issues?

- **Email template questions**: Check `ENGINEER_NOTES.md`
- **Design system alignment**: Reference `/shared/design-system/DESIGN.md`
- **Visual comparisons**: Browse gallery at `index.html`

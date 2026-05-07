# Engineer Notes - G2 Activate Weekly Digest Email

## Variable Name Assumptions

The production template (`g2-activate-digest.html`) uses these ERB variables. Please verify/update as needed:

- `@recipient_first_name` - Recipient's first name for greeting (was `@vendor.name`)
- `@top_locations` - Array of location strings (was `@top_industries`)
  - Used as: `<%= @top_locations.join(', ') %>`

## Existing Variables (Unchanged)

- `@prospect_count` - Total number of new prospects
- `@high_intent_count` - Number showing strong buying signals
- `@company_size_breakdown[:small_business]` - Small Business count
- `@company_size_breakdown[:mid_market]` - Mid-Market count
- `@company_size_breakdown[:enterprise]` - Enterprise count
- `@product.name` - Product name (e.g., "Expensify")
- `@dashboard_url` - Link to G2 Activate dashboard

## Required: Logo Hosting

The production template has a placeholder for the G2 logo:
```html
<!-- TODO: Replace with hosted G2 logo URL -->
<img src="YOUR_CDN_URL/g2-logo.png" alt="G2" width="48" height="48" ...>
```

**Action needed:** Replace `YOUR_CDN_URL/g2-logo.png` with the actual hosted logo URL.

## Email Subject Line

Per Devesh's copy update:
```
Subject: You have [prospect_count] new prospects waiting for you this week
```

## Copy Changes Implemented

1. **Kept** header title "G2 Activate Weekly Digest for [Product]" with divider beneath
2. Changed greeting from vendor/company name to recipient first name
3. Combined prospect count and buying signals into single sentence
4. Changed "Small-Business" to "Small Business" (removed hyphen)
5. Replaced "Top industries" with "Top locations"
6. Updated CTA: "Unlock these prospects in G2 Activate today to see the company names and contact details that matter most to you."

## Metrics Layout - Option 4 (Final Choice)

The company size breakdown uses a **vertical stack layout with gray containers**:
- Three evenly-spaced boxes (32% width each, 2% spacer between)
- Light gray background (#F8F8F8) with 6px border radius
- Large purple numbers (24px, bold, #5746B2) stacked above labels
- Labels match body text style (15px, bold, #201F23)

## Color Scheme

Text colors:
- **#201F23** - Title and all bold text
- **#4C4B53** - Regular body text (non-bold)
- **#5746B2** - Purple accent (metric numbers, button background)
- **#ffffff** - Button text
- **#999999** - Footer text

Background/UI colors:
- **#F2F2F2** - Email background
- **#FFFFFF** - Content card background
- **#F8F8F8** - Metric box backgrounds
- **#DFDFE2** - Borders and dividers

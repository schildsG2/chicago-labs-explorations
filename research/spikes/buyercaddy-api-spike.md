# BuyerCaddy API — Research Spike
## Leveraging Buyer Tech Stack Intelligence for Personalized Email Generation

**Date:** 2026-03-31

---

## What the API Does

BuyerCaddy is a **company-level software intelligence API**. Given a company domain (e.g. `hilton.com`), you can retrieve:

- The **full list of software products in use** at that company (vendor, product name, category, verification dates, confidence signals)
- Whether **specific products are currently in use** (targeted yes/no check with signal strength)
- **Firmographics** (company size, revenue, industry, HQ, CEO, funding, LinkedIn)
- **Competitors and cohort companies** (similar companies and what they use)
- **A news/event feed** (funding rounds, acquisitions, leadership changes)
- AI-powered **discovery of companies that use specific products** (natural language queries)

**Base URL:** `https://api.salescaddy.ai/api`

---

## Authentication

| Method | Detail |
|--------|--------|
| OAuth 2.0 (Client Credentials) | Token endpoint: `https://pawannachnani.us.auth0.com/oauth/token` — requires `client_id`, `client_secret`, `audience`, `grant_type`. Use token as `Authorization: Bearer $TOKEN` |
| API Key | Pass via `X-API-Key` header |
| AI endpoint header | `X-On-Behalf-Of-User: user@company.com` — required on all `/ai/*` calls |

---

## Core Endpoints

### Vendor Endpoints

| Method | Path | Description |
|--------|------|-------------|
| GET | `/vendors` | Search vendors by name or domain (`vendor`, `fuzzy`, `page`, `size`) |
| GET | `/vendors/{vendorDomain}/products` | List all products for a specific vendor |

### Product Endpoints

| Method | Path | Description |
|--------|------|-------------|
| POST | `/products/search` | Search products by name, category, or segment |
| GET | `/products` | Download all products as CSV |
| GET | `/categories` | Download all product categories as CSV |
| GET | `/dictionary/product-categories` | List all product categories with IDs |

### Company Endpoints

| Method | Path | Description |
|--------|------|-------------|
| POST | `/companies/search` | Search companies with advanced filtering |
| GET | `/companies/{domain}/firmographics` | Company details, funding, CEO, social links |
| GET | `/companies/{domain}/feed` | News feed (funding, acquisitions, people, press) |
| POST | `/companies/{domain}/products/paged` | **Full software stack — primary endpoint** |
| POST | `/companies/{domain}/products-in-use` | Check if specific products are in use (yes/no + signals) |
| GET | `/companies/{domain}/products` | All products as CSV |
| GET | `/companies/{domain}/products/json` | All products as JSONL |
| GET | `/companies/{domain}/competitors` | Up to 50 competitors |
| GET | `/companies/{domain}/cohort/{cohort}` | Cohort companies (`Default`, `Defined`, `Aspirational`) |
| GET | `/companies/{domain}/cohort/{cohort}/metrics/usage` | % of cohort using a given product/vendor |
| POST | `/companies/{domain}/benchmark/details` | Product usage comparison across a custom company list |
| GET | `/companies/{domain}/products/{productId}/related` | Related products via standard cohort |

### AI Endpoints

| Method | Path | Description |
|--------|------|-------------|
| POST | `/ai/find-customers-of-products` | Natural language: find companies using specific products |
| POST | `/ai/find-techstacks-for-company` | Natural language: tech stack lookup (returns person profiles — see note below) |

### Credits & Utilities

| Method | Path | Description |
|--------|------|-------------|
| GET | `/credits/balance` | Current credit balance |
| GET | `/credits/report` | Per-endpoint usage report for a date range |
| GET | `/dictionary/industries` | All registered industries |

---

## Key Endpoint Details for the Email Use Case

### `POST /companies/{domain}/products/paged` — The Primary Stack Endpoint

Returns the full software product stack for a company, paginated. Filter by `mainCategory` or `mainCategoryId` to scope results.

**Response fields per product record:**

| Field | Type | Notes |
|-------|------|-------|
| `product` | string | Product name — inject directly into email copy |
| `vendor` | string | Vendor/brand name |
| `mainCategory` | string | e.g. "CRM", "Marketing Automation" |
| `parentCategory` | string | Mid-level category |
| `level0Category` | string | Top-level category (e.g. "Sales", "Marketing") |
| `dateFirstVerified` | date-time | When product was first detected at this company |
| `dateLastVerified` | date-time | Most recent detection — use to filter stale data |
| `hitCount` | integer | Number of detection signals — use as confidence threshold |
| `starRating` / `avgRating` | float | Product review data |
| `reviewCount` | integer | Review volume |
| `industry` | string | Industry of this company |
| `revenueRange` | string | Revenue bucket |
| `employeeRange` | string | Headcount bucket |
| `imageUrl` | URI | Product logo |

---

### `POST /companies/{domain}/products-in-use`

Targeted check: given product names/IDs/categories, returns whether each is in use.

**Request body:**
```json
{
  "productNames": ["Salesforce", "Gong"],
  "productIds": [],
  "categoryNames": ["CRM"],
  "categoryIds": []
}
```

**Response per item:**

| Field | Notes |
|-------|-------|
| `productInUse` | boolean |
| `productName` | string |
| `hitCount` | Signal strength |
| `dateFirstVerified` / `dateLastVerified` | Detection window |
| `categoryName` | Category context |

---

### `POST /ai/find-customers-of-products`

Natural language query — e.g. *"Which companies use Outreach for enterprise SDR sequencing?"*

**Required header:** `X-On-Behalf-Of-User: user@company.com`
**Params:** `prompt` (string), `size` (max 100)

**Response fields (notable):**

| Field | Notes |
|-------|-------|
| `companyName` | Company name |
| `country` / `industry` | Firmographic context |
| `howProductIsUsed` | Qualitative description of use — useful for email context |
| `scope` | Deployment scope |
| `probability` | Confidence score |
| `dateFirstVerified` / `dateLastVerified` | Recency |

---

### `POST /companies/search` — Company Filtering

Powerful for building prospect lists before email generation. Key filter fields:

| Filter | Description |
|--------|-------------|
| `vendorDomainIn` | Companies using any/all of these vendors |
| `vendorDomainNotIn` | Companies NOT using these vendors (competitive displacement) |
| `productIdIn` | Companies using specific products |
| `mainCategoryIdIn` | Companies using products in specific categories |
| `industryIn` | Filter by industry |
| `employeeRangeIn` | Micro / Small / Medium / Large / XLarge |
| `revenueRangeIn` | Revenue range buckets |
| `intensityBucketIn` | LOW / MEDIUM / HIGH usage intensity |
| `dateLastVerifiedBucketIn` | ANCIENT / OLD / NEW / RECENT |

---

### `GET /companies/{domain}/feed`

Returns up to 50 news items. Categories: `NEWS`, `PRESS`, `FUNDING`, `ACQUISITION`, `PEOPLE`, `BLOG`, `VIDEOS`

Each item: `title`, `description`, `date`, `sourceUrl`, `publisherName`

Useful for surfacing a timely trigger event (e.g. recent funding round, new VP of Sales hire) to open the email before referencing the tech stack.

---

## Recommended Integration Flow (On Company Unlock)

```
1. GET  /companies/{domain}/firmographics
        → Enrich: size, revenue, industry, CEO

2. POST /companies/{domain}/products/paged
        → Get full software stack
        → Filter: dateLastVerified within 12 months, hitCount above threshold

3. GET  /companies/{domain}/feed
        → Pull recent events (funding, people, acquisitions)
        → Pick most recent/relevant as email hook

4. [Optional] POST /companies/{domain}/products-in-use
        → Targeted check: "Is this company using [competitor]?"
        → Use for displacement-angle messaging

5. Feed structured stack + event hook → email generation prompt
```

---

## Email Personalization Patterns

**Pattern A — Direct tech mention**
> "We saw you're running Gong for call intelligence and Outreach for sequencing — we integrate with both natively."

**Pattern B — Category-level framing**
> "Most companies your size in financial services are consolidating their marketing and sales engagement layers. Given your current stack, that may already be on your radar."

**Pattern C — Competitive displacement**
> Use `vendorDomainIn: ["competitor.com"]` in company search to build a prospect list, then craft switching-angle messaging.

**Pattern D — Trigger-event hook**
> Pull `/feed` — if there's a recent funding round or leadership hire, lead with that before the stack reference.

---

## What to Filter Before Injecting into Email

| Signal | Recommendation |
|--------|---------------|
| `dateLastVerified` | Only surface products verified within the last 6–12 months |
| `hitCount` | Set a minimum threshold — low-signal detections risk inaccuracy |
| `mainCategory` | Only surface categories relevant to your product's positioning |

Mentioning a tool the company stopped using is worse than mentioning none at all.

---

## Gaps & Things to Validate

| Gap | Detail |
|-----|--------|
| **No contact-level data** | The API is company-scoped. It does not tie a specific person to a tool. Contact data must come from your existing source. |
| **`find-techstacks-for-company` behavior** | Despite its name, this endpoint returns person profiles (name, title, department, seniority), not product stack data. Needs hands-on testing to understand actual utility. |
| **No webhook/push model** | Pull API only. Decide on a cache/refresh strategy for stack data — it doesn't need to be re-fetched on every email generation. |
| **Credit cost per endpoint** | Docs do not publish per-call credit costs. Request a pricing breakdown before designing the unlock flow — some endpoints may be significantly more expensive than others. |
| **OpenAPI spec** | Live spec available at `https://api.salescaddy.ai/schema.yaml` — import this for full type-safe client generation. |

# Vercel for Live-Data Prototypes — Research Spike

**Date:** 2026-03-31
**Purpose:** Evaluate Vercel as a hosting platform for live-data prototypes used in internal sharing and user research

---

## Short Answer

Vercel goes well beyond static hosting. It supports full server-side rendering, API routes (serverless functions), and automatic preview URLs per branch — which is exactly what's needed to serve live data into a prototype. However, there is one notable gap for sharing with external research participants.

---

## Recommended Product Stack

| Layer | Product | Notes |
|---|---|---|
| App hosting | Vercel (core) | SSR, API routes, automatic preview URLs per branch |
| Relational database | **Neon** (via Vercel Marketplace) | Postgres; provisioned from Vercel dashboard, credentials auto-injected |
| Key-value / cache | **Upstash** (via Vercel Marketplace) | Redis; same Marketplace integration |
| File/asset storage | Vercel Blob | S3-style object storage |
| Feature flags / config | Edge Config | Ultra-low-latency global KV — good for toggling prototype variants |

> **Note:** Vercel Postgres and Vercel KV were discontinued as native products in 2024–2025. They're now third-party providers (Neon and Upstash) brokered through the Vercel Marketplace. They work seamlessly, but you're taking on two additional vendor dependencies.

---

## Platform Capabilities

### What Vercel Supports
- Static sites with global CDN delivery
- Server-side rendering (SSR) across all major frameworks
- Serverless functions (API routes) — Node.js, Python, Go, Edge runtime
- Streaming SSR and Incremental Static Regeneration (ISR)
- Automatic preview deployments per branch/commit
- Cron jobs (up to 100 per project)
- Edge Middleware for personalization, auth checks, A/B tests

### What Vercel Does NOT Support
- WebSocket servers (requires third-party: Pusher, Ably, PartyKit)
- Persistent background processes or long-running workers
- Multi-region function execution (Enterprise only)

### Framework Compatibility
Vercel supports virtually every major JS/TS framework. First-class support includes: Next.js, SvelteKit, Nuxt, Astro, Remix, TanStack Start, React Router v7, FastAPI, Flask, Django.

Next.js has the deepest integration — Vercel built and maintains it.

---

## The Key Gap: Sharing with External Research Participants

| Scenario | Cost | How it works |
|---|---|---|
| Share with teammates who have Vercel accounts | Free | Built-in "Vercel Authentication" |
| Share with external participants via password | **+$150/month add-on** on top of Pro | "Advanced Deployment Protection" add-on |
| Make it fully public | Free | Anyone with the URL can access |

If external participants need a password-gated URL, Vercel is expensive. **Netlify's Pro plan ($19/month) includes password-protected previews without any add-on** — worth comparing directly if external gating matters.

---

## Pricing Overview

| Plan | Cost | Key Limits |
|---|---|---|
| **Hobby** | Free | Non-commercial only, 1 developer, no password protection, 1hr log retention |
| **Pro** | $20/user/month | Pay-as-you-go compute/storage, 1TB bandwidth, 1-day log retention |
| **Password protection add-on** | +$150/month | Required for external participant sharing on Pro |
| **Enterprise** | Custom | Password protection included, SCIM, audit logs, multi-region |

---

## Vercel vs. Alternatives

| Factor | Vercel | Netlify | Railway | Render |
|---|---|---|---|---|
| Next.js support | Best-in-class | Good | Good | Good |
| Automatic preview URLs | Yes, per branch/commit | Yes | No (manual) | Yes |
| Password-protected sharing | Pro + $150/mo add-on | Included on Pro ($19/mo) | Not native | Not native |
| Native database | Marketplace (Neon, Upstash) | None | PostgreSQL, Redis native | PostgreSQL, Redis native |
| WebSocket support | No | No | Yes | Yes |
| Long-running processes | No (max 800s) | No | Yes | Yes |
| Cold starts | 150–800ms (improving) | Similar | None (persistent) | 5–30s free; warmer on paid |
| DX / deploy speed | Excellent (~30s) | Excellent | Good | Moderate (2–5 min) |

---

## Verdict

**Vercel is the right call if:**
- Participants can authenticate via Vercel (internal team), or public URLs are acceptable
- The app is built in Next.js
- You don't need WebSockets or persistent background workers

**Evaluate Netlify head-to-head if:**
- You regularly need password-gated URLs for external research participants — it's meaningfully cheaper for that use case

**Consider pairing Vercel + Railway if:**
- Prototypes need WebSockets, real-time connections, or persistent backend services

---

## Compatibility with the Existing `ue` Application

The `ue` repo (the team's primary product) is **not compatible with Vercel** without significant refactoring. It is a Ruby on Rails 8 monolith deployed to Kubernetes via ArgoCD, and Vercel has no Ruby runtime.

### Blockers

| Blocker | Detail |
|---|---|
| **Ruby/Rails backend** | Vercel only runs Node.js serverless functions. The app serves via Puma, which requires a persistent server process. |
| **Sidekiq background workers** | 23 queue types defined in the Procfile; Vercel has no persistent worker support. |
| **Multiple PostgreSQL databases** | Primary, aggregates, and ETL databases in use — Vercel Marketplace Postgres (Neon) is a single lightweight DB. |
| **Pusher WebSockets** | Already abstracted through Pusher, but the integration is deeply embedded across the app. |
| **Redis** | Used for sessions, caching, and job queues — not natively supported on Vercel (Upstash via Marketplace only). |

### Prototype Strategies for `ue`-like Experiences

Since the app can't be lifted onto Vercel as-is, there are three viable paths:

**Option 1 — Thin Next.js frontend calling the existing `ue` API (lowest effort)**
Build a purpose-built Next.js prototype on Vercel that calls `ue`'s existing versioned JSON API endpoints directly. The prototype is frontend-only — no Rails needed. If pointed at the staging environment, data would be real. This is likely the lowest-effort path.
- *Open question: does the team have cross-origin access to the `ue` staging API from an external app?*

**Option 2 — Standalone prototype with seeded data**
Build a small Next.js + Neon Postgres app that mirrors a specific flow with seeded/mocked data, fully independent of `ue`. More upfront work, but fully self-contained and safe for external participant sharing.

**Option 3 — Dedicated `ue` staging instance (no Vercel)**
Since `ue` is already fully containerized (Dockerfile + ArgoCD), spin up a dedicated prototype instance on the existing Kubernetes cluster. Vercel adds nothing here — this is the right approach if the prototype needs full Rails fidelity.

---

## Compatible Alternatives for the `ue` Stack

Since the `ue` app is a Rails 8 monolith and Vercel is not viable, the following platforms can run it as-is (Dockerized, Sidekiq workers, Postgres, Redis).

### Platform Comparison

| Criterion | Railway | Render | Fly.io | Heroku | Own K8s (ArgoCD) |
|---|---|---|---|---|---|
| Docker support | Yes, native | Yes, full | Yes, native | Yes (heroku.yml) | Yes (existing) |
| Sidekiq workers | Separate service, easy | Separate service, documented | Separate app/process | Separate dyno type | Already works |
| Native PostgreSQL | Yes | Yes ($6+/mo) | Managed at $38/mo | Yes ($5+/mo) | Yes |
| Native Redis | Yes | Yes ($10+/mo) | No (Upstash) | Yes ($3+/mo) | Yes |
| Isolated environments | Named envs, 1-click | PR-only (Pro tier req.) | Separate apps (CLI) | Review apps (app.json) | Namespaces (setup req.) |
| Prototype spin-up ease | Very easy | Moderate | Moderate | Easy (with Pipeline) | Hard initially |
| Shareable URL | Auto (railway.app) | Auto (onrender.com) | Auto (fly.dev) | Auto (herokuapp.com) | Custom domain |
| Built-in access control | No (nginx template) | No (app-level) | No (app-level) | No (team membership) | Flexible (manual) |
| Cost per prototype | ~$10–20/mo | ~$30/mo | ~$15–48/mo | ~$22/mo | ~$0–20/mo (marginal) |
| Setup time | Hours | Hours | ~1 day | Half day | 1–2 days |

### Platform Details

#### Railway — Recommended
The strongest fit for this team's needs. The existing Dockerfile works with no modifications. Web and Sidekiq are defined as separate services sharing the same image, with Postgres and Redis added as first-class services and credentials auto-injected via variable references (`${{Postgres.DATABASE_URL}}`). Named environments (not just PR-based) can be created in the dashboard in minutes.

Access control for external participants: deploy the community `railway-nginx-basic-auth` template in front of the app — gives HTTP Basic Auth via two env vars. Sufficient for user research gating.

Pricing is usage-based: a lightly-used prototype (web + worker + Postgres + Redis) runs ~$10–20/month per environment, with near-zero cost when idle.

**Key gotcha:** Asset precompilation must happen at Docker build time (already true in the existing Dockerfile). The `railway.json` start command applies globally and must be overridden per-service.

#### Render — Runner-up
Well-documented Rails + Sidekiq support via a `render.yaml` Blueprint file that defines all services as infrastructure-as-code. More opinionated/reproducible than Railway. However, isolated non-PR environments are not a first-class primitive — requires creating a new Blueprint deploy manually. Preview environments (PR-based) require the Professional workspace plan ($19/user/month) on top of compute costs.

Free-tier web services sleep after 15 min of inactivity — not usable for demos. Use Starter ($7/service/month) minimum.

#### Fly.io
Most powerful and Rails-native (Fly built `fly launch` for Rails), but Managed Postgres starts at $38/month — the main cost driver. Each isolated environment is a separate Fly app, managed via CLI. Not self-service for non-engineers without scripting. Best choice if the team considers eventually hosting production on Fly.

#### Heroku
Historically the canonical Rails host, now the most expensive option with the least flexibility. Viable only if the team has an existing Heroku account with established Pipelines. Worker dynos are off by default and must be explicitly enabled — a common gotcha.

#### Own Kubernetes Cluster (ArgoCD)
If the cluster already has spare capacity and the team has platform engineering resources, ArgoCD's `ApplicationSet` with the Pull Request generator automates namespace-per-PR environments with zero new vendor accounts. Best if the app handles sensitive data that should stay within your cloud boundary.

Setup takes 1–2 days upfront; ongoing maintenance is low on a stable cluster. Access control is fully custom (ingress-level Basic Auth, oauth2-proxy, IP allowlisting).

### Recommendation

**Railway for third-party hosting** — lowest friction, hours to first deploy, usage-based pricing keeps idle prototypes cheap, named environments work for non-PR prototype instances.

**Own K8s / ArgoCD** if the team has platform engineering capacity and wants to keep data within its own cloud boundary.

---

## Open Questions to Resolve

### Sharing requirements
1. Will research sessions involve external participants, and do prototype URLs need to be access-controlled — or is a long random URL sufficient?
2. Do you need to share multiple simultaneous variants (A vs. B testing), or one URL per study?

### Data requirements
3. What kind of data will be flooded in — read-only seed data for realism, or data that participants write to (form submissions, actions)?
4. Does the database need to persist state between sessions, or can it reset per session/per participant?
5. Is any data sensitive enough to require SOC 2 or HIPAA compliance?

### Stack and architecture
6. ~~What framework is the production app built in?~~ **Known:** Ruby on Rails 8 monolith — not Vercel-compatible as-is. Prototypes would need to be separate Next.js apps.
7. ~~Does the real environment use WebSockets?~~ **Known:** Yes, via Pusher. Vercel can't host WebSocket servers; prototype would need to replicate or omit real-time features.
8. Are background jobs or scheduled tasks needed in prototypes (e.g., simulating async processing)?
9. Does the team have cross-origin API access to the `ue` staging environment from an external Vercel-hosted app?

### Team and cost
9. How many people need deploy access? ($20/user/month adds up with larger teams)
10. Do research participants currently have Vercel accounts, or will they always be accessing from outside?

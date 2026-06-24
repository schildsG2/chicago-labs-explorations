# UXR Brief: AI Agent Buyer Discovery Study

## Study Overview

| Field | Value |
|-------|-------|
| **Study Name** | AI Agent Buyer Problem Space Discovery |
| **Site** | [TheresAnAIForThat.com](https://theresanaiforthat.com/) (TAAFT) |
| **Method** | Moderated contextual interviews + live site walkthrough |
| **Participants** | 8 AI Agent Buyers |
| **Duration** | 45-60 min per session |
| **Timeline** | TBD |

---

## Research Questions

### Primary
1. **What triggers the search?** What business problem or moment causes someone to start looking for an AI agent solution?
2. **How do they frame the problem?** What language/mental models do buyers use to describe what they need?
3. **What does the evaluation journey look like?** Where do they go, what do they compare, how do they decide?

### Secondary
4. What frustrates them about current discovery/evaluation tools?
5. How do they differentiate between AI agents, AI tools, and automation?
6. What signals trust/credibility when evaluating AI solutions?
7. Who else is involved in the decision? What do *they* need?

---

## Target Participants

**AI Agent Buyers (n=8)**

| Criteria | Requirement |
|----------|-------------|
| **Recency** | Actively searching OR searched within last 6 months |
| **Use case** | Business/work context (not personal curiosity) |
| **Role** | Decision-maker or strong influencer in purchase |
| **Mix** | Aim for variety: company size, industry, technical sophistication |

### Screener Questions (draft)
1. Have you searched for an AI agent or AI automation solution for your business in the last 6 months? *(Must = Yes)*
2. What was the business problem you were trying to solve? *(Open-ended, screen for specificity)*
3. Are you the primary decision-maker for this type of purchase? *(Accept decision-maker or influencer)*
4. What's your company size? *(Capture for mix)*
5. Have you used TheresAnAIForThat.com before? *(Capture, don't screen out either way)*

---

## Session Structure (60 min)

### Part 1: Problem Context (20 min)
*Understand the trigger and framing before touching the site*

- "Tell me about a recent time you needed to find an AI solution for work."
- "What was happening in your business that made you start looking?"
- "How would you describe what you were looking for to a colleague?"
- "Walk me through everywhere you went to research options."

### Part 2: Live Site Walkthrough (25 min)
*Observe behavior on TAAFT with think-aloud*

- "Show me how you'd start looking for [their stated need] on this site."
- "What are you noticing? What's helpful or confusing?"
- "If you found something interesting, what would you do next?"
- "How does this compare to other places you've searched?"

### Part 3: Evaluation & Decision (10 min)
*Understand what moves them toward/away from a solution*

- "What would make you confident enough to try something?"
- "What would make you walk away from a tool?"
- "Who else would need to weigh in before you could move forward?"

### Part 4: Wrap-up (5 min)
- "If you could wave a magic wand and fix one thing about finding AI tools, what would it be?"
- "Anything else I should know?"

---

## Logistics

| Item | Notes |
|------|-------|
| **Recording** | Video + screen share (get consent) |
| **Platform** | Zoom, Lookback, or UserTesting Live |
| **Incentive** | $100-150 (B2B participant, 60 min) |
| **Recruiting** | Respondent.io, UserInterviews, or internal panel |
| **Note-taker** | Recommended (or use Otter.ai) |

---

## Deliverables

1. **Session recordings** (8 videos)
2. **Synthesis deck** — themes, quotes, journey map
3. **Problem space framework** — taxonomy of buyer needs/triggers
4. **Opportunity areas** — where current tools fall short

---

## TAAFT Platform Context

### What TAAFT Offers
- **Discovery**: Search/browse 12,000+ AI tools across categories
- **Mini Tools**: User-generated AI tools that run IN-BROWSER (text-to-text, image generation, transcription)
- **First-party tools**: Image generator (200k+ users), image editor — free, no signup
- **Credits system**: 2 quick generation credits/day + unlimited standard generation

### What TAAFT Does NOT Offer
- ❌ One-click install to Claude Code, Cursor, VS Code
- ❌ MCP server installation
- ❌ CLI/terminal integration
- ❌ Local tool deployment

**Key insight**: TAAFT is discover + try-in-browser. For developer tools requiring local install, users must click "Visit Site" and go elsewhere.

---

## Competitive Landscape

### Market Segmentation

| Layer | Players | User Journey |
|-------|---------|--------------|
| **General AI discovery** | TAAFT, Product Hunt AI, G2 | Browse → Visit external site |
| **MCP registry** | Glama (23K), Smithery (7K), mcp.so (5K) | Browse → Copy config / CLI command |
| **One-click install** | 1Server, MCPNest, AgenticMarket, getmcp | Browse → Click → Working |
| **Meta-installer** | MCPfinder, agent-discover, Atlas Index | AI finds and installs tools for you |
| **Enterprise gateway** | Glama, MCPNest | Proxy + observability + access control |

### Key Competitors with One-Click Install

| Platform | Scale | Differentiator | Install UX |
|----------|-------|----------------|------------|
| [MCPNest](https://mcpnest.io/) | 7,561 servers | Natural language: "find me a github server" → "install it" | Chat-based |
| [1Server](https://1server.ai/) | — | One connection runs ALL servers, hot reload, no restarts | Click install |
| [getmcp](https://www.getmcp.es/) | 7,627 servers | Supports 19 AI apps, auto-detects config format | `npx @getmcp/cli add github` |
| [AgenticMarket](https://agenticmarket.dev/) | — | Creator monetization (80-90% rev share) | `agenticmarket install slug` |
| [Atlas Index](https://atlasindex.app/) | 50,246 tools | Indexes everything: MCP, skills, A2A, OpenAPI, Cursor rules | JSON config |
| [agent-discover](https://www.npmjs.com/package/agent-discover) | — | **No restart required** — activates mid-session | `find_tool` auto-activates |

### Smithery vs Glama (Deep Dive)

| Dimension | Smithery | Glama |
|-----------|----------|-------|
| **Persona** | Indie dev / maker | Platform engineer / enterprise |
| **Install model** | CLI (`npx @smithery/cli install`) | Gateway proxy (always hosted) |
| **Key value** | Speed to install | Observability + governance |
| **Team features** | Minimal | Groups, permissions, audit logs |
| **Analogy** | npm | Artifactory |

### The "No Restart" Problem

Observed during this research: installing an MCP server via `claude mcp add` updates config but requires **session restart** to access new tools. This is universal friction across Claude Code, Cursor, Codex CLI.

**agent-discover** is the only tool claiming to solve this — it proxies servers and can activate them mid-session.

---

## Additional Research Questions (Based on Competitive Analysis)

### Discovery Behavior
8. "Have you heard of MCP servers? What do you understand them to be?"
9. "When you find a tool you want to try, what's your next step? Do you expect to try it on the site, or go somewhere else?"
10. "Have you ever installed an AI tool directly from a discovery site? What was that like?"

### Installation Friction
11. "Walk me through the last time you installed an AI tool for your coding environment. What steps did you take?"
12. "How do you feel about copy-pasting config vs one-click install?"
13. "Would you trust a website to auto-configure your development environment?"

### Mini Tools / In-Browser Execution
14. "Have you ever used a Mini Tool on TAAFT? What was that experience like?"
15. "How does trying a tool directly on the discovery site affect your evaluation?"
16. "Would you trust a community-built tool vs the official product?"

### Competitive Consideration
17. "Besides TAAFT, where else do you look for AI tools?" *(Probe for: Smithery, Glama, Product Hunt, GitHub, Google)*
18. "What would make you choose one discovery site over another?"

---

## Competitive Sites as Research Stimuli

Each site chosen to surface a specific insight about a user segment's problem space:

| Site | Test With | To Learn About | Problem Space |
|------|-----------|----------------|---------------|
| **TAAFT** (base) | All participants | General discovery behavior | "How do non-technical buyers find and evaluate AI tools?" |
| [Smithery](https://smithery.ai/) | Technical participants (devs) | CLI-first workflow expectations | "Do developers expect to install from terminal, and does a registry model feel natural?" |
| [Glama](https://glama.ai/) | IT leads / platform engineers | Governance and observability needs | "What do enterprise buyers need to trust AI tools in production — audit logs, access control, security scanning?" |
| [1Server](https://1server.ai/) | Devs using multiple MCP tools | Config fragmentation pain | "How painful is managing multiple MCP servers? Does 'one connection for everything' resonate?" |
| [MCPNest](https://mcpnest.io/) | All participants | Natural language install expectations | "Do users expect to say 'install it' in chat and have it work? Is that magic or scary?" |
| [getmcp](https://www.getmcp.es/) | Devs using 2+ AI IDEs | Multi-IDE config pain | "How do users manage tools across Cursor + Claude + VS Code? Is format fragmentation a real problem?" |
| [agent-discover](https://www.npmjs.com/package/agent-discover) | Power users mid-workflow | Session continuity needs | "How disruptive is restarting your session to add a tool? Would mid-session activation change behavior?" |
| [Atlas Index](https://atlasindex.app/) | Exploratory users | Tool type confusion | "Do users distinguish MCP servers vs skills vs Cursor rules? Or do they just want 'capabilities'?" |

---

## Study Design Options

### Option A: Single-Site Deep Dive (TAAFT Only)
- **Approach**: All 8 sessions focus exclusively on TAAFT
- **Pros**: Focused, faster, cheaper, cleaner data
- **Cons**: Miss comparative insights, can't validate if pain points are TAAFT-specific or universal
- **Best for**: If primary goal is improving TAAFT specifically

### Option B: TAAFT Base + 2-3 Stimuli Per Participant
- **Approach**: Show TAAFT first (baseline), then 2-3 competitors based on participant profile
- **Session flow**:
  1. TAAFT walkthrough (20 min)
  2. Show 2-3 stimulus sites (15 min)
  3. Comparative probing: "How does this compare? What's missing? What's better?"
- **Stimulus selection by profile**:
  - Non-technical → MCPNest (chat install), 1Server (simplicity)
  - Developer → Smithery (CLI), Glama (governance)
  - Multi-IDE user → getmcp (config pain)
- **Pros**: Rich comparative data, surfaces unmet needs
- **Cons**: More complex analysis, participants may conflate features
- **Best for**: Understanding the broader problem space

### Option C: Stratified Sessions
- **Approach**: Split participants by technical sophistication, different stimulus sets
- **Session allocation**:
  - Sessions 1-4: Non-technical buyers → TAAFT + MCPNest + 1Server
  - Sessions 5-8: Developer buyers → TAAFT + Smithery + Glama + getmcp
- **Pros**: Cleaner segmentation, can compare across cohorts
- **Cons**: Smaller n per segment (4 each), may miss crossover insights
- **Best for**: If you suspect radically different needs by technical level

---

## Open Questions

1. **Moderated vs unmoderated?** Drafted for moderated (richer for discovery). Unmoderated is faster/cheaper but loses the "why" probing.
2. **Study design?** Choose Option A, B, or C above.
3. **Recruiting source?** Do you have access to a panel, or need to recruit externally?
4. **Timeline?** When do you need findings?
5. **Developer vs non-developer mix?** If Option B or C, what's the target split?
6. **Screener for technical level?** Need to add questions to distinguish devs from non-technical buyers.

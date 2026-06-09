# Chicago Labs Explorations — Agent Context

> Auto-loaded context for any work in this repository.

---

## Project Overview

**Chicago Labs Explorations** is a unified repository for G2 product design explorations and rapid HTML prototypes. This is a design-first workspace for validating concepts before production implementation.

**Purpose:**
- Rapid HTML prototyping using the Elevate design system
- Design explorations for new G2 product features
- Competitive research and reference material
- Shared component library for prototyping

**Philosophy:**
- Design-first: validate UX before building features
- Elevate-first: maintain 1:1 fidelity with production design system
- Rapid iteration: HTML prototypes over full implementations
- Lightweight: simple static HTML, no build tools required

---

## Repository Structure

```
chicago-labs-explorations/
├── index.html              ← Portal to all epics
├── shared/                 ← Design system, components, tokens
│   ├── design-system/      ← DESIGN.md (authoritative specs)
│   ├── components/         ← Elevate component HTML templates
│   ├── tokens/             ← CSS design tokens
│   └── icons/              ← Elevate icon library
├── epics/                  ← Individual feature explorations
│   ├── bulk-purchase/
│   ├── buyer-caddy/
│   └── agent-performance/
└── research/               ← Competitive analysis, spikes
    └── spikes/
```

**Navigation:**
- Each epic has its own `CLAUDE.md` for epic-specific context
- `/shared/elevate-prototyping-kit/design-system/DESIGN.md` is the authoritative Elevate specification
- Component templates in `/shared/elevate-prototyping-kit/components/templates/`

---

## Design System: Elevate First

**CRITICAL:** Always use the Elevate design system. Never invent UI patterns.

### CSS Architecture (3 files, always)

New explorations load CSS from `shared/elevate-prototyping-kit/` (the active git submodule):

```html
<!-- From epics/{name}/explorations/ -->
<link rel="stylesheet" href="../../shared/elevate-prototyping-kit/tokens/elevate.css">
<link rel="stylesheet" href="../../shared/elevate-prototyping-kit/components/elevate.css">
<link rel="stylesheet" href="../../shared/elevate-prototyping-kit/icons/icons.css">
```

> **Note:** `shared/elevate-lite/` still exists as **frozen regular files** (no longer a submodule). Old explorations under `epics/*/` continue to reference it and work without submodule initialization. Do not modify files inside `shared/elevate-lite/`. New explorations should always use `shared/elevate-prototyping-kit/`.

### Primary Resources (in priority order):

1. **Specifications**: [`/shared/elevate-prototyping-kit/design-system/DESIGN.md`](./shared/elevate-prototyping-kit/design-system/DESIGN.md)
   - Authoritative source for all component specs
   - Exact colors, spacing, typography, states
   - Read this BEFORE building any UI

2. **Visual Reference**: [Elevate Lookbook](https://www.g2.test/elevate/lookbook)
   - Browse components visually
   - See interactions and variants
   - Production ViewComponents

3. **HTML Templates**: [`/shared/elevate-prototyping-kit/components/templates/`](./shared/elevate-prototyping-kit/components/templates/)
   - Copy-paste ready HTML
   - Lightweight static templates
   - Already aligned with DESIGN.md specs

4. **Design Tokens**: [`/shared/elevate-prototyping-kit/tokens/elevate.css`](./shared/elevate-prototyping-kit/tokens/elevate.css)
   - CSS custom properties
   - Colors, spacing, typography, shadows
   - Auto-updated (symlinked to UE production)

### Workflow for UI Generation:

```
1. Read /shared/elevate-prototyping-kit/design-system/DESIGN.md section for component
2. Extract exact specifications (colors, padding, states)
3. Check if HTML template exists in /shared/elevate-prototyping-kit/components/templates/
4. If exists: use it. If not: build from DESIGN.md specs
5. Reference Lookbook for visual confirmation
```

**Never:**
- Invent colors, spacing, or components
- Use values not defined in DESIGN.md or elevate.css
- Skip reading DESIGN.md when building UI
- Use pure black (#000000) — always use `text-default` (#201f23)

---

## Exploration Conventions

### Starting a New Exploration

1. **Copy the starter template**:
   ```bash
   cp shared/exploration-starter.html epics/[epic-name]/explorations/[number]-[name].html
   ```

2. **Follow numbering convention**:
   - `01-initial-concept.html`
   - `02-refined-layout.html`
   - `03-final-approach.html`
   - Numbers preserve chronology

3. **Include in epic's index.html**:
   - Each epic has a gallery page linking to all explorations

### File Naming

- **Explorations**: `##-descriptive-name.html` (e.g., `01-pricing-tiers.html`)
- **Components**: `kebab-case.html` (e.g., `status-badge.html`)
- **Research**: descriptive names in `/research/spikes/`

### Code Style

- **Elevate utilities**: Use `elv-` prefix (e.g., `elv-flex`, `elv-p-4`)
- **Component classes**: Use BEM-like pattern (e.g., `btn btn--primary btn--md`)
- **Semantic HTML**: Use proper tags (`<button>`, `<nav>`, etc.)
- **Accessibility**: Always include ARIA attributes where needed

---

## Component Library Development

### Current Status (as of April 2026)

**Completed:**
- ✅ Design tokens ported
- ✅ Template infrastructure
- ✅ 1 component complete (chip)

**In Progress:**
- 🔄 Icon library (agent porting ~150 icons)
- 📋 Simple components (11 remaining)

**Approach:**
- **Lightweight**: Don't duplicate Lookbook or DESIGN.md
- **Reference-based**: Templates point to DESIGN.md for full specs
- **Team-shareable**: Designers can copy-paste without technical help

### Building New Component Templates

1. **Read DESIGN.md section** for component specifications
2. **Copy `_template.html`** from `/shared/elevate-prototyping-kit/components/templates/`
3. **Build minimal template**: examples + code snippets (~100 lines max)
4. **Link to DESIGN.md** for authoritative specs
5. **Link to Lookbook** for visual reference
6. **Update progress tracker** in `/shared/.internal/COMPONENT_PROGRESS.md`

**Keep templates simple:**
- Visual examples showing variants
- Copy-paste code snippets
- Link to DESIGN.md for full documentation
- NO comprehensive documentation (DESIGN.md has it)
- NO component gallery (Lookbook is the gallery)

---

## Key Design Principles from DESIGN.md

**Trust-First:**
- G2's trust layer (reviews, ratings, scoring) is first-class UI
- Never hide review counts, recency, or authenticity signals

**Answer-First:**
- Every screen should answer a clear question
- "Which software?" not "Here's some software"

**Agent-Readable:**
- Consistent patterns for humans and AI to parse
- Stable hierarchy, predictable structure

**Calm Density:**
- Information-rich but not cluttered
- Whitespace, tonal layering, disciplined typography

**Typography:**
- **Only Figtree** — no secondary typefaces
- Never use pure black — always `text-default` (#201f23)
- Max 3 font sizes per screen

**Color:**
- Rorange (#ff492c) for brand only (not sentiment, data, eyebrows)
- Purple (#5746b2) for primary CTAs and brand identity
- Use semantic tokens: `text-default`, `bg-neutral-0`, etc.

**Spacing:**
- 4px base unit — all spacing is multiple of 4
- Never invent values outside the defined scale

**Shadows:**
- Subtle, diffused, max 12% opacity
- Static cards have NO shadow (use tonal contrast)
- Only floating elements get shadows

---

## Epic-Specific Context

Each epic has its own `CLAUDE.md` with:
- Problem framing
- Current direction
- Specific requirements
- Research links

**Always check epic's CLAUDE.md** when working in `/epics/[epic-name]/`

---

## Internal Documentation

Planning and progress docs live in `/shared/.internal/`:
- `ELEVATE_ROADMAP.md` — Full component library roadmap
- `COMPONENT_PROGRESS.md` — Progress tracker
- `NEXT_STEPS.md` — Tactical planning

**These are NOT for team sharing** — they're for maintainers only.

---

## Team Collaboration

**Design team members use this repo for:**
- Browsing Lookbook for components
- Copying HTML templates for explorations
- Rapid prototyping without engineering help

**Keep it accessible:**
- Simple HTML (no build tools)
- Clear documentation
- Copy-paste ready code
- Visual examples

---

## Questions or Issues?

- **Design system questions**: Check `/shared/elevate-prototyping-kit/design-system/DESIGN.md`
- **Component questions**: Check Elevate Lookbook
- **Project structure questions**: This file (CLAUDE.md)
- **Epic-specific questions**: Check epic's CLAUDE.md

---

## Summary for Agents

When working in this repo:
1. ✅ **Read DESIGN.md** before generating any UI
2. ✅ **Use existing templates** from `/shared/elevate-prototyping-kit/components/templates/`
3. ✅ **Follow Elevate specs** exactly (colors, spacing, components)
4. ✅ **Check epic CLAUDE.md** for epic-specific context
5. ❌ **Never invent** design patterns, colors, or spacing values

**This is a design exploration workspace.** Prioritize rapid iteration and Elevate fidelity over production-ready code.

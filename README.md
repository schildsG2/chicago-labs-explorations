# chicago-labs-explorations

A unified repo for all G2 product design explorations. Each epic lives under `/epics`. All research lives under `/research`. The master portal is `index.html`.

## Structure

```
chicago-labs-explorations/
├── index.html              ← Start here — visual portal to all epics
├── shared/                 ← Design tokens, styles, and components shared across epics
│   ├── styles.css
│   ├── components/
│   └── tokens/
├── research/               ← All research: spikes, competitive, references
│   └── spikes/
└── epics/
    ├── bulk-purchase/      ← Credits & subscription purchasing UI
    ├── buyer-caddy/        ← Tech stack intelligence & email personalization
    └── agent-performance/  ← Agent monitoring & performance UI
```

## Conventions

- Each epic has its own `index.html` gallery linking to all numbered explorations
- Explorations are numbered (`01-`, `02-`, etc.) to preserve chronology — the label describes the hypothesis
- Research lives in `/research` and is referenced from epic READMEs — never duplicated
- Design tokens and components from UE Elevate are available in `/shared`

## Using Elevate Components

All explorations use the **UE Elevate design system** for 1:1 fidelity with production.

### Quick Start

**Starting a new exploration?**
1. Copy [`/shared/exploration-starter.html`](./shared/exploration-starter.html)
2. Browse the [Elevate Lookbook](https://www.g2.test/elevate/lookbook) for components
3. Copy HTML from [`/shared/elevate-prototyping-kit/components/templates/`](./shared/elevate-prototyping-kit/components/templates/)

**Resources:**
- **Design System Specs**: [`/shared/elevate-prototyping-kit/design-system/DESIGN.md`](./shared/elevate-prototyping-kit/design-system/DESIGN.md) (authoritative specifications)
- **Elevate Lookbook**: https://www.g2.test/elevate/lookbook (visual reference)
- **HTML Templates**: [`/shared/elevate-prototyping-kit/components/templates/`](./shared/elevate-prototyping-kit/components/templates/) (copy-paste ready)
- **Design Tokens**: [`/shared/elevate-prototyping-kit/tokens/elevate.css`](./shared/elevate-prototyping-kit/tokens/elevate.css)
- **Utilities**: [`/shared/elevate-prototyping-kit/utilities.css`](./shared/elevate-prototyping-kit/utilities.css)
- **Icons**: [`/shared/elevate-prototyping-kit/icons/`](./shared/elevate-prototyping-kit/icons/)

DESIGN.md has exact specifications. Lookbook has visual examples. Templates provide HTML.

## Submodule Setup

`shared/elevate-prototyping-kit/` is a git submodule. After cloning:

```bash
git submodule update --init --recursive
```

> **Note:** `shared/elevate-lite/` exists as frozen regular files (not a submodule). Old explorations reference it and work without any initialization. New explorations should use `shared/elevate-prototyping-kit/`.

## Adding a New Epic

1. Create `epics/{epic-name}/`
2. Add `README.md` with problem framing, current direction, and research links
3. Add `index.html` as the exploration gallery
4. Add an `explorations/` folder and number your explorations from `01-`
5. Link the epic from the root `index.html`

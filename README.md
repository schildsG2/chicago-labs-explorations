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
3. Copy HTML from [`/shared/elevate-lite/components/templates/`](./shared/elevate-lite/components/templates/)

**Resources:**
- **Design System Specs**: [`/shared/elevate-lite/design-system/DESIGN.md`](./shared/elevate-lite/design-system/DESIGN.md) (authoritative specifications)
- **Elevate Lookbook**: https://www.g2.test/elevate/lookbook (visual reference)
- **HTML Templates**: [`/shared/elevate-lite/components/templates/`](./shared/elevate-lite/components/templates/) (copy-paste ready)
- **Design Tokens**: [`/shared/elevate-lite/tokens/elevate.css`](./shared/elevate-lite/tokens/elevate.css)
- **Icons**: [`/shared/elevate-lite/icons/`](./shared/elevate-lite/icons/)

DESIGN.md has exact specifications. Lookbook has visual examples. Templates provide HTML.

## Adding a New Epic

1. Create `epics/{epic-name}/`
2. Add `README.md` with problem framing, current direction, and research links
3. Add `index.html` as the exploration gallery
4. Add an `explorations/` folder and number your explorations from `01-`
5. Link the epic from the root `index.html`

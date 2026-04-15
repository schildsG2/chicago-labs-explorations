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

All explorations should use the **UE Elevate design system** to maintain 1:1 fidelity with production designs.

### Quick Start

1. **Include Elevate CSS** in your HTML:
   ```html
   <link rel="stylesheet" href="../../shared/tokens/elevate.css">
   <link rel="stylesheet" href="../../shared/components/elevate.css">
   ```

2. **Wrap content with `elv` attribute**:
   ```html
   <div elv>
     <!-- All Elevate components go here -->
     <button class="btn btn--primary btn--md">Primary Button</button>
   </div>
   ```

3. **Use Elevate utilities and components**:
   - Typography: `elv-text-lg`, `elv-font-semibold`
   - Layout: `elv-flex`, `elv-gap-4`, `elv-p-6`
   - Colors: `elv-bg-primary`, `elv-text-default`
   - Components: `.btn`, `.btn--primary`, `.btn--lg`

### Resources

- **Component Reference**: [`/shared/components/ELEVATE_COMPONENTS.md`](./shared/components/ELEVATE_COMPONENTS.md)
- **Live Demo**: [`/shared/components/elevate-demo.html`](./shared/components/elevate-demo.html)
- **Design Tokens**: [`/shared/tokens/elevate.css`](./shared/tokens/elevate.css)
- **Icon Library**: [`/shared/icons/README.md`](./shared/icons/README.md)
- **Component Library Roadmap**: [`/shared/ELEVATE_ROADMAP.md`](./shared/ELEVATE_ROADMAP.md) 🔄
- **Next Steps**: [`/shared/NEXT_STEPS.md`](./shared/NEXT_STEPS.md)
- **UE Lookbook**: https://www.g2.test/elevate/lookbook

The Elevate CSS is **symlinked to the UE repo**, so it auto-updates when UE rebuilds.

### Component Library Status

We're building a lightweight HTML component library from UE Elevate for rapid prototyping:

- ✅ **Phase 1: Foundation** — Design tokens, documentation, demo page
- 🔄 **Phase 2: Icons** — Porting ~100+ icons from UE Elevate (in progress)
- 📋 **Phase 3: Components** — HTML templates for 34+ components (next)

See [`ELEVATE_ROADMAP.md`](./shared/ELEVATE_ROADMAP.md) for the full plan and [`NEXT_STEPS.md`](./shared/NEXT_STEPS.md) for immediate actions.

## Adding a New Epic

1. Create `epics/{epic-name}/`
2. Add `README.md` with problem framing, current direction, and research links
3. Add `index.html` as the exploration gallery
4. Add an `explorations/` folder and number your explorations from `01-`
5. Link the epic from the root `index.html`

# Elevate Light Component Library — Roadmap

**Goal**: Build a lightweight, production-quality HTML component library using the UE Elevate design system for rapid, high-fidelity prototyping within Chicago Labs explorations.

**Status**: Foundation complete, scaling component coverage

---

## Phase 1: Foundation ✅ COMPLETE

**Objective**: Establish design tokens, documentation structure, and initial patterns

- [x] Port design tokens from UE Elevate (`elevate.css`)
- [x] Set up CSS symlink to UE production for auto-updates
- [x] Create component documentation (`ELEVATE_COMPONENTS.md`)
- [x] Build demo page showcasing patterns (`elevate-demo.html`)
- [x] Document typography, buttons, layouts, alerts, forms
- [x] Establish `[elv]` scoping pattern
- [x] Define utility class conventions (`elv-` prefix)

**Deliverables**: ✅
- `/shared/tokens/elevate.css` — 300+ design tokens
- `/shared/components/ELEVATE_COMPONENTS.md` — Component reference
- `/shared/components/elevate-demo.html` — Working examples

---

## Phase 2: Icon System 🔄 IN PROGRESS

**Objective**: Port icon library from UE Elevate for use in static prototypes

### Current State
- ✅ Icon CSS utilities created (`icons.css`)
- ✅ Icon documentation (`shared/icons/README.md`)
- ✅ 6 initial icons ported
- 🔄 Agent running to port remaining icons

### Remaining Work

#### 2.1 Complete Icon Port
- [ ] Port all UI icons from `/Users/schilds/projects/ue/engines/elevate/app/assets/images/elevate/svg/UI-Icons/`
- [ ] Organize by category (UI, Product, Social, etc.)
- [ ] Update README with complete icon inventory

**Estimated Scope**: ~100-150 icons

#### 2.2 Icon Tooling
- [ ] Create icon gallery page (`shared/icons/index.html`)
- [ ] Add search/filter functionality for icon discovery
- [ ] Document icon naming conventions
- [ ] Create copy-paste templates for common use cases

**Timeline**: 1-2 weeks (mostly automated)

---

## Phase 3: Component HTML Templates 📋 NEXT

**Objective**: Create ready-to-use HTML templates for all 34 documented Elevate components

### 3.1 Low-Hanging Fruit (Simple, No Interactivity)
**Timeline**: 1 week

Static components that only need HTML + CSS:

- [ ] **avatar** — User/product avatars
- [ ] **chip** — Tags and badges
- [ ] **notification_badge** — Notification badges
- [ ] **product_avatar** — Product-specific avatars
- [ ] **product_chip** — Product tags
- [ ] **progress_bar** — Progress indicators
- [ ] **rating_distribution_bar** — Rating visualizations
- [ ] **spin_loader** — Loading spinners
- [ ] **star_rating** — Star ratings
- [ ] **status_badge** — Status indicators
- [ ] **link** — Styled links
- [ ] **breadcrumbs** — Navigation breadcrumbs

**Deliverables**:
- Create `/shared/components/templates/` directory
- One `.html` file per component showing all variants
- Add to documentation with usage examples

### 3.2 Moderate Complexity (Minimal Interactivity)
**Timeline**: 2 weeks

Components needing basic show/hide or state toggling:

- [ ] **accordion** — Collapsible content sections
- [ ] **button_group** — Button groupings (mostly CSS)
- [ ] **content_card** — Content card layouts
- [ ] **control_button** — Icon-based controls
- [ ] **icon_button** — Icon-only buttons
- [ ] **index_nav** — Index/tab navigation
- [ ] **inset_card** — Inset card variants
- [ ] **pagination** — Pagination controls
- [ ] **tab** — Tab navigation
- [ ] **tooltip** — Tooltips

**Deliverables**:
- HTML templates with data-attributes for state
- Optional: Vanilla JS helpers for interactivity
- Document both static and interactive usage

### 3.3 Complex Components (Rich Interactivity)
**Timeline**: 3-4 weeks

Components requiring JavaScript for full functionality:

- [ ] **dropdown_menu** — Dropdown menus
- [ ] **form** — Form components (inputs, textareas, selects, validation)
- [ ] **media_carousel** — Media carousels
- [ ] **modal** — Modal dialogs
- [ ] **notification** / **toast** — Toast notifications
- [ ] **popover** — Popover overlays
- [ ] **slide_out_panel** — Side panels
- [ ] **table** — Table components (sorting, filtering)

**Approach Options**:

1. **Vanilla JS**: Lightweight, no dependencies
2. **Alpine.js**: Minimal framework for interactivity (~15KB)
3. **Hybrid**: Static HTML + optional JS enhancement

**Recommendation**: Start with Vanilla JS helpers, evaluate Alpine.js if patterns become repetitive.

**Deliverables**:
- HTML templates
- JavaScript component modules (`elevate-components.js`)
- Accessibility (ARIA) compliance
- Documentation with initialization code

---

## Phase 4: Integration & Polish 🎯 FUTURE

**Objective**: Make the library production-ready and easy to adopt

### 4.1 Developer Experience
- [ ] Create component starter templates
- [ ] Build live component sandbox (like Elevate Lookbook)
- [ ] Add copy-paste code snippets to all docs
- [ ] Create project scaffolding script for new epics

### 4.2 Quality & Compliance
- [ ] Accessibility audit (WCAG 2.1 AA)
- [ ] Cross-browser testing (Chrome, Firefox, Safari, Edge)
- [ ] Mobile responsive testing
- [ ] Performance optimization (CSS minification, icon sprite sheet)

### 4.3 Documentation
- [ ] Video walkthroughs for complex components
- [ ] Migration guide from Tailwind or other frameworks
- [ ] Pattern library showing common UI patterns (dashboards, forms, etc.)
- [ ] Troubleshooting guide

**Timeline**: 2-3 weeks

---

## Phase 5: Advanced Features ⏭️ OPTIONAL

**Objective**: Extend beyond UE Elevate for Chicago Labs-specific needs

### Potential Additions
- [ ] **Charts & Data Visualization** — D3.js or Chart.js integration
- [ ] **Animation utilities** — CSS transitions and entrance effects
- [ ] **Layout templates** — Dashboard, landing page, form flows
- [ ] **Dark mode support** — Token overrides for dark theme
- [ ] **Responsive utilities** — Breakpoint helpers beyond Elevate defaults

**Decision Point**: Evaluate based on actual exploration needs after Phase 3-4

---

## Timeline Summary

| Phase | Duration | Status |
|-------|----------|--------|
| Phase 1: Foundation | Complete | ✅ |
| Phase 2: Icon System | 1-2 weeks | 🔄 |
| Phase 3.1: Simple Components | 1 week | 📋 |
| Phase 3.2: Moderate Components | 2 weeks | 📋 |
| Phase 3.3: Complex Components | 3-4 weeks | 📋 |
| Phase 4: Integration & Polish | 2-3 weeks | 🎯 |
| Phase 5: Advanced Features | TBD | ⏭️ |

**Total Estimated Timeline**: 10-13 weeks for full library (Phases 1-4)

---

## Success Metrics

**Adoption**:
- All new explorations use Elevate components (not custom CSS)
- Reduction in time-to-prototype for new epics

**Quality**:
- 1:1 visual fidelity with UE production designs
- Zero accessibility violations in automated tests
- Components work across all modern browsers

**Velocity**:
- Designers can build functional prototypes without engineering help
- Component reuse rate >80% across explorations

---

## Decision Log

### Why not just use the UE Elevate Lookbook directly?
The Lookbook is Rails ViewComponents requiring a running UE instance. This library provides:
- Static HTML for fast iteration
- No server/build step required
- Easy to host on Vercel/Netlify
- Portable across projects

### Why vanilla HTML instead of React/Vue components?
- Faster to prototype (no build tooling)
- Lower barrier for designers
- Easy to view source and copy patterns
- Can be lifted into React/Vue later if needed

### Why not use a CSS framework like Tailwind?
We are! Elevate already uses Tailwind under the hood, and we're reusing those utilities (`elv-flex`, `elv-p-4`, etc.). This library is essentially "Elevate-flavored Tailwind + component templates."

---

## Next Actions

1. ✅ **Continue icon port** — Let the agent complete the icon library
2. 📋 **Start Phase 3.1** — Build HTML templates for simple components
3. 📋 **Create component template directory structure**
4. 📋 **Pick 3-5 most-used components** from epics to prioritize

---

## Questions & Open Items

- **Q**: Should we version this library or just track with UE Elevate versions?
- **Q**: Do we need a build step (CSS minification, icon sprites) or keep it fully static?
- **Q**: Should complex components have a Progressive Enhancement strategy (work without JS)?
- **Q**: What's the process for contributing new components not in UE Elevate?


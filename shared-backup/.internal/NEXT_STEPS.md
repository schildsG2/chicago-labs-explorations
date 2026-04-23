# Elevate Component Library — Next Steps

**Quick reference for what to work on next**

---

## Immediate Actions (This Week)

### 1. Monitor Icon Port Progress
**Status**: 🔄 Agent running

**Actions**:
- [ ] Check agent progress daily
- [ ] Once complete, verify all icons render correctly
- [ ] Test icon gallery page loads
- [ ] Update `shared/elevate-lite/icons/README.md` with full icon inventory

**Depends on**: Current icon porting agent

---

### 2. Set Up Component Templates Directory
**Status**: 📋 Ready to start

**Actions**:
```bash
# Create structure
mkdir -p shared/elevate-lite/components/templates
mkdir -p shared/elevate-lite/components/templates/simple
mkdir -p shared/elevate-lite/components/templates/interactive
mkdir -p shared/elevate-lite/components/templates/complex
```

**Files to create**:
- `shared/elevate-lite/components/templates/README.md` — Template usage guide
- `shared/elevate-lite/components/templates/template.html` — Base template with common includes

**Estimated time**: 30 minutes

---

### 3. Build First 5 Simple Components
**Status**: 📋 Next priority

**Recommended starting components** (high usage in current epics):

1. **chip** — Tags and badges (used heavily in buyer-caddy)
2. **avatar** — User avatars (common across all epics)
3. **status_badge** — Status indicators (bulk-purchase, agent-performance)
4. **spin_loader** — Loading states (all epics)
5. **link** — Styled links (foundational)

**For each component**:
- [ ] Create `shared/elevate-lite/components/templates/simple/{component-name}.html`
- [ ] Show all variants (sizes, colors, states)
- [ ] Add copy-paste code snippets
- [ ] Update `ELEVATE_COMPONENTS.md` with template link

**Estimated time**: 4-6 hours (1-2 hours per component)

---

## This Sprint (Next 2 Weeks)

### 4. Complete Simple Component Set
**Goal**: Finish all 12 simple components from Phase 3.1

**Remaining after first 5**:
- notification_badge
- product_avatar
- product_chip
- progress_bar
- rating_distribution_bar
- star_rating
- breadcrumbs

**Estimated time**: 8-10 hours

---

### 5. Create Component Gallery/Sandbox
**Goal**: Make components easy to discover and test

**Approach**:
Create `shared/elevate-lite/components/index.html` as a living catalog:

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Elevate Component Gallery</title>
  <link rel="stylesheet" href="../tokens/elevate.css">
  <link rel="stylesheet" href="elevate.css">
</head>
<body>
  <div elv class="elv-max-w-screen-2xl elv-mx-auto elv-p-8">
    <h1>Elevate Component Gallery</h1>
    
    <!-- Navigation to each component -->
    <nav>
      <a href="templates/simple/chip.html">Chip</a>
      <a href="templates/simple/avatar.html">Avatar</a>
      <!-- etc -->
    </nav>
    
    <!-- Or: iframe each component inline -->
  </div>
</body>
</html>
```

**Features to include**:
- Visual index of all components
- Search/filter by category
- Copy code button for each example
- Dark/light mode toggle

**Estimated time**: 6-8 hours

---

## Next Month

### 6. Tackle Moderate Complexity Components
**Goal**: Add components with minimal interactivity

**Priority order** (based on epic usage):
1. **tooltip** — Used in agent-performance for metric explanations
2. **tab** — Used in bulk-purchase for pricing tiers
3. **accordion** — Used in buyer-caddy for feature lists
4. **pagination** — Used in all epics for data tables
5. **dropdown_menu** — Common pattern across epics

**Approach**:
- Start with CSS-only versions (progressive enhancement)
- Add optional JavaScript for interactivity
- Document both approaches

**Estimated time**: 2-3 weeks

---

## Month 2+

### 7. Complex Interactive Components
**Goal**: Build components requiring JS

**Starting with most critical**:
1. **modal** — High usage across all epics
2. **form** — Input validation, error states
3. **table** — Sorting, filtering (agent-performance needs this)
4. **slide_out_panel** — Detail views in buyer-caddy

**Decision needed**: Choose JS approach
- Option A: Vanilla JS (lightweight, no dependencies)
- Option B: Alpine.js (~15KB, declarative)
- Option C: Hybrid (simple components vanilla, complex use Alpine)

**Recommended**: Start vanilla, evaluate Alpine if patterns repeat

**Estimated time**: 3-4 weeks

---

## Success Checkpoints

**Week 1**:
- ✅ Component templates directory exists
- ✅ 5 simple components built and documented
- ✅ Icon port complete

**Week 2**:
- ✅ All 12 simple components complete
- ✅ Component gallery live
- ✅ First exploration uses new templates

**Month 1**:
- ✅ 10 moderate complexity components complete
- ✅ Tabs, tooltips, accordions working in epics
- ✅ Documentation updated with all new components

**Month 2**:
- ✅ First 4 complex components (modal, form, table, panel) complete
- ✅ JavaScript patterns established
- ✅ 80%+ component reuse across epics

---

## Blockers & Dependencies

**Potential blockers**:
- Icon port taking longer than expected → Fallback: manually port high-priority icons
- UE Elevate updates breaking symlink → Set up monitoring/notifications
- JavaScript approach decision → Document pros/cons, run spike

**Dependencies**:
- None currently blocking Phase 3.1 (simple components)
- UE Elevate Lookbook access for complex component specs
- Design review for any custom components beyond Elevate

---

## How to Contribute

### Adding a New Component

1. **Check if it exists in UE Elevate first**
   - Browse https://www.g2.test/elevate/lookbook
   - Check `/Users/schilds/projects/ue/engines/elevate/app/components/`

2. **Create the template**
   - Use `shared/elevate-lite/components/templates/template.html` as base
   - Show all variants and states
   - Include accessibility attributes

3. **Document it**
   - Add section to `ELEVATE_COMPONENTS.md`
   - Include code examples
   - Note any limitations vs. UE version

4. **Update the gallery**
   - Add to `shared/elevate-lite/components/index.html`

5. **Test in an exploration**
   - Use it in a real prototype
   - Validate responsiveness
   - Check cross-browser

### Reporting Issues

Create a comment in the relevant template file or update `ELEVATE_ROADMAP.md` "Questions & Open Items" section.

---

## Resources

- **UE Elevate Source**: `/Users/schilds/projects/ue/engines/elevate/`
- **Lookbook**: https://www.g2.test/elevate/lookbook
- **This Roadmap**: `shared/ELEVATE_ROADMAP.md`
- **Component Docs**: `shared/elevate-lite/components/ELEVATE_COMPONENTS.md`
- **Demo Page**: `shared/elevate-lite/components/elevate-demo.html`


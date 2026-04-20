# Elevate Lite vs UE Elevate Audit Plan

**Goal**: Systematically compare Elevate Lite components against UE Elevate production source to identify and fix discrepancies.

**Why**: The focus state discrepancy revealed we can't rely solely on DESIGN.md interpretation. Need to verify against production implementation.

---

## Audit Scope

### Components to Audit (30 total)

**Phase 1: Forms (8 components)** - PRIORITY
- [x] text_input
- [x] textarea  
- [x] search_input
- [x] select
- [x] checkbox
- [x] radio_button
- [x] toggle (17 issues: CRITICAL ✅ HIGH ✅ - 100% complete)
- [x] file_upload (if exists in UE)
- [ ] date_picker (if exists in UE)

**Phase 2: Simple Components (13 components)**
- [ ] avatar
- [ ] chip
- [ ] status_badge
- [ ] notification_badge
- [ ] product_avatar
- [ ] product_chip
- [ ] product_details
- [ ] progress_bar
- [ ] rating_distribution_bar
- [ ] spin_loader
- [ ] star_rating
- [ ] link
- [ ] breadcrumbs

**Phase 3: Moderate Components (10 components)**
- [ ] accordion
- [ ] button_group
- [ ] content_card
- [ ] control_button
- [x] icon_button (89 issues: CRITICAL ✅ HIGH ✅ - 100% complete)
- [ ] index_nav
- [ ] inset_card
- [ ] pagination
- [ ] tab
- [x] tooltip (4 issues: all fixed ✅)

**Phase 4: Complex Components (2 built so far)**
- [ ] table (basic)
- [ ] table (sortable)

---

## What to Audit (Per Component)

### 1. Visual Specifications
- **Colors**: Background, text, border colors across all states
- **Spacing**: Padding, margin, gaps (verify 4px base unit)
- **Typography**: Font size, weight, line height
- **Borders**: Width, radius, color
- **Shadows**: Presence, values, opacity

### 2. States
- **Default state**: Initial appearance
- **Hover state**: Color changes, cursor, transitions
- **Focus state**: Outline color, width, offset ⚠️ CRITICAL
- **Active/pressed state**: Click feedback
- **Disabled state**: Opacity, cursor, color
- **Error state**: Border, background, text color
- **Loading state**: Animations, spinners
- **Empty state**: Placeholders, helper text

### 3. Behavior & Interaction
- **Click targets**: Minimum touch target sizes (44px mobile)
- **Keyboard navigation**: Tab order, arrow keys, enter/escape
- **Transitions**: Duration, easing functions
- **Animations**: Keyframes, timing, reduced-motion support

### 4. Accessibility
- **ARIA attributes**: Labels, roles, states, describedby
- **Semantic HTML**: Proper element types
- **Screen reader text**: Hidden labels, announcements
- **Contrast ratios**: WCAG AA compliance

### 5. Variants
- **Sizes**: Small, medium, large (if applicable)
- **Styles**: Primary, secondary, tertiary, ghost
- **Special modes**: Inline, compact, elevated, bordered

---

## Audit Process (Per Component)

### Step 1: Locate Source Files

**UE Elevate Location**:
```
/Users/schilds/projects/ue/engines/elevate/app/components/elevate/{component_name}/
├── component.rb       ← Tailwind classes, structure
├── component.css      ← Custom CSS (if any)
└── preview.rb        ← Usage examples
```

**Elevate Lite Location**:
```
/Users/schilds/projects/chicago-labs-explorations/shared/components/templates/{category}/{component_name}.html
```

### Step 2: Extract UE Specifications

From `component.rb`, extract:
- Tailwind utility classes (e.g., `elv-outline-purple-40`, `elv-p-4`)
- Conditional classes for states/variants
- Data attributes and ARIA attributes

Map Tailwind classes to actual CSS values using:
```
/Users/schilds/projects/chicago-labs-explorations/shared/components/elevate.css
```

Look for patterns:
- `focus:elv-outline-{n}` → focus outline width
- `focus:elv-outline-purple-{n}` → focus color
- `elv-bg-{color}` → background colors
- `elv-p-{n}` → padding values

### Step 3: Compare Against Elevate Lite

Create comparison table:

| Aspect | UE Elevate | Elevate Lite | Match? | Priority |
|--------|-----------|--------------|--------|----------|
| Focus outline color | `#c3bde5` (P40) | `#5746b2` (P100) | ❌ | CRITICAL |
| Focus outline width | `3px` | `2px` | ❌ | HIGH |
| Default background | `#f2f2f3` (N10) | `#f2f2f3` (N10) | ✅ | - |

### Step 4: Categorize Discrepancies

**CRITICAL** (Accessibility/functionality broken):
- Wrong focus states
- Missing keyboard navigation
- Wrong ARIA attributes
- Broken interactions

**HIGH** (Visual mismatch, noticeable):
- Wrong colors in key states
- Wrong sizing (affects layout)
- Missing hover states
- Wrong animations

**MEDIUM** (Subtle visual differences):
- Slight spacing differences (1-2px)
- Transition timing differences
- Minor color shade differences

**LOW** (Nice-to-have, negligible):
- Comment differences
- Class naming differences (if output is same)
- Redundant code

### Step 5: Document Findings

For each discrepancy, record:
```markdown
## Component: {name}

### Discrepancy: {title}
- **Severity**: CRITICAL | HIGH | MEDIUM | LOW
- **Category**: Visual | Behavior | Accessibility | States
- **UE Value**: {actual value from UE}
- **Lite Value**: {current value in Lite}
- **Location**: {file path and line number}
- **Fix Required**: {description of what needs to change}
```

---

## Agent Team Structure

### Audit Team (Phase 1: Discovery)

**Goal**: Each agent audits 2-3 components, produces discrepancy report

**Agent Prompt Template**:
```
Audit these Elevate components: {component_list}

For each component:
1. Read UE source: /Users/schilds/projects/ue/engines/elevate/app/components/elevate/{component}/component.rb
2. Extract all Tailwind classes and map to CSS values using elevate.css
3. Read Elevate Lite template: /shared/components/templates/{category}/{component}.html
4. Compare: colors, spacing, typography, states (focus/hover/disabled/error)
5. Document ALL discrepancies in severity order (CRITICAL → LOW)

Focus especially on:
- Focus states (outline color, width, offset)
- Hover states (background, border changes)
- Disabled states (opacity, cursor)
- Interactive states (active, pressed)
- Spacing (padding, margin)

Output: Discrepancy report with exact values and line numbers.
```

**Parallel Assignment**:
- Agent 1: text_input, textarea, search_input
- Agent 2: select, checkbox, radio_button
- Agent 3: toggle, file_upload, date_picker
- Agent 4: avatar, chip, status_badge
- Agent 5: notification_badge, product_avatar, product_chip
- Agent 6: product_details, progress_bar, rating_distribution_bar
- Agent 7: spin_loader, star_rating, link, breadcrumbs
- Agent 8: accordion, button_group, content_card
- Agent 9: control_button, icon_button, index_nav
- Agent 10: inset_card, pagination, tab, tooltip

Each agent works independently, returns findings report.

### Fix Team (Phase 2: Implementation)

**Goal**: Fix discrepancies in priority order

**Organization by severity**:
- **Sprint 1**: All CRITICAL issues (1-2 agents, sequential or parallel by component)
- **Sprint 2**: All HIGH issues (parallel by component if independent)
- **Sprint 3**: MEDIUM issues (batch similar fixes)
- **Sprint 4**: LOW issues (optional, batch by type)

**Agent Prompt Template**:
```
Fix {severity} discrepancies in these components: {component_list}

Discrepancies to fix:
{paste relevant discrepancy entries}

For each fix:
1. Read the component template file
2. Locate the specific line/section mentioned in discrepancy
3. Change from current value to UE value
4. Verify change doesn't break other states
5. Update demo page if needed
6. Report: file changed, line number, old value, new value

After all fixes:
- Run a visual check against Lookbook if possible
- Confirm all states still render correctly
```

---

## Quality Assurance

### Post-Fix Validation

**Visual QA Agent**:
- Opens demo page in browser
- Tests each fixed component
- Checks all states (hover, focus, disabled, error)
- Confirms keyboard navigation works
- Reports any regressions

**Accessibility QA Agent**:
- Checks focus indicators are visible
- Verifies keyboard navigation
- Validates ARIA attributes
- Tests screen reader compatibility (if tooling available)
- Checks contrast ratios

---

## Rollout Plan

### Week 1: Forms Audit (PRIORITY)
- **Day 1**: Deploy 3 audit agents (forms)
- **Day 2**: Aggregate findings, prioritize
- **Day 3**: Deploy fix agents for CRITICAL issues
- **Day 4**: Deploy fix agents for HIGH issues
- **Day 5**: QA and commit

### Week 2: Simple Components Audit
- **Day 1-2**: Deploy 4 audit agents (simple components)
- **Day 3**: Aggregate and prioritize
- **Day 4-5**: Fix CRITICAL/HIGH issues

### Week 3: Moderate Components Audit
- **Day 1-2**: Deploy 3 audit agents (moderate components)
- **Day 3**: Aggregate and prioritize
- **Day 4-5**: Fix CRITICAL/HIGH issues

### Week 4: Complex Components + Cleanup
- **Day 1**: Audit complex components
- **Day 2-3**: Fix all remaining CRITICAL/HIGH
- **Day 4**: MEDIUM/LOW batch fixes
- **Day 5**: Final QA pass

---

## Success Metrics

- **100% of components audited** against UE source
- **All CRITICAL discrepancies fixed** (accessibility/functionality)
- **90%+ of HIGH discrepancies fixed** (visual accuracy)
- **Documented decisions** for any intentional deviations
- **Updated component templates** reflect UE production

---

## Output Artifacts

1. **Master Discrepancy Log**: `/shared/.internal/AUDIT_FINDINGS.md`
   - All discrepancies organized by component
   - Severity classifications
   - Fix status tracking

2. **Per-Component Reports**: `/shared/.internal/audit-reports/{component}.md`
   - Detailed comparison
   - Line-by-line differences
   - Before/after for fixes

3. **Deviation Registry**: `/shared/.internal/INTENTIONAL_DEVIATIONS.md`
   - Components where we intentionally differ from UE
   - Rationale for each deviation
   - Approved by design team

4. **Updated Progress Tracker**: Update `COMPONENT_PROGRESS.md`
   - Mark components as "Audited ✅"
   - Track fix completion percentage

---

## Notes & Considerations

### When UE Component Doesn't Exist
- Document that Lite component is custom
- Still validate against DESIGN.md
- Get design team review

### When Lite is Intentionally Different
- Document in INTENTIONAL_DEVIATIONS.md
- Explain why (e.g., "Simplified for static HTML")
- Get approval before marking as "audited"

### Edge Cases
- **UE uses ViewComponent logic**: Extract the rendered output, not Ruby logic
- **UE has variants Lite doesn't need**: Document and skip
- **Lite has variants UE doesn't have**: Mark as "custom extension"

### Tools Needed
- UE Elevate source access ✅
- Elevate CSS utility reference ✅
- Browser for visual testing ✅
- Lookbook access for comparison ✅

---

## Progress Update (April 20, 2026)

### Completed
- ✅ **3 components fully audited**: icon_button, toggle, tooltip
- ✅ **110 total issues found**: 23 CRITICAL, 18 HIGH, ~69 MEDIUM/LOW
- ✅ **All CRITICAL fixes applied** (April 17)
- ✅ **All HIGH fixes applied** (April 20)
- ✅ **3 components 100% complete** (CRITICAL + HIGH)

### Issue Breakdown by Component
- **icon_button**: 12 HIGH fixes (XS size, hover shadows, variants)
- **toggle**: 6 HIGH fixes (dimensions, transitions, colors)
- **tooltip**: 4 total fixes (all CRITICAL/HIGH complete)

### Next Steps
1. **Decide**: Continue with MEDIUM/LOW fixes on these 3 components OR
2. **Expand audit** to remaining form inputs (text_input, textarea, search_input, select, checkbox, radio_button)
3. **OR continue with Simple components** (Phase 2: avatar, chip, status_badge, etc.)

### Key Discoveries
- **Focus states**: Use `box-shadow: 0 0 0 4px #c3bde5, 0 0 0 0.5px #ffffff` (NOT outline), except form inputs use `outline: 3px solid #c3bde5`
- **Icon sizing**: All icons 10px fixed, regardless of button size
- **Toggle dimensions**: Wider than expected (sm: 36px, md: 48px, lg: 60px)
- **Transitions**: 150ms cubic-bezier, not 200ms ease

---

## Next Action

**To continue audit**:
```
Continue fixing HIGH priority issues in icon_button and toggle, then audit remaining form inputs.
```

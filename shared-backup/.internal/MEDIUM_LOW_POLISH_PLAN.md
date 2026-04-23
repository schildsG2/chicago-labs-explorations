# MEDIUM/LOW Polish Pass Plan

**Status**: Planning phase  
**Target**: ~69 remaining MEDIUM/LOW issues across 28 audited components  
**Goal**: Reach 98%+ fidelity with UE Elevate production

---

## Issue Inventory by Type

### Type 1: Hardcoded Colors → CSS Variables (MEDIUM)

**Priority**: MEDIUM (token drift risk)  
**Impact**: ~40 instances across multiple components  
**Fix Pattern**:
```css
/* BEFORE */
background: #ff492c;
color: #5746b2;
border: 1px solid #c3bde5;

/* AFTER */
background: var(--bg-brand);
color: var(--text-primary);
border: 1px solid var(--palette-purple-40);
```

**Affected Components** (from audit):
- product_chip (3 instances)
- progress_bar (2 instances)
- rating_distribution_bar (2 instances)
- star_rating (1 instance)
- Likely others from Phase 1 & 3 (need full inventory)

**Batch Strategy**: Search all templates for hex color patterns, replace with corresponding CSS variable.

---

### Type 2: Minor Spacing Differences (MEDIUM)

**Priority**: MEDIUM (subtle visual differences)  
**Impact**: 1-2px differences in padding/margin  
**Fix Pattern**:
```css
/* Example: Tab component */
/* BEFORE */
padding-bottom: 0;

/* AFTER */
padding-bottom: 1px; /* Compensates for 1px border */
```

**Affected Components**: TBD (need to grep for specific spacing patterns)

**Batch Strategy**: Review each case individually — some are intentional compensation patterns.

---

### Type 3: Transition Timing (MEDIUM)

**Priority**: MEDIUM (subtle animation differences)  
**Impact**: Transition duration/easing differences  
**Fix Pattern**:
```css
/* BEFORE */
transition: 150ms ease;

/* AFTER */
transition: 150ms cubic-bezier(0.4, 0, 0.2, 1); /* UE standard */
```

**Affected Components**: TBD (need full inventory)

**Batch Strategy**: Find all `transition:` declarations, verify against UE standard.

---

### Type 4: Comment/Naming Differences (LOW)

**Priority**: LOW (negligible impact)  
**Impact**: Different comments or class names with identical output  
**Fix Pattern**: Case-by-case evaluation

**Batch Strategy**: Skip for now, revisit only if time permits.

---

## Detailed Component Inventory

### Phase 1: Forms (9 components)

**Components**:
- text_input
- textarea
- search_input
- select
- checkbox
- radio_button
- toggle
- icon_button
- tooltip

**Known MEDIUM/LOW issues**: Need to review each template for hardcoded colors.

---

### Phase 2: Simple Components (13 components)

**Components with MEDIUM issues**:
1. **product_chip** (3 MEDIUM)
   - Hardcoded brand color → `var(--bg-brand)`
   - Hardcoded text color → `var(--text-primary)`
   - Hardcoded border color → CSS variable

2. **progress_bar** (2 MEDIUM)
   - Hardcoded purple → `var(--bg-primary-100)`
   - Hardcoded green/red for sentiment → CSS variables

3. **rating_distribution_bar** (2 MEDIUM)
   - Hardcoded purple → CSS variable
   - Transition timing

4. **star_rating** (1 MEDIUM)
   - Hardcoded rorange → `var(--bg-brand)`

**Components with 0 issues**:
- product_avatar ✅
- product_details ✅

**Other components**: May have minor MEDIUM issues (need review)
- avatar
- chip
- status_badge
- notification_badge
- spin_loader
- link
- breadcrumbs

---

### Phase 3: Moderate Components (6 components)

**Known MEDIUM issues**: "Minor MEDIUM issues" mentioned but not detailed.

**Components**:
- button_group
- content_card
- control_button
- inset_card
- pagination
- tab

**Action**: Review each template for hardcoded colors, spacing, transitions.

---

## Batch-Fixing Strategy

### Option A: Fix by Type (Parallel by Category)

**Approach**: Group all instances of each issue type, fix across all components.

**Workflow**:
1. **Agent 1**: Search all 28 templates for hardcoded hex colors
   - Extract all instances
   - Map each hex to CSS variable
   - Apply fixes across all templates
   
2. **Agent 2**: Search all 28 templates for transition declarations
   - Verify against UE standard: `150ms cubic-bezier(0.4, 0, 0.2, 1)`
   - Fix any deviations
   
3. **Agent 3**: Review spacing compensation patterns
   - Identify intentional vs unintentional differences
   - Apply fixes where needed

**Pros**:
- Efficient for repetitive fixes (hardcoded colors)
- Ensures consistency across all components
- Fast parallel execution

**Cons**:
- May miss component-specific context
- Requires careful coordination to avoid conflicts

---

### Option B: Fix by Component (Parallel by Component)

**Approach**: Each agent takes 4-5 components, fixes all MEDIUM/LOW issues in those.

**Workflow**:
1. **Agent 1**: text_input, textarea, search_input, select
2. **Agent 2**: checkbox, radio_button, toggle, icon_button, tooltip
3. **Agent 3**: avatar, chip, status_badge, notification_badge, product_chip
4. **Agent 4**: product_details, progress_bar, rating_distribution_bar, spin_loader, star_rating
5. **Agent 5**: link, breadcrumbs, button_group, content_card
6. **Agent 6**: control_button, inset_card, pagination, tab

**Pros**:
- Agents have full context of each component
- Can handle component-specific edge cases
- No file conflicts

**Cons**:
- Slower for repetitive issues
- May miss cross-component patterns

---

### Recommended Approach: Hybrid

**Phase 1: Automated sweep for hardcoded colors** (single agent, fast)
- Grep all 28 templates for hex color patterns
- Map to CSS variables
- Apply fixes in single pass
- ~80% of MEDIUM issues are this type

**Phase 2: Component-specific review** (parallel agents)
- Each agent takes 4-5 components
- Fixes remaining spacing, transition, component-specific issues
- QA visual output

---

## Execution Plan

### Step 1: Hardcoded Color Sweep (1 agent, ~1 hour)

**Prompt**:
```
Search all 28 Elevate Lite component templates for hardcoded hex color values.

For each instance:
1. Identify the hex value (e.g., #ff492c, #5746b2, #c3bde5)
2. Map to appropriate CSS variable from elevate.css
3. Replace hex with var(--variable-name)

Common mappings:
- #ff492c → var(--bg-brand)
- #5746b2 → var(--text-primary) or var(--palette-purple-100)
- #c3bde5 → var(--palette-purple-40)
- #fafafa → var(--bg-neutral-5)
- #f2f2f3 → var(--bg-neutral-10)
- #b0afb6 → var(--border-medium)
- #6f6d78 → var(--text-neutral-70)
- #4c4b53 → var(--text-subtle)

Report: file, line number, old value, new value
```

**Expected output**: ~40 fixes across ~15 components

---

### Step 2: Component-Specific Polish (6 agents, ~2 hours)

**Agent assignments** (4-5 components each):

**Agent 1: Forms Group A**
- text_input
- textarea
- search_input
- select

**Agent 2: Forms Group B**
- checkbox
- radio_button
- toggle
- icon_button
- tooltip

**Agent 3: Simple Group A**
- avatar
- chip
- status_badge
- notification_badge
- product_chip

**Agent 4: Simple Group B**
- product_avatar (already perfect)
- product_details (already perfect)
- progress_bar
- rating_distribution_bar
- spin_loader

**Agent 5: Simple Group C + Moderate A**
- star_rating
- link
- breadcrumbs
- button_group
- content_card

**Agent 6: Moderate Group B**
- control_button
- inset_card
- pagination
- tab

**Prompt template**:
```
Review these Elevate Lite components for remaining MEDIUM/LOW issues:
{component_list}

For each component:
1. Check transition declarations - verify: 150ms cubic-bezier(0.4, 0, 0.2, 1)
2. Check for any remaining hardcoded colors (after Step 1 sweep)
3. Review spacing for 1-2px differences (verify intentional vs error)
4. Compare against UE source if uncertain

Fix any MEDIUM/LOW issues found.
Report: component, issue type, old value, new value, line number
```

---

### Step 3: QA Pass (1 agent or manual, ~30 minutes)

- Visual review of all 28 components
- Verify no regressions from token replacements
- Check that all hardcoded colors replaced
- Confirm transition timing consistency

---

## Success Metrics

**Target compliance**: 98%+

**Expected fixes**:
- ~40 hardcoded color replacements
- ~15 transition timing fixes
- ~10 spacing adjustments
- ~4 miscellaneous

**Total**: ~69 MEDIUM/LOW fixes

**Output**: All 28 components at 98%+ fidelity with UE Elevate.

---

## Rollout Timeline

**Option A: Today** (aggressive, ~4 hours total)
- Hour 1: Hardcoded color sweep
- Hour 2-3: Parallel component polish (6 agents)
- Hour 4: QA and commit

**Option B: Tomorrow** (relaxed, spread work)
- Session 1: Hardcoded color sweep + commit
- Session 2: Component polish agents (parallel)
- Session 3: QA pass

---

## Next Steps

1. **Choose execution approach**: Hybrid recommended
2. **Start with hardcoded color sweep**: Single agent, fast wins
3. **Then parallel component polish**: 6 agents, comprehensive
4. **QA and document final compliance**: Update AUDIT_LEARNINGS.md with final metrics

---

## Notes

- Focus on MEDIUM issues first, skip LOW unless trivial
- LOW issues (comments, naming) don't affect visual output — defer
- If uncertain about a fix, check UE source as authoritative
- Document any intentional deviations in INTENTIONAL_DEVIATIONS.md (if needed)

---

## Post-Polish Actions

After 98% compliance achieved:

1. **Update COMPONENT_PROGRESS.md**: Mark all 28 as "98% complete"
2. **Update AUDIT_LEARNINGS.md**: Add final compliance metrics
3. **Commit and push**: "Polish MEDIUM/LOW issues to 98% compliance"
4. **Decide next**: Phase 4 (complex components) or other priorities

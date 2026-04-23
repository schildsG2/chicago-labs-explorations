# Next Session: MEDIUM/LOW Polish Pass

**Date**: April 20, 2026  
**Status**: Audit complete (28 components, 95% compliance), ready for polish pass

---

## Where We Left Off

✅ **Audit complete**: All CRITICAL + HIGH issues fixed across 28 components
- 38 CRITICAL fixes applied
- 81 HIGH fixes applied  
- 2 components rewritten (chip, control_button)
- 95% compliance achieved

📋 **Ready for polish**: ~69 MEDIUM/LOW issues remaining
- **Primary issue**: Hardcoded hex colors instead of CSS variables (~290 instances found)
- **Secondary issues**: Transition timing, minor spacing tweaks

---

## Key Discovery This Session

**Hardcoded color scope larger than expected**:
- Initial estimate: ~40 instances
- Actual finding: **290+ hex color instances** across 28 components
- Many in documentation/spec tables (should keep)
- Many in actual CSS (should replace with CSS variables)

**Example**:
```css
/* KEEP (documentation) */
<td>border: 2px solid #5746b2</td>

/* REPLACE (actual CSS) */
.chip:focus {
  border-color: #5746b2; /* ← replace with var(--text-primary) */
}
```

---

## Next Action: Manual Targeted Color Replacement

**Approach chosen**: Manual targeted (accurate, preserves documentation)

**Workflow**:
1. Process one component at a time
2. Read template file
3. Identify CSS hex colors (ignore documentation tables/comments)
4. Replace with appropriate CSS variable from mapping below
5. Verify no visual regression

**Common color mappings**:
```
#ff492c → var(--bg-brand)           (rorange)
#5746b2 → var(--text-primary)       (dark purple)
#c3bde5 → var(--palette-purple-40)  (light purple, focus)
#fafafa → var(--bg-neutral-5)       (input backgrounds)
#f2f2f3 → var(--bg-neutral-10)      (hover states)
#dfdfe2 → var(--border-light)       (N20)
#b0afb6 → var(--border-medium)      (N40, default borders)
#6f6d78 → var(--text-neutral-70)    (subtle text variant)
#4c4b53 → var(--text-subtle)        (N80, default subtle)
#201f23 → var(--text-default)       (default text)
```

**Processing order** (by component type):

**Forms** (9 components):
- text_input, textarea, search_input, select
- checkbox, radio_button, toggle
- icon-button, tooltip

**Simple** (13 components):
- avatar, chip, status-badge, notification-badge
- product-avatar, product-chip, product-details
- progress-bar, rating-distribution-bar, spin-loader
- star-rating, link, breadcrumbs

**Moderate** (6 components):
- button-group, content-card, control-button
- inset-card, pagination, tab

**Estimated time**: 1-2 hours for all 28 components

---

## After Color Replacement

Optional follow-up work (if time permits):

1. **Transition timing fixes** (~15 instances)
   - Find: `transition: 150ms ease;`
   - Replace: `transition: 150ms cubic-bezier(0.4, 0, 0.2, 1);`

2. **Minor spacing adjustments** (~10 instances)
   - Review component-by-component
   - Most are intentional compensation patterns

3. **QA pass**
   - Visual review of all 28 components
   - Verify no regressions from token replacements

---

## Success Criteria

- All CSS hex colors → CSS variables (keep docs as-is)
- No visual regressions
- 98%+ compliance with UE Elevate
- Ready for production use

---

## Files to Reference

- **Color mappings**: `/shared/elevate-lite/tokens/elevate.css`
- **Polish plan**: `/shared/.internal/MEDIUM_LOW_POLISH_PLAN.md`
- **Audit learnings**: `/shared/.internal/AUDIT_LEARNINGS.md`
- **Templates**: `/shared/elevate-lite/components/templates/{category}/{component}.html`

---

## Quick Start Command

When resuming:
```
Start manual color replacement in forms components (text_input, textarea, search_input, select)
```

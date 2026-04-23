# Elevate QA Issues - Available Prospects Page

**File**: `pages/prospects-available.html`  
**Date**: 2026-04-22  
**Overall Compliance**: ~85%  
**Total Issues**: 23 (8 critical, 15 minor)

---

## 🚨 Critical Issues (Priority 1)

### Focus States - Missing Keyboard Navigation Support

**Issue 1: Buttons lack focus states** (Lines 455-483)
- Missing `:focus` and `:focus-visible` styles on `.btn`
- **Required**: `box-shadow: 0px 0px 0px 0.5px rgb(255, 255, 255), 0px 0px 0px 3px rgb(195, 189, 229)`
- **Impact**: Keyboard users cannot see which button has focus

**Issue 2: Form inputs lack focus states** (Lines 322-332)
- `.filter-select` and `.filter-input` missing explicit `:focus` styling
- **Required**: Purple outline/shadow per Elevate spec
- **Impact**: Keyboard navigation unclear in filters

**Issue 3: Primary tabs lack focus states** (Lines 194-221)
- `.primary-tab` has no `:focus` styling
- **Required**: Focus indicator for keyboard navigation
- **Impact**: Tab navigation not accessible

**Issue 4: Secondary tabs lack focus states** (Lines 224-256)
- `.secondary-tab` has no `:focus` styling
- **Required**: Focus indicator for keyboard navigation
- **Impact**: Tab navigation not accessible

**Issue 5: Breadcrumb links lack focus states** (Lines 79-91)
- `.breadcrumb-link` missing `:focus` styling
- **Required**: Focus indicator for keyboard navigation
- **Impact**: Breadcrumb navigation not accessible

### Accessibility - Form Labels & ARIA

**Issue 6: Form inputs missing label associations** (Lines 682-697)
- Labels exist but not using `for` attribute with matching `id`
- **Required**: `<label for="departments-select">` with `<select id="departments-select">`
- **Impact**: Screen readers cannot associate labels with inputs

**Issue 7: Select-all checkbox lacks label** (Line 818)
- No `aria-label` or associated `<label>` for master checkbox
- **Required**: `aria-label="Select all companies"` or `<label>`
- **Impact**: Screen readers cannot describe checkbox purpose

**Issue 8: Date filter buttons lack descriptive labels** (Lines 739-748)
- Button text "7d", "30d" too cryptic
- **Required**: `aria-label="Filter by last 7 days"` etc.
- **Impact**: Screen readers read "seven dee" instead of meaningful description

### Code Quality

**Issue 9: Inline style in header** (Line 600)
- `<span style="font-size: 16px; font-weight: 600; margin-left: 4px;">MyG2</span>`
- **Required**: Move to CSS class
- **Impact**: Inconsistent styling approach, harder to maintain

**Issue 10: Inline style on SVG** (Line 744)
- `style="vertical-align: middle; margin-right: 4px;"`
- **Required**: Move to CSS class
- **Impact**: Inconsistent styling approach

---

## ⚠️ Minor Issues (Priority 2)

### Spacing - Off 4px Grid

**Issue 11**: Line 77 - `margin-bottom: 6px` → should be 4px or 8px  
**Issue 12**: Line 163 - `margin-bottom: 10px` → should be 8px or 12px  
**Issue 13**: Line 584 - `margin-bottom: 20px` → should be 16px or 24px  
**Issue 14**: Line 76 - `gap: 2px` → should be 4px  
**Issue 15**: Line 107 - `gap: 6px` → should be 4px or 8px

### Border Width - Non-Standard

**Issue 16**: Multiple instances of `0.5px solid` borders (12 occurrences)
- **Lines**: 17, 101, 226, 276, 282, 283, 285, 395, 426, 501, 512
- **Required**: `1px solid` per Elevate spec
- **Rationale**: 0.5px is too thin and inconsistent across browsers

### Colors - Hardcoded Values

**Issue 17**: Intent badge colors hardcoded (Lines 545-546)
- Using `#d0f6f1` and `#0f5249` for high intent badge
- **Required**: Use semantic tokens like `--bg-success-20` and `--text-success` or create new tokens
- **Impact**: Not maintainable, breaks design token system

**Issue 18**: Intent badge colors hardcoded (Lines 549-550)
- Using `#e6f4ff` and `#1e5a8e` for medium intent badge
- **Required**: Create semantic tokens or use existing ones
- **Impact**: No Elevate equivalent exists for medium state

### Shadows - Non-Standard

**Issue 19**: Tooltip shadow exceeds max opacity (Line 141)
- `box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.15)` (15% opacity)
- **Required**: Max 12% opacity per Elevate spec
- **Fix**: Change to `rgba(0, 0, 0, 0.12)`

**Issue 20**: Tooltip shadow using wrong color base (Line 141)
- Using `rgba(0, 0, 0, ...)` instead of `rgba(32, 31, 35, ...)`
- **Required**: Use Elevate's neutral-100 color base
- **Fix**: Change to `rgba(32, 31, 35, 0.12)`

**Issue 21**: Sticky header shadow non-standard (Line 433)
- `box-shadow: 0px 1px 2px rgba(32,31,35,0.08)`
- **Note**: 8% opacity is OK, but doesn't match standard Elevate shadow tokens
- **Consider**: Using `--shadow-1` or `--shadow-2` token if available

---

## 📋 Fix Checklist

### Phase 1: Accessibility (Critical)
- [ ] Add focus states to all buttons (`.btn`, `.btn--primary`)
- [ ] Add focus states to form inputs (`.filter-select`, `.filter-input`)
- [ ] Add focus states to tabs (`.primary-tab`, `.secondary-tab`)
- [ ] Add focus states to breadcrumb links (`.breadcrumb-link`)
- [ ] Add `for`/`id` associations to all form labels
- [ ] Add `aria-label` to select-all checkbox
- [ ] Add descriptive `aria-label` to date filter buttons
- [ ] Remove inline styles (lines 600, 744), create CSS classes

### Phase 2: Design System Compliance
- [ ] Change all `0.5px` borders to `1px` (12 instances)
- [ ] Fix spacing values to 4px multiples:
  - [ ] Line 77: 6px → 4px or 8px
  - [ ] Line 163: 10px → 8px or 12px
  - [ ] Line 584: 20px → 16px or 24px
  - [ ] Line 76: 2px → 4px
  - [ ] Line 107: 6px → 4px or 8px
- [ ] Replace hardcoded intent badge colors with semantic tokens
- [ ] Fix tooltip shadow: 15% → 12% opacity
- [ ] Fix tooltip shadow: use `rgba(32,31,35,...)` color base
- [ ] Consider using Elevate shadow tokens for consistency

### Phase 3: Polish (Optional)
- [ ] Review and standardize all shadow usage
- [ ] Consider extracting repeated shadow values to CSS variables
- [ ] Add responsive breakpoints for fixed sidebar width (300px)

---

## ✅ What's Already Correct

**Typography** ✓
- All text uses Figtree font (`var(--font-sans)`)
- No pure black (#000000) - always uses `--text-default`
- Typography scale matches Elevate specs
- Proper use of semantic text color tokens

**Colors** ✓
- Extensive use of CSS variables for backgrounds, borders, text
- Proper hierarchy with `--bg-primary`, `--bg-neutral-*`
- Good semantic token usage (~85% overall)

**Spacing** ✓
- Most spacing values are 4px multiples (4px, 8px, 12px, 16px, 24px)
- Gap values properly aligned to grid

**Border Radius** ✓
- Correct values: 4px (badges), 8px (inputs/buttons), 12px (cards)

**Component Patterns** ✓
- Button structure follows `btn btn--primary` pattern
- Button specs correct: padding (10px 16px), font size (14px), weight (600)
- Proper button states (hover, active, disabled)
- Semantic HTML structure (nav, header, aside, table)

---

## 🎯 Estimated Effort

- **Phase 1 (Critical)**: ~2-3 hours
  - Focus states: 45 minutes
  - Form labels: 30 minutes
  - ARIA labels: 30 minutes
  - Inline style cleanup: 15 minutes

- **Phase 2 (Compliance)**: ~1-2 hours
  - Border width updates: 30 minutes
  - Spacing fixes: 30 minutes
  - Color token creation: 30 minutes
  - Shadow fixes: 15 minutes

- **Total**: ~3-5 hours for full compliance

---

## 📚 Reference

- **Elevate Spec**: `/shared/elevate-lite/design-system/DESIGN.md`
- **Focus States**: Box-shadow for buttons, outline for inputs
- **Spacing Grid**: All values must be multiples of 4px
- **Border Width**: 1px for ghost borders, never 0.5px
- **Shadow Opacity**: Maximum 12% opacity
- **Color Base**: Use `rgba(32, 31, 35, ...)` not `rgba(0, 0, 0, ...)`

---

**Next Steps**: Assign to agent for fixes or tackle in phases based on priority.

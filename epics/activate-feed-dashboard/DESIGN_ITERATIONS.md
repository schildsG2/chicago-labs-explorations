# Feed Row Height Reduction — Design Exploration

## Current State Analysis

**Current card structure (01-base-feed.html):**
- Blurred company name: ~20px height
- Employee count: ~21px
- Location: ~21px  
- Industry: ~21px
- Intent chip: ~28px
- Timestamp: ~18px
- Gap between elements: 12px × 5 = 60px
- Card padding: 24px × 2 = 48px
- **Total approximate height: ~237px per card**

**Vertical space breakdown:**
- Content: ~129px (54%)
- Gaps: ~60px (25%)
- Padding: ~48px (20%)

## Strategies to Reduce Height

### 1. Layout Transformation Approaches

#### A. Horizontal Card Layout
**Concept:** Arrange info left-to-right instead of top-to-bottom

```
[Blurred Name]    [74 employees • United States]    [Industry]    [High]    [2m ago]
```

**Height savings:** ~60-70% (from ~237px to ~70-80px)

**Tradeoffs:**
- ✅ Massive density gain — 3x more items visible
- ✅ Single line scan — eyes move left-to-right naturally
- ❌ Requires careful responsive strategy (mobile breaks)
- ❌ Long industry names may wrap or truncate
- ⚠️ Intent chip becomes one of many elements (less prominent)

#### B. Two-Column Card Split
**Concept:** Split info into left/right columns within card

```
[Blurred Name]               [High] [2m ago]
74 employees • United States
Ball and Roller Bearing Mfg
```

**Height savings:** ~30-40% (from ~237px to ~140-160px)

**Tradeoffs:**
- ✅ Moderate density improvement
- ✅ Intent chip remains prominent (top-right)
- ✅ Maintains card feeling
- ✅ Mobile-friendly (can collapse to single column)
- ⚠️ Slightly more complex visual hierarchy

#### C. Compact List View (No Cards)
**Concept:** Remove card container, use alternating row backgrounds

```
────────────────────────────────────────────────
[Blurred Name] • 74 employees • US • Industry • High • 2m
────────────────────────────────────────────────
[Blurred Name] • 45 employees • UK • Industry • High • 5m
────────────────────────────────────────────────
```

**Height savings:** ~70-80% (from ~237px to ~45-60px)

**Tradeoffs:**
- ✅ Maximum density — table-like efficiency
- ✅ Familiar pattern (email inbox, logs)
- ❌ Loses "premium" card aesthetic
- ❌ Harder to maintain visual separation
- ❌ Intent signals blend into row (less prominent)

---

### 2. Information Architecture Approaches

#### D. Progressive Disclosure
**Concept:** Show minimal info by default, expand on hover/click

```
Default view:
[Blurred Name]    [High]    [2m ago]

Hover/expanded:
[Blurred Name]    [High]    [2m ago]
↳ 74 employees • United States • Ball and Roller Bearing Manufacturing
```

**Height savings:** ~50% default, 0% when expanded

**Tradeoffs:**
- ✅ Dramatic density improvement in default state
- ✅ User controls information depth
- ❌ Requires interaction to see context
- ❌ Unclear which companies are worth expanding
- ⚠️ May hide critical decision-making info

#### E. Smart Prioritization
**Concept:** Show only highest-value fields, hide redundant info

**Keep:**
- Blurred name (unlock gate)
- Intent chip (decision driver)
- Employee count (company size matters)
- Timestamp (urgency signal)

**Remove/minimize:**
- Location (less critical? or show as 2-letter code)
- Industry (often verbose, could abbreviate)

**Height savings:** ~35-45% (from ~237px to ~130-155px)

**Tradeoffs:**
- ✅ Cleaner, more focused cards
- ✅ Faster scanning
- ❌ May remove context users want
- ⚠️ Need user research to validate what's truly needed

#### F. Inline Metadata
**Concept:** Combine related fields on single lines with separators

```
[Blurred Name]
74 employees • United States • Ball and Roller Bearing Mfg
[High]  •  less than a minute ago
```

**Height savings:** ~30-40% (from ~237px to ~140-160px)

**Tradeoffs:**
- ✅ Moderate density gain
- ✅ Maintains all information
- ✅ Natural grouping (company context on one line)
- ⚠️ Slightly harder to scan individual fields
- ⚠️ Long text may wrap awkwardly

---

### 3. Visual Density Approaches

#### G. Reduce Spacing
**Concept:** Tighten gaps and padding throughout

**Current:**
- Card padding: 24px
- Element gaps: 12px
- Typography line-height: 1.4-1.5

**Optimized:**
- Card padding: 16px (save 16px)
- Element gaps: 8px (save 20px)
- Typography line-height: 1.3 (save ~3-5px)

**Height savings:** ~15-20% (from ~237px to ~190-200px)

**Tradeoffs:**
- ✅ Easy to implement
- ✅ Maintains structure
- ✅ Still feels spacious enough
- ⚠️ Diminishing returns — can only tighten so much before feels cramped

#### H. Typography Scale Down
**Concept:** Reduce font sizes for metadata

**Current:**
- Company name: 15px
- Metadata: 14px
- Chip: 13px
- Timestamp: 13px

**Optimized:**
- Company name: 15px (keep)
- Metadata: 13px (save ~1-2px per line)
- Chip: 12px
- Timestamp: 12px

**Height savings:** ~5-10% (from ~237px to ~215-225px)

**Tradeoffs:**
- ✅ Subtle improvement
- ⚠️ Must maintain readability
- ⚠️ May look cramped if overdone

---

### 4. Hybrid Approaches

#### I. Horizontal + Reduced Spacing
**Concept:** Combine horizontal layout with tighter spacing

```
[Blurred Name]  [74 emp • US • Industry]  [High]  [2m]
────────────────────────────────────────────────────
```

**Height savings:** ~75-80% (from ~237px to ~50-60px)

**Tradeoffs:**
- ✅ Massive density gain
- ✅ Clean, minimal aesthetic
- ⚠️ All the horizontal layout tradeoffs apply

#### J. Two-Column + Smart Prioritization
**Concept:** Two-column layout with only essential fields

```
[Blurred Name]           [High] [2m]
74 employees • US
```

**Height savings:** ~45-55% (from ~237px to ~110-130px)

**Tradeoffs:**
- ✅ Good balance of density and context
- ✅ Maintains card structure
- ✅ Intent remains prominent
- ⚠️ Industry field removed (is this OK?)

---

## Recommended Exploration Order

### High Priority (Implement First)

1. **Inline Metadata (F)** — Low risk, moderate gain, maintains all info
2. **Two-Column Split (B)** — Good density, natural hierarchy, mobile-friendly
3. **Reduced Spacing (G)** — Easy win, works with other approaches

### Medium Priority (Test if above insufficient)

4. **Horizontal Layout (A)** — Biggest gain but highest risk
5. **Two-Column + Smart Prioritization (J)** — Balanced hybrid

### Lower Priority (Consider if needed)

6. **Compact List View (C)** — Maximum density, loses premium feel
7. **Progressive Disclosure (D)** — Requires interaction, may hide too much

### Don't Pursue (Yet)

8. **Typography Scale Down (H)** — Minimal gain, risks readability
9. **Smart Prioritization alone (E)** — Need research to validate

---

## Key Questions Before Implementing

1. **What's the target row height?** (e.g., "fit 10 companies in 800px viewport")
2. **Mobile strategy?** Some approaches break on narrow screens
3. **Information priority?** Is industry essential or can it be minimized?
4. **Intent signal prominence?** Should chips dominate visually or blend in?
5. **User scanning behavior?** Vertical or horizontal scan preference?

---

## Next Steps

1. **Choose 2-3 approaches** to prototype (recommend: F, B, G)
2. **Build variations** as 02, 03, 04 explorations
3. **Compare side-by-side** with original base feed
4. **Test with real data** (long company names, varied industries)
5. **Get user feedback** on scannability and decision confidence

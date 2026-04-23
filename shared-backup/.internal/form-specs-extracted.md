# Text Input & Textarea Specifications

**Source**: DESIGN.md lines 444-458  
**Reference**: search-input.html (existing implementation)  
**For**: Text Input & Textarea builder agents

---

## Base Input Specifications

### Layout & Structure

| Property | Value | Token | Notes |
|----------|-------|-------|-------|
| Background | `#f2f2f3` | N10 | Slightly elevated surface |
| Border | `1px solid #dfdfe2` | border-light | Default state |
| Border Radius | `8px` | radius-sm | Consistent with search input |
| Height (default) | `40px` | — | Standard input height |
| Height (large) | `48px` | — | Large variant |
| Padding | `0 12px` | — | Horizontal padding for text inputs |

### Typography

| Element | Font Size | Weight | Line Height | Color | Token |
|---------|-----------|--------|-------------|-------|-------|
| Input Text | `16px` | 400 | `24px` | `#201f23` | text-default |
| Label | `14px` | 600 | `20px` | `#201f23` | text-default (Label Sm) |
| Placeholder | `16px` | 400 | `24px` | `#6f6d78` | text-nonessential |
| Helper Text | `12px` | 400 | `16px` | `#6f6d78` | text-nonessential |
| Error Message | `12px` | 600 | `16px` | `#b21800` | R140 |

---

## State Specifications

### Default State
```css
background: #f2f2f3; /* N10 */
border: 1px solid #dfdfe2; /* border-light */
color: #201f23; /* text-default */
```

### Focus State ⚡️ CRITICAL
```css
border: 2px solid #5746b2; /* P100 - Primary Purple */
/* Adjust padding by 1px to compensate for thicker border */
padding: 0 11px; /* Was 0 12px */
outline: none;
```

**Note**: Focus state MUST have 2px purple border for accessibility

### Error State
```css
border: 2px solid #eb2000; /* R120 - Critical */
/* Adjust padding like focus state */
padding: 0 11px;
```

**Error Message Below Input**:
```html
<p class="error-message" style="color: #b21800; font-size: 12px; font-weight: 600; margin-top: 4px;">
  Error message text
</p>
```

### Disabled State
```css
background: #fafafa; /* N5 */
color: #b0afb6; /* N40 */
border: 1px solid #dfdfe2; /* border-light */
cursor: not-allowed;
```

---

## Component Patterns

### Label Pattern
```html
<label class="elv-input-label" for="input-id">
  Label Text
  <span class="elv-input-optional">(optional)</span>
</label>
<input id="input-id" ... />
```

**Label Styling**:
```css
.elv-input-label {
  display: block;
  font-size: 14px;
  font-weight: 600;
  color: #201f23;
  margin-bottom: 4px;
}
```

### Helper Text Pattern
```html
<p class="elv-input-helper">
  Helper text goes here
</p>
```

**Helper Text Styling**:
```css
.elv-input-helper {
  font-size: 12px;
  color: #6f6d78;
  margin-top: 4px;
}
```

### Required Indicator
```html
<label>
  Label Text <span class="elv-required">*</span>
</label>
```

---

## Text Input Variants

All variants use the SAME base styling with different `type` attributes:

1. **Text**: `type="text"`
2. **Email**: `type="email"`
3. **Password**: `type="password"` (+ show/hide toggle)
4. **Number**: `type="number"`
5. **URL**: `type="url"`
6. **Tel**: `type="tel"`

### Password Show/Hide Toggle

**Pattern from search-input.html**:
```html
<div class="elv-input-wrapper">
  <input type="password" id="password" />
  <button class="elv-input-toggle" aria-label="Show password">
    <span class="material-symbols-outlined">visibility</span>
  </button>
</div>
```

Button positioning: absolute, right: 8px

---

## Textarea Specific Specs

**Additional Properties**:
```css
resize: vertical; /* Only vertical resize */
min-height: 80px; /* Default minimum height */
padding: 12px; /* Vertical and horizontal padding */
font-family: var(--font-sans); /* Inherit Figtree */
```

**Character Count** (optional):
```html
<div class="elv-textarea-wrapper">
  <textarea maxlength="500"></textarea>
  <span class="elv-char-count">0 / 500</span>
</div>
```

Position: absolute, bottom-right of textarea container

---

## Accessibility Requirements

### Required ARIA Attributes

**For inputs with labels**:
```html
<label for="input-id">Label</label>
<input id="input-id" aria-label="Label" />
```

**For error states**:
```html
<input aria-invalid="true" aria-describedby="error-id" />
<p id="error-id" role="alert">Error message</p>
```

**For required fields**:
```html
<input required aria-required="true" />
```

### Keyboard Navigation
- Tab: Move between inputs
- Shift+Tab: Move backward
- Enter: Submit form (if in form context)

---

## Spacing & Layout

**Vertical Spacing**:
- Label to input: `4px` (space-1)
- Input to helper text: `4px` (space-1)
- Input to error message: `4px` (space-1)
- Between form fields: `16px` (space-4)

---

## Consistency Notes

**Match search-input.html**:
- Use same transition: `border 150ms ease`
- Use same color variables/tokens
- Use same class naming pattern: `elv-[component]__[element]`
- Use same focus state padding adjustment technique
- Use Material Symbols for icons (if needed)

**File Structure**:
- Keep template structure consistent
- Show default variant first
- Then show all other variants
- Then show all states (focus, error, disabled)
- Include accessibility section
- Include specs table at bottom

---

## Copy-Paste CSS Values

```css
/* Base Input */
background: #f2f2f3; /* N10 */
border: 1px solid #dfdfe2; /* border-light */
border-radius: 8px; /* radius-sm */
height: 40px;
padding: 0 12px;
font-size: 16px;
font-weight: 400;
line-height: 24px;
color: #201f23; /* text-default */
transition: border 150ms ease;

/* Placeholder */
::placeholder {
  color: #6f6d78; /* text-nonessential */
}

/* Focus */
:focus {
  outline: none;
  border: 2px solid #5746b2; /* P100 */
  padding: 0 11px;
}

/* Error */
.error {
  border: 2px solid #eb2000; /* R120 */
  padding: 0 11px;
}

/* Disabled */
:disabled {
  background: #fafafa; /* N5 */
  color: #b0afb6; /* N40 */
  cursor: not-allowed;
}

/* Label */
.elv-input-label {
  font-size: 14px;
  font-weight: 600;
  color: #201f23;
  margin-bottom: 4px;
}

/* Helper Text */
.elv-input-helper {
  font-size: 12px;
  color: #6f6d78;
  margin-top: 4px;
}

/* Error Message */
.elv-input-error {
  font-size: 12px;
  font-weight: 600;
  color: #b21800; /* R140 */
  margin-top: 4px;
}
```

---

## Builder Notes

1. **Start with search-input.html as template** - copy structure
2. **Remove search-specific parts** (search icon, clear button)
3. **Add label and helper text patterns**
4. **Build all variants** (text, email, password, number, url, tel)
5. **Add password show/hide** for password variant
6. **Implement all states** (default, focus, error, disabled)
7. **Test accessibility** (ARIA labels, keyboard nav)
8. **Add code snippets** for each variant
9. **Include specs table** at bottom

**Estimated time**: 1.5 hours (text-input), 45 mins (textarea)

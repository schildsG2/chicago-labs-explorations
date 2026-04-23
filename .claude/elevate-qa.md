---
description: Quick Elevate design system compliance check for HTML files
---

You are performing a quality assurance check on HTML prototypes to ensure they comply with the Elevate design system specifications.

## Your Task

Run a comprehensive compliance check against the Elevate design system. The user will provide a file path to check.

## Compliance Checks

### 1. HTML Structure Integrity
- [ ] All opening tags have matching closing tags
- [ ] Proper nesting (no overlapping tags)
- [ ] Valid HTML5 structure
- [ ] No unclosed `<div>`, `<span>`, `<section>`, etc.

### 2. Elevate Attribute Requirement
- [ ] The root content wrapper has the `elv` attribute
  - **CRITICAL**: This attribute scopes all Elevate utilities
  - Typically on a `<div elv class="...">` wrapping main content
  - If missing, ALL Elevate utilities will fail silently

### 3. Color Compliance (check against DESIGN.md)
- [ ] NO pure black (`#000000`) — must use `text-default` (#201f23) or token
- [ ] Rorange (`#ff492c`) used ONLY for brand (not sentiment, data, eyebrows)
- [ ] Purple (`#5746b2`) for primary CTAs and brand identity
- [ ] All colors use semantic tokens from `elevate.css` (e.g., `text-default`, `bg-neutral-0`)
- [ ] No invented hex colors outside the defined palette

### 4. Typography Compliance
- [ ] ONLY Figtree font family (no secondary typefaces)
- [ ] Max 3 font sizes per page
- [ ] All text uses `text-default` (#201f23), never pure black
- [ ] Proper hierarchy: headings use `elv-text-{size}` utilities

### 5. Spacing Compliance
- [ ] All spacing is multiple of 4px base unit
- [ ] Uses defined Elevate spacing scale: `elv-p-{n}`, `elv-m-{n}`, `elv-gap-{n}`
- [ ] No custom margin/padding values outside the scale (e.g., no `style="padding: 13px"`)

### 6. Component Compliance
- [ ] Buttons use correct pattern: `btn btn--{variant} btn--{size}`
  - Variants: `primary`, `secondary`, `tertiary`, `ghost`, `danger`
  - Sizes: `sm`, `md`, `lg`
- [ ] No custom button styles where Elevate button classes should be used
- [ ] Components match DESIGN.md specifications

### 7. Shadow Compliance
- [ ] Static cards have NO shadow (use tonal contrast instead)
- [ ] Only floating/elevated elements have shadows
- [ ] Shadows are subtle, diffused, max 12% opacity

### 8. Prohibited Patterns
- [ ] NO emojis used as icons (use actual SVG icons from `/shared/icons/`)
- [ ] NO custom utilities where Elevate classes exist
- [ ] NO interactivity on non-interactive elements (e.g., hover states on `<div>`)
- [ ] NO invented design patterns not in DESIGN.md or Lookbook

### 9. Accessibility (if applicable)
- [ ] Buttons use `<button>` tags, not `<div>` or `<a>` styled as buttons
- [ ] Form inputs have labels
- [ ] ARIA attributes where needed
- [ ] Color contrast meets WCAG AA (use UX MCP tools if needed)

## Verification Process

1. **Read the file** specified by the user
2. **Check each category** above systematically
3. **Read DESIGN.md sections** for specific components used (if needed)
4. **Read elevate.css tokens** to verify color/spacing values (if needed)
5. **Report findings** in a structured format

## Output Format

```markdown
## Elevate QA Report: {filename}

### ✅ Passing Checks
- HTML structure: valid
- Elevate `elv` attribute: present
- Typography: Figtree only, correct hierarchy
- [... other passing checks]

### ⚠️ Issues Found

#### Critical
- [ ] Missing `elv` attribute on wrapper (line XX)
- [ ] Pure black #000000 used (line XX) — should be text-default

#### Warnings
- [ ] Custom padding value `style="padding: 13px"` (line XX) — use elv-p-{n}
- [ ] Emoji used as icon (line XX) — use SVG from /shared/icons/

#### Suggestions
- Consider using `btn btn--secondary btn--md` instead of custom button styling (line XX)
- Review shadow usage on static card (line XX) — DESIGN.md specifies no shadows on static cards

### 📊 Compliance Score: XX%

### 🎯 Next Steps
1. Fix critical issues first (elv attribute, pure black)
2. Address spacing/color warnings
3. Consider suggestions for better design system alignment
```

## Key Resources

- **DESIGN.md**: `/Users/schilds/projects/chicago-labs-explorations/shared/design-system/DESIGN.md`
- **Tokens**: `/Users/schilds/projects/chicago-labs-explorations/shared/tokens/elevate.css`
- **Lookbook**: `https://www.g2.test/elevate/lookbook` (visual reference)
- **Templates**: `/Users/schilds/projects/chicago-labs-explorations/shared/components/templates/`

## Example Usage

User: `/elevate-qa epics/search-results/explorations/02-null-state.html`

You:
1. Read the file
2. Run all 9 compliance checks
3. Cross-reference DESIGN.md for components used
4. Generate structured report with specific line numbers
5. Calculate compliance score
6. Provide actionable next steps

## Important Notes

- **Be specific**: Always include line numbers for issues
- **Be constructive**: Frame issues as "should be X" not "this is wrong"
- **Prioritize**: Critical issues (elv attribute, pure black) before warnings
- **Reference sources**: Link to DESIGN.md sections or Lookbook for context
- **Quick mode**: If user adds `--quick` flag, skip reading DESIGN.md and do basic checks only

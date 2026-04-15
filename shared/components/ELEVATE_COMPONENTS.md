# Elevate Component Library

Reference guide for using UE Elevate components in explorations. All components require the `elv` attribute on a parent container.

## Setup

Include the Elevate CSS in your HTML:

```html
<link rel="stylesheet" href="../../shared/tokens/elevate.css">
<link rel="stylesheet" href="../../shared/components/elevate.css">
```

Wrap your content in a container with the `elv` attribute:

```html
<div elv>
  <!-- All Elevate components go here -->
</div>
```

---

## Typography

Elevate uses Figtree font and follows a type scale. Use semantic HTML tags with utility classes.

### Headings

```html
<div elv>
  <h1 class="elv-text-4xl elv-font-bold elv-text-default">Display Heading</h1>
  <h2 class="elv-text-3xl elv-font-bold elv-text-default">Page Heading</h2>
  <h3 class="elv-text-2xl elv-font-semibold elv-text-default">Section Heading</h3>
  <h4 class="elv-text-xl elv-font-semibold elv-text-default">Subsection</h4>
</div>
```

### Body Text

```html
<div elv>
  <p class="elv-text-base elv-text-default">Regular body text</p>
  <p class="elv-text-sm elv-text-subtle">Smaller body text</p>
  <p class="elv-text-xs elv-text-nonessential">Supporting text</p>
</div>
```

### Text Colors

- `elv-text-default` — Primary text color (neutral-100)
- `elv-text-subtle` — Secondary text (neutral-80)
- `elv-text-nonessential` — Tertiary text (neutral-70)
- `elv-text-disabled` — Disabled state (neutral-20)
- `elv-text-inverted` — White text
- `elv-text-primary` — Purple brand color
- `elv-text-link` — Blue link color
- `elv-text-success` — Green
- `elv-text-critical` — Red/orange
- `elv-text-warning` — Yellow

---

## Buttons

### Variants

#### Primary Button (Default)

```html
<div elv>
  <button class="btn btn--primary btn--lg">Primary Large</button>
  <button class="btn btn--primary btn--md">Primary Medium</button>
  <button class="btn btn--primary btn--sm">Primary Small</button>
</div>
```

#### Secondary Button

```html
<div elv>
  <button class="btn btn--secondary btn--lg">Secondary</button>
  <button class="btn btn--secondary btn--md">Secondary</button>
  <button class="btn btn--secondary btn--sm">Secondary</button>
</div>
```

#### Tertiary Button

```html
<div elv>
  <button class="btn btn--tertiary btn--md">Tertiary</button>
</div>
```

#### Brand Button

```html
<div elv>
  <button class="btn btn--brand btn--md">Brand Button</button>
</div>
```

#### Inverted Button (For dark backgrounds)

```html
<div elv class="elv-bg-primary elv-p-4">
  <button class="btn btn--inverted btn--md">Inverted</button>
</div>
```

#### Text Buttons

```html
<div elv>
  <button class="btn btn--text btn--md">Text Button</button>
  <button class="btn btn--text-neutral btn--md">Text Neutral</button>
</div>
```

### Button States

```html
<div elv>
  <!-- Disabled -->
  <button class="btn btn--primary btn--md" disabled>Disabled</button>
  
  <!-- As Link -->
  <a href="#" class="btn btn--primary btn--md">Link Button</a>
</div>
```

---

## Layout Utilities

### Flexbox

```html
<div elv>
  <div class="elv-flex elv-items-center elv-gap-4">
    <button class="btn btn--primary btn--sm">Action</button>
    <button class="btn btn--secondary btn--sm">Cancel</button>
  </div>
</div>
```

Common flex utilities:
- `elv-flex` — Display flex
- `elv-flex-col` — Flex direction column
- `elv-items-center` — Align items center
- `elv-items-start` — Align items start
- `elv-items-end` — Align items end
- `elv-justify-center` — Justify content center
- `elv-justify-between` — Space between
- `elv-gap-{n}` — Gap (1, 2, 3, 4, 6, 8, 12, 16, etc.)

### Spacing

Spacing follows the `--space-{n}` token scale.

```html
<div elv>
  <div class="elv-p-4">Padding 1rem</div>
  <div class="elv-px-4 elv-py-2">Padding X and Y</div>
  <div class="elv-m-4">Margin 1rem</div>
  <div class="elv-mb-8">Margin bottom 2rem</div>
</div>
```

Scale: `0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 12, 14, 16, 18, 20, 24, 28, 32, 36, 40, 48, 56, 64, 80, 96, 100`

---

## Backgrounds

```html
<div elv>
  <div class="elv-bg-primary elv-text-inverted elv-p-4">Primary Background</div>
  <div class="elv-bg-neutral-5 elv-p-4">Neutral Light Background</div>
  <div class="elv-bg-success-20 elv-text-success elv-p-4">Success Background</div>
  <div class="elv-bg-critical-20 elv-text-critical elv-p-4">Critical Background</div>
  <div class="elv-bg-info-20 elv-text-info elv-p-4">Info Background</div>
</div>
```

Background colors:
- `elv-bg-primary` — Purple
- `elv-bg-neutral-{0,1,5,10,20}` — Neutral shades
- `elv-bg-success-{20,40}` — Green backgrounds
- `elv-bg-critical-{20,40}` — Red/orange backgrounds
- `elv-bg-info-20` — Blue background
- `elv-bg-warning-20` — Yellow background

---

## Borders

```html
<div elv>
  <div class="elv-border elv-border-light elv-rounded-md elv-p-4">
    Card with border
  </div>
</div>
```

Border utilities:
- `elv-border` — Add border (0.5px default)
- `elv-border-{0,1,2,4,8}` — Border width
- `elv-border-light` — Light border color
- `elv-border-medium` — Medium border color
- `elv-border-dark` — Dark border color
- `elv-border-primary` — Purple border

Border radius:
- `elv-rounded-xs` — 0.25rem
- `elv-rounded-sm` — 0.5rem
- `elv-rounded-md` — 0.75rem
- `elv-rounded-lg` — 1rem
- `elv-rounded-xl` — 1.25rem
- `elv-rounded-full` — 9999rem (circle/pill)

---

## Shadows

```html
<div elv>
  <div class="elv-shadow-1 elv-p-4 elv-rounded-md">Subtle shadow</div>
  <div class="elv-shadow-2 elv-p-4 elv-rounded-md">Medium shadow</div>
  <div class="elv-shadow-3 elv-p-4 elv-rounded-md">Large shadow</div>
</div>
```

---

## Common Patterns

### Card Pattern

```html
<div elv>
  <div class="elv-bg-neutral-0 elv-border elv-border-light elv-rounded-md elv-p-6 elv-shadow-1">
    <h3 class="elv-text-lg elv-font-semibold elv-text-default elv-mb-2">Card Title</h3>
    <p class="elv-text-sm elv-text-subtle">Card description goes here.</p>
    <div class="elv-flex elv-gap-3 elv-mt-4">
      <button class="btn btn--primary btn--sm">Primary</button>
      <button class="btn btn--secondary btn--sm">Secondary</button>
    </div>
  </div>
</div>
```

### Form Layout

```html
<div elv>
  <div class="elv-flex elv-flex-col elv-gap-4">
    <div>
      <label class="elv-block elv-text-sm elv-font-semibold elv-text-default elv-mb-1">
        Label
      </label>
      <input type="text" class="elv-w-full elv-px-3 elv-py-2 elv-border elv-border-medium elv-rounded-sm" />
    </div>
    <div class="elv-flex elv-gap-2">
      <button class="btn btn--primary btn--md">Submit</button>
      <button class="btn btn--secondary btn--md">Cancel</button>
    </div>
  </div>
</div>
```

### Alert Pattern

```html
<div elv>
  <!-- Success Alert -->
  <div class="elv-bg-success-20 elv-border elv-border-success elv-rounded-sm elv-p-4">
    <p class="elv-text-sm elv-text-success elv-font-medium">Success message</p>
  </div>
  
  <!-- Error Alert -->
  <div class="elv-bg-critical-20 elv-border elv-border-critical elv-rounded-sm elv-p-4">
    <p class="elv-text-sm elv-text-critical elv-font-medium">Error message</p>
  </div>
  
  <!-- Info Alert -->
  <div class="elv-bg-info-20 elv-border elv-border-info elv-rounded-sm elv-p-4">
    <p class="elv-text-sm elv-text-info elv-font-medium">Info message</p>
  </div>
</div>
```

---

## Available Components

The following ViewComponents are available in the UE Elevate library. For complex interactive components, refer to the [Elevate Lookbook](https://www.g2.test/elevate/lookbook).

- **accordion** — Collapsible content sections
- **avatar** — User/product avatars
- **breadcrumbs** — Navigation breadcrumbs
- **button** — Documented above
- **button_group** — Button groupings
- **chip** — Tags and badges
- **content_card** — Content card layouts
- **control_button** — Icon-based controls
- **dropdown_menu** — Dropdown menus
- **form** — Form components (inputs, textareas, selects, etc.)
- **icon** — Icon system
- **icon_button** — Icon-only buttons
- **index_nav** — Index/tab navigation
- **inset_card** — Inset card variants
- **link** — Styled links
- **media_carousel** — Media carousels
- **modal** — Modal dialogs
- **notification** — Toast notifications
- **notification_badge** — Notification badges
- **pagination** — Pagination controls
- **popover** — Popover overlays
- **product_avatar** — Product-specific avatars
- **product_chip** — Product tags
- **progress_bar** — Progress indicators
- **rating_distribution_bar** — Rating visualizations
- **slide_out_panel** — Side panels
- **spin_loader** — Loading spinners
- **star_rating** — Star ratings
- **status_badge** — Status indicators
- **tab** — Tab navigation
- **table** — Table components
- **toast** — Toast notifications
- **tooltip** — Tooltips

---

## Token Reference

All design tokens are available as CSS custom properties in `shared/tokens/elevate.css`. Use these for custom styling:

- Colors: `var(--palette-purple-100)`, `var(--bg-primary)`, `var(--text-default)`
- Spacing: `var(--space-4)`, `var(--space-8)`
- Typography: `var(--text-base)`, `var(--font-semibold)`, `var(--leading-base)`
- Borders: `var(--radius-md)`, `var(--border-width-1)`
- Shadows: `var(--shadow-1)`, `var(--shadow-2)`

---

## Tips

1. **Always wrap in `elv` attribute** — Elevate styles are scoped to `[elv]` containers
2. **Use tokens over hardcoded values** — Reference tokens from `elevate.css`
3. **Check the Lookbook** — For complex components, refer to https://www.g2.test/elevate/lookbook
4. **Prefix all utility classes with `elv-`** — This is the Tailwind prefix for Elevate
5. **Auto-updated** — The CSS is symlinked to UE production, so it stays in sync

---

## Questions?

Check the [Elevate README](../../../ue/engines/elevate/README.md) or browse components at https://www.g2.test/elevate/lookbook

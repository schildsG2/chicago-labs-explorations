# Elevate Icons

SVG icons copied from the UE Elevate design system for use in static HTML prototypes.

## Available Icons

- `ui-icon-analytics.svg` - Analytics/chart icon
- `ui-icon-arrow-right.svg` - Right arrow
- `ui-icon-bar-chart.svg` - Bar chart icon
- `ui-icon-credit-card.svg` - Credit card icon
- `ui-icon-search.svg` - Search/magnifying glass icon
- `ui-icon-shopping-cart.svg` - Shopping cart icon

## Usage

### 1. Include the icons.css stylesheet

```html
<link rel="stylesheet" href="./shared/icons/icons.css">
```

### 2. Inline the SVG with icon classes

```html
<svg class="elv-icon elv-icon-md elv-icon-fill-current" viewBox="0 0 20 20" fill="none">
  <path d="..."/>
</svg>
```

### Sizing Classes

- `elv-icon-xs` - 16px (1rem)
- `elv-icon-sm` - 20px (1.25rem)
- `elv-icon-md` - 24px (1.5rem) - **default**
- `elv-icon-lg` - 28px (1.75rem)
- `elv-icon-xl` - 32px (2rem)

### Color

Use `elv-icon-fill-current` to make the icon inherit the text color:

```html
<!-- Icon inherits purple color -->
<div style="color: #7C3AED;">
  <svg class="elv-icon elv-icon-lg elv-icon-fill-current" viewBox="0 0 20 20" fill="none">
    <path d="..."/>
  </svg>
</div>
```

## Example

```html
<div class="elv-w-9 elv-h-9 elv-rounded-md elv-flex elv-items-center elv-justify-center" 
     style="background: #EEF2FF; color: #4F46E5;">
  <svg class="elv-icon elv-icon-lg elv-icon-fill-current" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
    <path d="M3.5 16C3.09722 16 2.74653 15.8507 2.44792 15.5521C2.14931 15.2535 2 14.9028 2 14.5V5.5C2 5.09722 2.14931 4.74653 2.44792 4.44792C2.74653 4.14931 3.09722 4 3.5 4H16.5C16.9167 4 17.2708 4.14931 17.5625 4.44792C17.8542 4.74653 18 5.09722 18 5.5V14.5C18 14.9028 17.8542 15.2535 17.5625 15.5521C17.2708 15.8507 16.9167 16 16.5 16H3.5ZM3.5 10H16.5V7H3.5V10Z"/>
  </svg>
</div>
```

## Source

Icons are copied from `/Users/schilds/projects/ue/engines/elevate/app/assets/images/elevate/svg/UI-Icons/`

All icons are from the Elevate design system and follow the same patterns and sizing as the Elevate Icon component.

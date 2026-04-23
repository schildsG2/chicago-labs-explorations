#!/bin/bash
# Create Claude Design upload package
# Run this from the repository root

set -e

echo "Creating Claude Design assets package..."

# Create base directory
DEST="claude-design-assets"
rm -rf "$DEST"
mkdir -p "$DEST"

# 1. Design System Files
echo "→ Copying design system files..."
mkdir -p "$DEST/design-system"
cp shared/design-system/DESIGN.md "$DEST/design-system/"
cp shared/tokens/elevate.css "$DEST/design-system/"

# 2. Component Templates
echo "→ Copying component templates..."
mkdir -p "$DEST/components/forms"
mkdir -p "$DEST/components/simple"
mkdir -p "$DEST/components/moderate"

cp shared/components/templates/forms/*.html "$DEST/components/forms/"
cp shared/components/templates/simple/*.html "$DEST/components/simple/"
cp shared/components/templates/moderate/*.html "$DEST/components/moderate/"

# 3. Assets
echo "→ Copying assets..."
mkdir -p "$DEST/assets/icons"
mkdir -p "$DEST/assets/pictograms"
mkdir -p "$DEST/assets/logos"
mkdir -p "$DEST/assets/fonts"

# Copy all 130 icons
cp shared/icons/*.svg "$DEST/assets/icons/"

# Copy pictograms
cp shared/components/templates/simple/assets/pictogram-*.svg "$DEST/assets/pictograms/"

# Copy G2 logos (all variants)
LOGO_COUNT=0
for logo in shared/assets/logos/g2-*.svg; do
  if [ -f "$logo" ]; then
    cp "$logo" "$DEST/assets/logos/"
    LOGO_COUNT=$((LOGO_COUNT + 1))
  fi
done

if [ $LOGO_COUNT -gt 0 ]; then
  echo "  ✅ $LOGO_COUNT G2 logo variant(s) copied"
else
  echo "  ⚠️  No G2 logos found in shared/assets/logos/"
fi

# Create fonts README (Figtree is from Google Fonts)
cat > "$DEST/assets/fonts/README.md" << 'EOF'
# Figtree Font

Elevate uses **Figtree** exclusively for all typography.

## Source
Google Fonts: https://fonts.google.com/specimen/Figtree

## Usage in HTML
```html
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Figtree:wght@300;400;500;600;700&display=swap" rel="stylesheet">
```

## Weights Used
- 300 (Light) - Rare, large display text only
- 400 (Regular) - Body text, default
- 500 (Medium) - Subtle emphasis
- 600 (Semibold) - Labels, subheadings, buttons
- 700 (Bold) - Headlines, strong emphasis

## CSS Variable
```css
--font-sans: 'Figtree', -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
```
EOF

# Copy logo README
if [ -f "shared/assets/logos/README.md" ]; then
  cp shared/assets/logos/README.md "$DEST/assets/logos/"
fi

# 4. Create main README
cat > "$DEST/README.md" << 'EOF'
# Elevate Design System — Claude Design Package

Complete design system package for uploading to Claude Design (Anthropic).

## Contents

### Design System
- **DESIGN.md** - Complete Elevate design system specifications with agent prompt guide
- **elevate.css** - CSS custom properties (color tokens, spacing, typography)

### Components (28 total, 98% UE compliance)
- **forms/** (9) - text-input, textarea, search-input, select, checkbox, radio-button, toggle, icon-button, tooltip
- **simple/** (13) - avatar, chip, badges, progress bars, ratings, links, breadcrumbs, etc.
- **moderate/** (6) - button-group, cards, pagination, tabs, etc.

### Assets
- **icons/** (172) - Complete UI icon library (130 contextual + 42 functional)
- **pictograms/** (4) - Anonymous avatar pictograms
- **logos/** - G2 logos (4 variants: rorange, black, white, icon)
- **fonts/** - Figtree font reference (Google Fonts)

## How to Upload to Claude Design

### Option 1: Upload as Folder (Recommended)
1. Go to Claude Design → Create new design system
2. Drag this entire `claude-design-assets/` folder to "Link code from your computer"
3. Or compress to .zip and upload

### Option 2: Link GitHub
1. Push this folder to a GitHub repo
2. Provide repo URL: `https://github.com/[owner]/[repo]/tree/main/claude-design-assets`

### Option 3: Individual Files
Upload in this order:
1. **Design System**: `design-system/DESIGN.md` + `design-system/elevate.css`
2. **Components**: Drag `components/` folder
3. **Assets**: Drag `assets/` folder

## What Claude Design Will Learn

After processing this package, Claude Design will:
- ✅ Understand Elevate color palette (purple, rorange, neutrals)
- ✅ Apply Figtree typography automatically
- ✅ Know all 28 component patterns
- ✅ Reference 172 UI icons by name (contextual + functional)
- ✅ Follow spacing (4px grid), borders (0.5px), shadows, states
- ✅ Generate accessible UI (WCAG-compliant focus states, ARIA)

## Quick Start

After uploading, try prompts like:
- "Create a login page using Elevate design system"
- "Build a user profile page with avatar, text inputs, and primary button"
- "Design a product comparison table with star ratings and status badges"

Claude will automatically use your components, colors, typography, and icons.

## Notes

- **Logo**: Add G2 logo SVG to `assets/logos/` before uploading (see README there)
- **Fonts**: Figtree is loaded from Google Fonts (no local files needed)
- **Components**: All at 98% UE Elevate compliance (329 issues resolved April 2026)
- **Documentation**: Each component template has usage examples and specs

## Support

Questions about Elevate design system:
- DESIGN.md: `/design-system/DESIGN.md` (authoritative source)
- Component specs: See individual template files
- UE Elevate Lookbook: https://www.g2.test/elevate/lookbook

---

**Built with Elevate Lite** — Production-ready HTML templates from UE Elevate
**Last updated**: April 21, 2026
EOF

# 5. Create optional examples file
mkdir -p "$DEST/examples"
cat > "$DEST/examples/component-showcase.html" << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Elevate Component Showcase</title>
  <link rel="stylesheet" href="../design-system/elevate.css">
  <style>
    body {
      font-family: 'Figtree', -apple-system, sans-serif;
      padding: 2rem;
      background: #fafafa;
    }
    .showcase {
      max-width: 1200px;
      margin: 0 auto;
      background: white;
      padding: 2rem;
      border-radius: 8px;
    }
    h1 { color: #5746b2; }
    .component-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
      gap: 1rem;
      margin-top: 2rem;
    }
    .component-card {
      border: 1px solid #dfdfe2;
      padding: 1rem;
      border-radius: 8px;
    }
    .component-card h3 {
      margin: 0 0 0.5rem 0;
      font-size: 14px;
      color: #4c4b53;
    }
  </style>
</head>
<body>
  <div class="showcase">
    <h1>Elevate Design System — Component Showcase</h1>
    <p>28 production-ready components at 98% UE compliance</p>

    <div class="component-grid">
      <div class="component-card">
        <h3>Forms (9)</h3>
        <ul style="font-size: 13px; color: #6f6d78; margin: 0; padding-left: 1.5rem;">
          <li>Text Input</li>
          <li>Textarea</li>
          <li>Search Input</li>
          <li>Select</li>
          <li>Checkbox</li>
          <li>Radio Button</li>
          <li>Toggle</li>
          <li>Icon Button</li>
          <li>Tooltip</li>
        </ul>
      </div>

      <div class="component-card">
        <h3>Simple (13)</h3>
        <ul style="font-size: 13px; color: #6f6d78; margin: 0; padding-left: 1.5rem;">
          <li>Avatar</li>
          <li>Chip</li>
          <li>Status Badge</li>
          <li>Notification Badge</li>
          <li>Product Avatar</li>
          <li>Product Chip</li>
          <li>Product Details</li>
          <li>Progress Bar</li>
          <li>Rating Distribution Bar</li>
          <li>Spin Loader</li>
          <li>Star Rating</li>
          <li>Link</li>
          <li>Breadcrumbs</li>
        </ul>
      </div>

      <div class="component-card">
        <h3>Moderate (6)</h3>
        <ul style="font-size: 13px; color: #6f6d78; margin: 0; padding-left: 1.5rem;">
          <li>Button Group</li>
          <li>Content Card</li>
          <li>Control Button</li>
          <li>Inset Card</li>
          <li>Pagination</li>
          <li>Tab</li>
        </ul>
      </div>

      <div class="component-card">
        <h3>Assets</h3>
        <ul style="font-size: 13px; color: #6f6d78; margin: 0; padding-left: 1.5rem;">
          <li>130 UI Icons</li>
          <li>4 Pictograms</li>
          <li>G2 Logo (add)</li>
          <li>Figtree Font (Google)</li>
        </ul>
      </div>
    </div>

    <hr style="margin: 2rem 0; border: none; border-top: 1px solid #dfdfe2;">

    <p style="font-size: 14px; color: #6f6d78;">
      See individual component files in <code>/components/</code> for usage examples, code snippets, and specifications.
    </p>

    <p style="font-size: 14px; color: #6f6d78;">
      Design system specs: <code>/design-system/DESIGN.md</code>
    </p>
  </div>
</body>
</html>
EOF

# 6. Summary
ICON_COUNT=$(ls "$DEST/assets/icons/"*.svg 2>/dev/null | wc -l | tr -d ' ')

echo ""
echo "✅ Claude Design package created successfully!"
echo ""
echo "📦 Package location: $DEST/"
echo ""
echo "Contents:"
echo "  - Design system: DESIGN.md + elevate.css"
echo "  - Components: 28 templates (forms, simple, moderate)"
echo "  - Icons: $ICON_COUNT SVG icons"
echo "  - Pictograms: 4 avatar pictograms"
echo "  - Logos: $LOGO_COUNT G2 logo variant(s)"
echo ""
echo "📤 Ready to upload to Claude Design!"
echo "   Drag the entire '$DEST/' folder or compress to .zip"
echo ""

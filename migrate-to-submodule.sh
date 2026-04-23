#!/bin/bash
# Migrate path references from shared/* to shared/elevate-lite/*

echo "🔄 Updating paths to use elevate-lite submodule..."

# Find and replace in all HTML files
find . -name "*.html" -type f -not -path "*/shared/elevate-lite/*" -exec sed -i '' \
  -e 's|shared/tokens/|shared/elevate-lite/tokens/|g' \
  -e 's|shared/components/|shared/elevate-lite/components/|g' \
  -e 's|shared/icons/|shared/elevate-lite/icons/|g' \
  -e 's|shared/design-system/|shared/elevate-lite/design-system/|g' \
  -e 's|shared/assets/|shared/elevate-lite/assets/|g' \
  {} \;

# Find and replace in markdown files
find . -name "*.md" -type f -not -path "*/shared/elevate-lite/*" -exec sed -i '' \
  -e 's|shared/tokens/|shared/elevate-lite/tokens/|g' \
  -e 's|shared/components/|shared/elevate-lite/components/|g' \
  -e 's|shared/icons/|shared/elevate-lite/icons/|g' \
  -e 's|shared/design-system/|shared/elevate-lite/design-system/|g' \
  -e 's|shared/assets/|shared/elevate-lite/assets/|g' \
  {} \;

# Update CLAUDE.md references
sed -i '' \
  -e 's|`/shared/design-system/DESIGN.md`|`/shared/elevate-lite/design-system/DESIGN.md`|g' \
  -e 's|`/shared/components/templates/`|`/shared/elevate-lite/components/templates/`|g' \
  -e 's|`/shared/tokens/elevate.css`|`/shared/elevate-lite/tokens/elevate.css`|g' \
  -e 's|\[\`/shared/design-system/DESIGN.md\`\]|\[`/shared/elevate-lite/design-system/DESIGN.md`\]|g' \
  CLAUDE.md

echo "✅ Path migration complete"
echo ""
echo "⚠️  Manual review needed:"
echo "  - Check git diff to verify changes"
echo "  - Test a few HTML files to confirm paths work"
echo "  - Update any absolute paths not caught by script"

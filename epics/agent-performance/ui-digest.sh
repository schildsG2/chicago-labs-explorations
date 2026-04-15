#!/bin/bash

# Weekly UI Changes Digest - Local Script
# Run this weekly via cron or manually

REPO_PATH="/path/to/your/ue-repo"  # UPDATE THIS
OUTPUT_FILE="$HOME/ui-digest-$(date +%Y-%m-%d).md"

# Paths to monitor (customize!)
PATHS=(
  "src/components/"
  "src/views/"
  "src/pages/"
)

cd "$REPO_PATH" || exit 1

# Fetch latest changes
git fetch origin main

# Get commits from last 7 days
SINCE_DATE=$(date -v-7d +%Y-%m-%d)

echo "# UI Changes Digest - Week of $(date +%Y-%m-%d)" > "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

TOTAL_COMMITS=0
for path in "${PATHS[@]}"; do
  COUNT=$(git log --since="$SINCE_DATE" origin/main --oneline -- "$path" | wc -l | tr -d ' ')
  TOTAL_COMMITS=$((TOTAL_COMMITS + COUNT))
done

if [ "$TOTAL_COMMITS" -eq 0 ]; then
  echo "No UI changes detected." >> "$OUTPUT_FILE"
else
  echo "**Total commits affecting UI areas:** $TOTAL_COMMITS" >> "$OUTPUT_FILE"
  echo "" >> "$OUTPUT_FILE"

  for path in "${PATHS[@]}"; do
    echo "## Changes in \`$path\`" >> "$OUTPUT_FILE"
    echo "" >> "$OUTPUT_FILE"

    git log --since="$SINCE_DATE" origin/main \
      --pretty=format:"- %h %s - *%an* (%ar)" \
      -- "$path" >> "$OUTPUT_FILE"

    echo "" >> "$OUTPUT_FILE"
    echo "" >> "$OUTPUT_FILE"
  done
fi

# Open the digest (macOS)
open "$OUTPUT_FILE"

# Optional: Send yourself an email
# mail -s "UI Changes Digest" your.email@company.com < "$OUTPUT_FILE"

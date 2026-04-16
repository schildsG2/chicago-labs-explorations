# Automated UI Change Monitoring for Design Teams

## Problem Statement

As product designers working in large codebases, it's challenging to stay aware of UI changes happening in areas we own. Changes can happen through PRs we're not tagged on, commits we don't see, or implementations that deviate from designs without review.

**Goal:** Create an automated weekly digest that alerts designers when UI-related code changes in their areas of ownership.

---

## Overview of Approaches

There are three main approaches to automate UI change monitoring, each with different trade-offs around visibility, setup complexity, and organizational requirements.

| Approach | Visibility | Setup Complexity | Requires Repo Access | Automated |
|----------|------------|------------------|---------------------|-----------|
| Personal Fork | Private to you | Medium | Read-only | ✅ Yes |
| Local Script | Private to you | Low | Read-only | ⚠️ Semi (cron) |
| Main Repo Workflow | Visible to team | Medium | Write access | ✅ Yes |

---

## Approach 1: Personal Fork (Recommended for Individual Use)

### What It Is
Fork the main repository to your personal GitHub account and add a GitHub Actions workflow to your fork. The workflow runs on your fork's infrastructure, analyzes changes from the upstream repo, and notifies only you.

### Pros
- ✅ Completely private and independent
- ✅ No impact on main repo or team
- ✅ Fully automated via GitHub Actions
- ✅ Only requires read access to main repo
- ✅ No approval needed from org admins
- ✅ Can customize paths and frequency freely

### Cons
- ❌ Need to periodically sync your fork with upstream
- ❌ Requires maintaining a fork
- ❌ Uses your personal GitHub Actions quota (free tier is generous)

### Setup Steps

1. **Fork the repository** via GitHub UI
   - Navigate to the main repo
   - Click "Fork" in the top-right
   - Fork to your personal account

2. **Clone your fork locally**
   ```bash
   git clone https://github.com/YOUR-USERNAME/repo-name.git
   cd repo-name
   ```

3. **Add the workflow file**
   - Create `.github/workflows/ui-changes-digest.yml` (see [Workflow Template](#workflow-template))
   - Customize the monitored paths for your area

4. **Commit and push**
   ```bash
   git add .github/workflows/ui-changes-digest.yml
   git commit -m "Add personal UI digest workflow"
   git push
   ```

5. **Set up sync with upstream** (run weekly or as needed)
   ```bash
   git remote add upstream https://github.com/ORG-NAME/repo-name.git
   git fetch upstream
   git merge upstream/main
   git push
   ```

6. **Configure notifications**
   - GitHub Issue: Subscribe to the `ui-digest` label in your fork
   - Email: Add email secrets to your fork's settings
   - Slack: Add webhook URL to your fork's secrets

### Best For
- Individual designers who want private monitoring
- Testing the concept before proposing to the team
- Designers without write access to the main repo

---

## Approach 2: Local Script (Most Private)

### What It Is
A shell script that runs on your local machine, analyzes the repo's git history, and generates a digest. Can be run manually or scheduled via cron.

### Pros
- ✅ Completely private - no GitHub footprint
- ✅ No fork or workflow needed
- ✅ Works offline (after initial git fetch)
- ✅ Only requires read access to main repo
- ✅ Simple to understand and modify
- ✅ No GitHub Actions quota usage

### Cons
- ❌ Requires local setup and maintenance
- ❌ Only runs when your computer is on
- ❌ Need to remember to sync repo regularly
- ❌ Less automated than GitHub Actions

### Setup Steps

1. **Clone or sync the repo locally**
   ```bash
   git clone https://github.com/ORG-NAME/repo-name.git
   # or if already cloned:
   cd /path/to/repo
   git pull origin main
   ```

2. **Create the digest script** (see [Script Template](#script-template))
   - Save as `ui-digest.sh` anywhere on your machine
   - Update `REPO_PATH` to point to your local repo
   - Customize `PATHS` array for your areas

3. **Make it executable**
   ```bash
   chmod +x ui-digest.sh
   ```

4. **Test it**
   ```bash
   ./ui-digest.sh
   ```

5. **Schedule it (optional)**
   ```bash
   # Edit cron to run every Monday at 9 AM
   crontab -e
   
   # Add this line:
   0 9 * * 1 /path/to/ui-digest.sh
   ```

### Best For
- Designers who want zero external visibility
- Those who prefer simple, local tools
- Quick testing without any GitHub setup

---

## Approach 3: Team Workflow in Main Repo (Collaborative)

### What It Is
Add the GitHub Actions workflow directly to the main repository. It runs on the org's infrastructure and can notify multiple team members.

### Pros
- ✅ Official, visible to entire team
- ✅ Encourages design awareness across the org
- ✅ Single source of truth
- ✅ Can notify multiple designers
- ✅ No fork maintenance needed
- ✅ Uses org's GitHub Actions quota

### Cons
- ❌ Requires write access to main repo
- ❌ Needs PR approval to add workflow
- ❌ Visible to everyone (not private)
- ❌ May need org admin approval for new workflows
- ❌ Changes require PR process

### Setup Steps

1. **Check your access**
   - Do you have write access to the repo?
   - Does your org have policies about GitHub Actions workflows?

2. **Create a branch**
   ```bash
   git checkout -b add-ui-digest-workflow
   ```

3. **Add the workflow file**
   - Create `.github/workflows/ui-changes-digest.yml` (see [Workflow Template](#workflow-template))
   - Customize paths for team areas
   - Configure team notifications (Slack channel, email list)

4. **Create a PR**
   ```bash
   git add .github/workflows/ui-changes-digest.yml
   git commit -m "Add weekly UI changes digest for design team"
   git push origin add-ui-digest-workflow
   ```

5. **Get approval and merge**
   - Tag relevant stakeholders (engineering leads, design managers)
   - Explain the purpose and benefits
   - Merge once approved

6. **Subscribe to notifications**
   - Each designer subscribes to the digest via their preferred channel

### Best For
- Design teams with write access to the repo
- Organizations that value design transparency
- When multiple designers want to monitor different areas

---

## Comparison: Which Approach to Choose?

### Choose **Personal Fork** if:
- You want automated monitoring without team coordination
- You don't have write access to the main repo
- You want to test the concept privately first
- You're comfortable with basic git operations

### Choose **Local Script** if:
- You want maximum privacy
- You prefer simple tools you fully control
- You're okay with semi-automated (cron) or manual runs
- You don't want any GitHub Actions involvement

### Choose **Team Workflow** if:
- Your whole design team wants this
- You have write access and organizational buy-in
- You want one official digest for all designers
- You're comfortable with the workflow being visible

---

## Workflow Template

This is the GitHub Actions workflow used in Approaches 1 and 3.

<details>
<summary>Click to expand full workflow YAML</summary>

```yaml
name: Weekly UI Changes Digest

on:
  # Run every Monday at 9 AM UTC
  schedule:
    - cron: '0 9 * * 1'

  # Allow manual trigger for testing
  workflow_dispatch:

jobs:
  generate-digest:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout repository
        uses: actions/checkout@v4
        with:
          fetch-depth: 100

      - name: Generate UI changes report
        id: generate
        run: |
          echo "# UI Changes Digest - Week of $(date +%Y-%m-%d)" > digest.md
          echo "" >> digest.md

          # CUSTOMIZE THESE PATHS for your area
          PATHS=(
            "src/components/"
            "src/views/"
            "src/pages/"
            "styles/"
          )

          SINCE_DATE=$(date -d '7 days ago' +%Y-%m-%d 2>/dev/null || date -v-7d +%Y-%m-%d)

          echo "## Summary" >> digest.md
          echo "" >> digest.md

          TOTAL_COMMITS=0
          for path in "${PATHS[@]}"; do
            COUNT=$(git log --since="$SINCE_DATE" --oneline -- "$path" | wc -l)
            TOTAL_COMMITS=$((TOTAL_COMMITS + COUNT))
          done

          if [ $TOTAL_COMMITS -eq 0 ]; then
            echo "No UI changes detected in the monitored paths." >> digest.md
            echo "has_changes=false" >> $GITHUB_OUTPUT
          else
            echo "**Total commits affecting UI areas:** $TOTAL_COMMITS" >> digest.md
            echo "" >> digest.md

            for path in "${PATHS[@]}"; do
              echo "## Changes in \`$path\`" >> digest.md
              echo "" >> digest.md

              git log --since="$SINCE_DATE" \
                --pretty=format:"- [\`%h\`](https://github.com/${{ github.repository }}/commit/%H) %s - *%an* (%ar)" \
                -- "$path" >> digest.md

              echo "" >> digest.md
              echo "" >> digest.md

              echo "<details><summary>Files changed in $path</summary>" >> digest.md
              echo "" >> digest.md
              echo '```' >> digest.md
              git diff --name-only $SINCE_DATE..HEAD -- "$path" >> digest.md
              echo '```' >> digest.md
              echo "</details>" >> digest.md
              echo "" >> digest.md
            done

            echo "has_changes=true" >> $GITHUB_OUTPUT
          fi

      - name: Create GitHub Issue with digest
        if: steps.generate.outputs.has_changes == 'true'
        uses: actions/github-script@v7
        with:
          script: |
            const fs = require('fs');
            const digest = fs.readFileSync('digest.md', 'utf8');

            await github.rest.issues.create({
              owner: context.repo.owner,
              repo: context.repo.repo,
              title: `UI Changes Digest - Week of ${new Date().toISOString().split('T')[0]}`,
              body: digest,
              labels: ['ui-digest', 'design']
            });

      - name: Upload digest as artifact
        if: always()
        uses: actions/upload-artifact@v4
        with:
          name: ui-changes-digest
          path: digest.md
```

</details>

### Customization Options

**Change the schedule:**
```yaml
schedule:
  - cron: '0 9 * * 1'  # Monday 9am
  - cron: '0 17 * * 5' # Friday 5pm
  - cron: '0 9 * * *'  # Every day at 9am
```

**Monitor specific paths:**
```yaml
PATHS=(
  "src/components/checkout/"
  "src/views/product-detail/"
  "app/frontend/shopping-cart/"
)
```

**Alternative notification: Email**
Replace the "Create GitHub Issue" step:
```yaml
- name: Send Email
  uses: dawidd6/action-send-mail@v3
  with:
    server_address: smtp.gmail.com
    server_port: 465
    username: ${{ secrets.EMAIL_USERNAME }}
    password: ${{ secrets.EMAIL_PASSWORD }}
    subject: UI Changes Digest - Week of $(date +%Y-%m-%d)
    to: design-team@company.com
    from: GitHub Actions
    body: file://digest.md
```

**Alternative notification: Slack**
Replace the "Create GitHub Issue" step:
```yaml
- name: Send to Slack
  uses: slackapi/slack-github-action@v1
  with:
    webhook-url: ${{ secrets.SLACK_WEBHOOK }}
    payload: |
      {
        "text": "*UI Changes Digest - Week of $(date +%Y-%m-%d)*\n\n$(cat digest.md)"
      }
```

---

## Script Template

This is the local bash script used in Approach 2.

<details>
<summary>Click to expand full script</summary>

```bash
#!/bin/bash

# Weekly UI Changes Digest - Local Script
# Run this weekly via cron or manually

REPO_PATH="/path/to/your/repo"  # UPDATE THIS PATH
OUTPUT_FILE="$HOME/ui-digest-$(date +%Y-%m-%d).md"

# CUSTOMIZE THESE PATHS for your area
PATHS=(
  "src/components/"
  "src/views/"
  "src/pages/"
  "styles/"
)

cd "$REPO_PATH" || exit 1

# Fetch latest changes
echo "Fetching latest changes from origin..."
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
  echo "No UI changes detected in the monitored paths." >> "$OUTPUT_FILE"
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

    echo "### Files changed" >> "$OUTPUT_FILE"
    echo '```' >> "$OUTPUT_FILE"
    git diff --name-only $(git log --since="$SINCE_DATE" --format=%H origin/main -- "$path" | tail -1)..origin/main -- "$path" >> "$OUTPUT_FILE"
    echo '```' >> "$OUTPUT_FILE"
    echo "" >> "$OUTPUT_FILE"
  done
fi

echo "Digest generated: $OUTPUT_FILE"

# Open the digest (macOS)
open "$OUTPUT_FILE"

# Optional: Send yourself an email
# Uncomment and configure if desired:
# mail -s "UI Changes Digest" your.email@company.com < "$OUTPUT_FILE"
```

</details>

**Make it executable:**
```bash
chmod +x ui-digest.sh
```

**Schedule with cron:**
```bash
crontab -e

# Add this line to run every Monday at 9 AM:
0 9 * * 1 /path/to/ui-digest.sh
```

---

## Sample Digest Output

Here's what the generated digest looks like:

```markdown
# UI Changes Digest - Week of 2026-04-14

## Summary

**Total commits affecting UI areas:** 8

## Changes in `src/components/checkout/`

- [`a1b2c3d`](https://github.com/org/repo/commit/a1b2c3d) Update checkout button styles - *Jane Doe* (2 days ago)
- [`e4f5g6h`](https://github.com/org/repo/commit/e4f5g6h) Fix payment form validation - *John Smith* (4 days ago)

<details><summary>Files changed in src/components/checkout/</summary>

```
src/components/checkout/CheckoutButton.tsx
src/components/checkout/PaymentForm.tsx
src/components/checkout/styles.css
```
</details>

## Changes in `src/views/product-detail/`

- [`i7j8k9l`](https://github.com/org/repo/commit/i7j8k9l) Add product image carousel - *Alice Chen* (1 day ago)
- [`m0n1o2p`](https://github.com/org/repo/commit/m0n1o2p) Update pricing display logic - *Bob Lee* (3 days ago)

<details><summary>Files changed in src/views/product-detail/</summary>

```
src/views/product-detail/ProductPage.tsx
src/views/product-detail/ImageCarousel.tsx
src/views/product-detail/PriceDisplay.tsx
```
</details>
```

---

## Getting Started

### Recommended Path

1. **Start with Personal Fork** or **Local Script** to test the concept
2. Refine the paths and frequency based on what's useful
3. Share results with your design team
4. If valuable, propose adding to main repo as a team workflow

### Next Steps

1. Choose your approach based on the comparison above
2. Follow the setup steps for your chosen approach
3. Customize the paths to match your areas of ownership
4. Test it manually before scheduling
5. Iterate on what information is most valuable

---

## FAQ

**Q: Will this catch all UI changes?**
A: It catches git commits to the paths you specify. It won't catch:
- Changes merged before you started monitoring
- Changes in paths you're not monitoring
- Visual changes from CSS-in-JS or dynamic styles (unless the code changes)

**Q: How much does this cost?**
A: GitHub Actions is free for public repos and has a generous free tier for private repos (2,000 minutes/month). This workflow uses ~1 minute per week. Local scripts are completely free.

**Q: Can I monitor multiple repos?**
A: Yes! Set up a workflow/fork for each repo, or modify the script to loop through multiple repos.

**Q: What if I want to see visual diffs, not just code changes?**
A: This approach tracks code changes. For visual regression testing, consider tools like Chromatic, Percy, or Applitools.

**Q: Can I filter by file type?**
A: Yes! Modify the git log command to include file filters:
```bash
git log --since="$SINCE_DATE" -- "$path/**/*.tsx" "$path/**/*.css"
```

**Q: Can I get real-time notifications instead of weekly?**
A: Yes! Change the cron schedule to run daily, or set up a webhook-based approach that triggers on every push.

---

## Contributing

Have ideas to improve this? Questions about setup? Share feedback with [your team channel/contact].

---

## Resources

- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [Cron Expression Generator](https://crontab.guru/)
- [Git Log Documentation](https://git-scm.com/docs/git-log)
- [GitHub Notifications Guide](https://docs.github.com/en/account-and-profile/managing-subscriptions-and-notifications-on-github)

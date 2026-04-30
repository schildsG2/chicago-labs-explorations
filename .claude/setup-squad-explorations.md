---
description: Set up a new squad exploration workspace with Elevate Lite design system
---

You are helping a designer set up a personalized exploration workspace for their squad, based on the Chicago Labs template.

## Your Task

Guide the user through an interactive setup wizard that creates a complete, personalized exploration space with the Elevate Lite design system.

---

## Step 0: Verify Prerequisites

Before starting setup, check that git is installed:

```bash
git --version
```

If git is not found:
- **Mac:** Suggest `brew install git` or download from git-scm.com
- **Windows:** Suggest downloading from git-scm.com
- **Linux:** Suggest `sudo apt install git` or equivalent

If git is missing, stop and inform the user they need to install it first.

---

## Step 1: Welcome & Context

Greet the user warmly and explain what this setup will create:

```markdown
# 🚀 Squad Explorations Setup Wizard

This will set up a personalized HTML prototyping workspace for your squad, including:

✓ Gestural HTML exploration space
✓ Elevate Lite design system (as a git submodule)
✓ Epic and exploration scaffolding tools
✓ Placeholder epic cards for your squad's themes
✓ Research folder for competitive analysis

This workspace will be similar to Chicago Labs but tailored to your squad's needs.

Let's get started!
```

---

## Step 2: Gather Squad Information

Ask the user for the following information **one question at a time** (don't overwhelm):

### 2.1 Squad Name
**Ask:** "What is your squad name? (e.g., 'Buyer Intent', 'Agent Marketplace', 'Search & Discovery')"

**Validation:** Accept any reasonable squad name.

**Store as:**
- `SQUAD_NAME` (display name, e.g., "Buyer Intent")
- `SQUAD_KEBAB` (kebab-case, e.g., "buyer-intent")

### 2.2 Directory Name
**Ask:** "Directory name? (I suggest: `{SQUAD_KEBAB}-explorations` — type 'yes' to use this, or type your own)"

**If user responds 'yes':** Use `{SQUAD_KEBAB}-explorations`
**If user responds with anything else:** Use their response as `DIR_NAME`

**Store as:** `DIR_NAME`

### 2.3 Installation Location
**Ask:** "Installation location? (I suggest: `~/projects/{DIR_NAME}` — type 'yes' to use this, or type your own path)"

**If user responds 'yes':** Use `~/projects/{DIR_NAME}`
**If user responds with anything else:** Use their response as the path

**Validation:** Check if path exists. If yes, confirm overwrite.

**Store as:** `INSTALL_PATH`

### 2.4 Squad Tag
**Explanation (before asking):** "This tag will be used to categorize and filter epic cards on your homepage."

**Ask:** "Squad tag? (I suggest: `{SQUAD_KEBAB}` — type 'yes' to use this, or type your own in kebab-case)"

**If user responds 'yes':** Use `{SQUAD_KEBAB}`
**If user responds with anything else:** Use their response as the tag

**Store as:** `SQUAD_TAG`

### 2.5 Initial Epic Themes
**Ask:** "What are 2-3 main themes or product areas your squad will be exploring? (e.g., 'Pricing Optimization', 'Search Results', 'Bulk Purchase')"

**Format:** Comma-separated list

**Example:** "Pricing Optimization, Purchase Flow, Company Insights"

**Store as:** `EPIC_THEMES` (array of 2-3 strings)

### 2.6 Repository Type
**Ask:** "Initialize this as a git repository? (yes/no)"

**Explanation (if unclear):** "Git will let you track changes and add Elevate Lite as a submodule. Recommended: yes"

**If yes:** Set `INIT_GIT = true`
**If no:** Set `INIT_GIT = false` (will clone Elevate Lite directly instead of submodule)

**Store as:** `INIT_GIT` (boolean)

---

## Step 3: Confirm Setup Plan

Before proceeding, show a summary and ask for confirmation:

```markdown
## Setup Summary

**Squad:** {SQUAD_NAME}
**Directory:** {INSTALL_PATH}
**Squad Tag:** {SQUAD_TAG}
**Git repository:** {Yes/No}

**Initial epics to create:**
1. {EPIC_THEMES[0]}
2. {EPIC_THEMES[1]}
3. {EPIC_THEMES[2]} (if provided)

**What will be created:**
- Main index.html portal page (personalized to {SQUAD_NAME})
- epics/ directory with {N} placeholder epic cards
- research/spikes/ directory
- shared/ directory structure
- Elevate Lite design system (as git submodule)
- Skills: /new-epic and /new-exploration

Proceed with setup? (yes/no)
```

If user says no, ask what they'd like to change.

---

## Step 4: Clone Template Repository

### 4.1 Create Parent Directory (if needed)

Check if the parent directory exists:
```bash
# If INSTALL_PATH is ~/projects/buyer-intent-explorations
# Extract parent: ~/projects/
mkdir -p {PARENT_DIR}
```

### 4.2 Clone Template
```bash
git clone https://github.com/schildsG2/squad-explorations-template.git {INSTALL_PATH}
cd {INSTALL_PATH}
rm -rf .git
```

### 4.3 Initialize Git (if requested)

If user chose `INIT_GIT = true`:
```bash
git init
```

If user chose `INIT_GIT = false`:
- Skip git init
- Will clone elevate-lite directly instead of as submodule

---

## Step 5: Personalize Template Files

Use find/replace across all files in `{INSTALL_PATH}`:

**Replace these placeholders:**
- `{{SQUAD_NAME}}` → e.g., "Buyer Intent"
- `{{SQUAD_KEBAB}}` → e.g., "buyer-intent"
- `{{DIR_NAME}}` → e.g., "buyer-intent-explorations"
- `{{DATE}}` → Today in ISO (e.g., "2026-04-29")
- `{{DATE_FORMATTED}}` → Human-readable (e.g., "Apr 29, 2026")

**Files that contain placeholders:**
- `index.html`
- `CLAUDE.md`
- `research/spikes/README.md`
- `epics/example-epic/index.html`

---

## Step 6: Create Epics from Themes

The template has `epics/example-epic/`. Transform it for each user theme:

### 6.1 First Theme (Rename Example)

```bash
mv epics/example-epic epics/{theme-1-kebab}
```

Replace in `epics/{theme-1-kebab}/index.html`:
- `{{EPIC_TITLE}}` → "Pricing Optimization"
- `{{EPIC_KEBAB}}` → "pricing-optimization"
- `{{EPIC_DESCRIPTION}}` → "Exploring pricing models and optimization strategies"

### 6.2 Additional Themes (Copy + Personalize)

For theme 2:
```bash
cp -r epics/{theme-1-kebab} epics/{theme-2-kebab}
```

Replace in `epics/{theme-2-kebab}/index.html`:
- Update title, kebab, description for theme 2

Repeat for theme 3 if provided.

---

## Step 7: Update Main index.html

### 7.1 Add Filter Chips

Find the filter chips section and add one chip per theme (after "All"):

```html
<!-- After the "All" chip, add: -->
<div class="filter-chip ..." data-tag="pricing-optimization">Pricing Optimization</div>
<div class="filter-chip ..." data-tag="purchase-flow">Purchase Flow</div>
```

### 7.2 Replace Example Epic Card

The template has ONE example epic card. Duplicate it for each theme:

**For each theme:**
1. Copy the epic card HTML block
2. Update:
   - `href` → `./epics/{theme-kebab}/index.html`
   - `data-tags` → `{theme-kebab}`
   - `data-name` → `{Theme Title}`
   - Card title → `{Theme Title}`
   - Card description → Theme description
   - Icon background color (cycle through defaults or let user choose)

**Icon color defaults:**
- Theme 1: Purple (#f2f0f9 bg, #5746b2 icon)
- Theme 2: Orange (#fff5f2 bg, #ff492c icon)
- Theme 3: Neutral (#f5f5f6 bg, #201f23 icon)

### 7.3 Update Epic Count

Change `<span id="epicCount">(1)</span>` to `({N})` where N = number of themes.

---

## Step 8: Add Elevate Lite

Remove the placeholder file:
```bash
rm shared/elevate-lite-PLACEHOLDER.md
```

If `INIT_GIT = true`:
```bash
git submodule add https://github.com/schildsG2/elevate-lite.git shared/elevate-lite
```

If `INIT_GIT = false`:
```bash
git clone https://github.com/schildsG2/elevate-lite.git shared/elevate-lite
```

---

## Step 9: Initial Git Commit (if git enabled)

If `INIT_GIT = true`:
```bash
git add .
git commit -m "Initial setup: {SQUAD_NAME} explorations workspace

- Created {N} epics: {list themes}
- Added Elevate Lite design system
- Personalized for {SQUAD_NAME} squad

Generated with /setup-squad-explorations"
```

---

## Step 10: Final Report & Next Steps

Show completion summary:

```markdown
## ✅ Setup Complete!

**Location:** `{INSTALL_PATH}`

**Created:**
- ✓ Main portal (`index.html`) with {N} epics
- ✓ Filter chips: All, {theme-1}, {theme-2}, {theme-3}
- ✓ Epic directories with placeholder explorations
- ✓ Elevate Lite design system
- ✓ Research directory
- ✓ Skills: /new-epic, /new-exploration
- ✓ {SQUAD_NAME}-specific CLAUDE.md
{✓ Git repository initialized (if applicable)}

**Next steps:**

1. Open your workspace:
   cd {INSTALL_PATH}
   open index.html

2. Create your first exploration:
   /new-exploration {first-theme-kebab}

3. View Elevate specs:
   open shared/elevate-lite/design-system/DESIGN.md

4. Browse Lookbook:
   https://www.g2.test/elevate/lookbook

{If git: Push to GitHub when ready:
   git remote add origin <your-repo-url>
   git push -u origin main}

**Happy exploring! 🚀**
```

---

## Step 11: Offer to Open

Ask: "Would you like to open the workspace now?"
1. Open index.html in browser
2. Open in editor (e.g., `code {INSTALL_PATH}`)
3. Continue

---

## Key Differences from Old Approach

**Old (Generate):**
- ❌ 400+ lines of HTML generation
- ❌ Error-prone template building
- ❌ Inconsistent with actual chicago-labs structure

**New (Clone):**
- ✅ Clone tested template
- ✅ Simple find/replace
- ✅ Guaranteed consistency
- ✅ Faster (~30 seconds vs 5 minutes)
- ✅ Easier to maintain (update template, not skill)

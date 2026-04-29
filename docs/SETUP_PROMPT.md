# Squad Explorations Setup Prompt

> Copy-paste this entire prompt into Claude Code to set up your own exploration workspace

---

## The Prompt

```markdown
Set up a new squad exploration workspace for me, similar to Chicago Labs but personalized to my squad.

This should create a complete HTML prototyping workspace with:
- Personalized portal page (index.html) with my squad name
- Elevate Lite design system (as git submodule from https://github.com/g2/elevate-lite)
- Placeholder epic structures for my squad's themes
- Research directory for competitive analysis
- /new-epic and /new-exploration skills installed locally
- Squad-specific CLAUDE.md documentation

**Please follow this process:**

### Step 1: Ask me for information one question at a time

1. **Squad name** (e.g., "Buyer Intent", "Agent Marketplace")
2. **Directory name** (suggest: {squad-kebab}-explorations)
3. **Installation location** (default: ~/projects/)
4. **Squad tag** for filtering epics (default: {squad-kebab})
5. **2-3 main themes/epics** I'll be exploring (e.g., "Pricing Optimization, Purchase Flow, Insights")
6. **Initialize as git repository?** (yes/no)

### Step 2: Show me a summary and confirm

Before creating anything, show me:
- What will be created
- Where it will be located
- The epic placeholders
- Whether git will be initialized

Ask for confirmation to proceed.

### Step 3: Create the workspace structure

```
{dir-name}/
├── index.html                    # Portal page (personalized to my squad)
├── epics/                        # Epic directories
│   ├── {theme-1}/
│   │   ├── index.html            # Epic gallery page
│   │   └── explorations/         # Empty, ready for explorations
│   ├── {theme-2}/
│   └── {theme-3}/
├── shared/
│   ├── elevate-lite/             # Git submodule
│   └── exploration-starter.html  # Template for new explorations
├── research/
│   └── spikes/                   # For competitive research
├── .claude/
│   ├── new-epic.md               # Skill for creating epics
│   ├── new-exploration.md        # Skill for creating explorations
│   └── setup-squad-explorations.md  # This setup wizard
└── CLAUDE.md                     # Squad-specific agent context
```

### Step 4: Personalize the content

**index.html:**
- Title: "{Squad Name} Explorations"
- Header: "{Squad Name} Explorations"
- Description: "Rapid HTML prototypes and design explorations for the {Squad Name} squad at G2..."
- Epic cards for each theme (with appropriate icons and colors)
- Epic count badge showing total number of epics

**For each epic theme:**
- Create epic directory: `epics/{theme-kebab}/`
- Create epic index.html with:
  - Title matching the theme
  - Empty explorations section
  - Breadcrumb navigation back to main index
  - Empty state message explaining how to use /new-exploration

**CLAUDE.md:**
- Personalized to my squad name
- List of epic directories
- Squad-specific context in overview
- Keep all Elevate design system references

**exploration-starter.html:**
- Generic starter template
- References to Elevate Lite resources
- Proper relative paths (../../shared/elevate-lite/...)

### Step 5: Initialize git and add Elevate Lite submodule

If I chose to initialize git:
```bash
cd {installation-path}
git init
git submodule add https://github.com/g2/elevate-lite.git shared/elevate-lite
git add .
git commit -m "Initial setup: {Squad Name} explorations workspace"
```

If I chose NOT to initialize git:
- Skip submodule (clone elevate-lite directly instead)
- Warn me that submodule workflow won't be available

### Step 6: Install skills

Copy the path-agnostic versions of these skills from the Chicago Labs template:
- /new-epic (creates new epic structures)
- /new-exploration (creates numbered explorations)
- /setup-squad-explorations (this setup wizard)

These should work from any location in my new workspace.

### Step 7: Final report

Show me:
- ✅ What was created (with file counts)
- 📍 Installation path
- 📝 Next steps:
  1. How to open the workspace
  2. How to create my first exploration
  3. Where to find Elevate design resources
- 🚀 Offer to open index.html in my browser

### Important guidelines:

**For epic icons and colors**, use these defaults unless I specify otherwise:
- First epic: Purple theme (#f2f0f9 background, #5746b2 icon)
- Second epic: Orange theme (#fff5f2 background, #ff492c icon)
- Third epic: Neutral theme (#f5f5f6 background, #201f23 icon)

**For epic icons**, choose from:
- Bar chart (analytics/performance themes)
- Shopping cart (purchase/buyer themes)
- Search icon (discovery/search themes)
- Building (dashboard/company themes)
- Document (content/reporting themes)

**Follow Elevate design system conventions:**
- Use Figtree font only
- 4px spacing units
- Semantic color tokens (text-default, bg-neutral-0, etc.)
- No pure black (#000000), use text-default (#201f23)

**All file paths must be correct:**
- Explorations reference: `../../shared/elevate-lite/...`
- Epic index references: `../../shared/elevate-lite/...`
- Main index references: `./shared/elevate-lite/...`

**Error handling:**
- If path already exists, ask before overwriting
- If git is not available, warn and skip git steps
- If submodule fails, offer to clone elevate-lite directly

### Verification checklist (before final report):

- ✅ All directories created
- ✅ index.html has correct number of epic cards
- ✅ Each epic has index.html and explorations/ directory
- ✅ exploration-starter.html exists with correct paths
- ✅ Skills copied to .claude/
- ✅ CLAUDE.md personalized to squad
- ✅ research/spikes/ structure created
- ✅ Git initialized (if requested)
- ✅ Elevate Lite added as submodule or cloned
- ✅ Epic count badge matches actual epic count

---

After setup is complete, I should be able to:
1. Open index.html and see my personalized portal
2. Run `/new-epic` to create new epics
3. Run `/new-exploration {epic-name}` to start prototyping
4. Reference Elevate design specs at `shared/elevate-lite/design-system/DESIGN.md`

Let's get started! 🚀
```

---

## How to Use This Prompt

1. **Copy the entire markdown block above** (everything between the triple backticks)
2. **Open Claude Code** in your terminal or desktop app
3. **Paste the prompt** and hit enter
4. **Answer the questions** as Claude walks you through setup
5. **Confirm the summary** when Claude shows you what will be created
6. **Done!** Your workspace is ready

---

## What Happens Next

Claude will:
- Ask you questions about your squad
- Show you a summary for confirmation
- Create the entire workspace structure
- Personalize everything to your squad
- Install the skills so you can start creating epics
- Offer to open your new workspace

Total time: ~5 minutes

---

## Example Interaction

```
You: [paste the prompt above]

Claude: Great! Let's set up your squad exploration workspace.

What is your squad name? (e.g., "Buyer Intent", "Agent Marketplace")

You: Buyer Intent

Claude: Perfect! What should the directory be called? 
I suggest: buyer-intent-explorations

You: [press enter to accept]

Claude: Where should this be created? (default: ~/projects/)

You: [press enter for default]

... [continues with remaining questions] ...

Claude: Here's what I'll create:
- Squad: Buyer Intent
- Location: ~/projects/buyer-intent-explorations
- Epics: Pricing Optimization, Purchase Flow, Company Insights
- Git: Yes

Proceed? (yes/no)

You: yes

Claude: [creates everything]

✅ Setup complete! Your workspace is ready at ~/projects/buyer-intent-explorations
```

---

## Troubleshooting

**If git submodule fails:**
Claude will offer to clone Elevate Lite directly instead.

**If the path already exists:**
Claude will ask if you want to choose a different location or overwrite.

**If you want to customize icons/colors:**
Just mention it when Claude asks for your epic themes, or customize later by editing the epic cards in index.html.

---

## After Setup

Once your workspace is created, see `SETUP_GUIDE.md` in your new workspace for daily workflow instructions.

**Quick reference:**
- Create epic: `/new-epic`
- Create exploration: `/new-exploration {epic-name}`
- View design specs: `shared/elevate-lite/design-system/DESIGN.md`
- Browse components: https://www.g2.test/elevate/lookbook

---

**Questions?** Reach out to Sam.

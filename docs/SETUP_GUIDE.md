# Squad Explorations Setup Guide

> Quick start guide for designers setting up their own exploration workspace

---

## For New Users (Setting up a workspace)

### Option 1: Use the Setup Skill (Recommended)

If you have Claude Code installed:

```bash
cd ~/projects/
# Then in Claude Code:
/setup-squad-explorations
```

This will walk you through an interactive setup wizard that creates a complete workspace customized to your squad.

### Option 2: Copy-Paste Setup Prompt

If you don't have the skill installed, copy this prompt into Claude Code:

```markdown
Set up a new squad exploration workspace for me using the /setup-squad-explorations pattern.

Ask me for:
- My squad name
- 2-3 main themes/epics I'll be exploring
- Where to create the workspace (default: ~/projects/)

Then create:
- Personalized index.html portal page
- Placeholder epic structures for my themes
- Elevate Lite design system (as git submodule)
- Research directory
- /new-epic and /new-exploration skills
- CLAUDE.md with squad-specific context

Follow the setup-squad-explorations skill specifications.
```

---

## For Existing Users (Using the workspace)

### Creating a New Epic

```bash
/new-epic
```

This will ask you for:
- Epic name (kebab-case)
- Display title
- Description
- Tag for filtering
- Icon + color scheme
- Optional CLAUDE.md content

Then it creates the full epic structure and updates your homepage.

### Creating a New Exploration

```bash
/new-exploration {epic-name}
```

Example:
```bash
/new-exploration pricing-optimization
```

This will:
- Auto-number your exploration (01, 02, 03...)
- Ask for an exploration name
- Copy the starter template
- Update the epic's index.html
- Offer to open the file for you

---

## What You Get

### Workspace Structure

```
your-squad-explorations/
├── index.html                 # Your portal page
├── epics/                     # Your explorations
│   ├── epic-one/
│   │   ├── index.html         # Epic gallery
│   │   └── explorations/      # Numbered explorations
│   └── epic-two/
├── shared/
│   ├── elevate-lite/          # Design system (submodule)
│   └── exploration-starter.html
├── research/spikes/           # Research & references
├── .claude/                   # Skills
│   ├── new-epic.md
│   └── new-exploration.md
└── CLAUDE.md                  # Agent context
```

### Skills Available

- `/new-epic` — Create a new epic
- `/new-exploration {epic-name}` — Start a new exploration
- `/setup-squad-explorations` — Set up a workspace (for helping others)

---

## Key Features

### Path-Agnostic
All skills work from any clone of your workspace. They auto-detect the repository root using git.

### Elevate Design System
The workspace includes Elevate Lite as a git submodule, giving you:
- Design tokens (CSS variables)
- Component templates
- Complete DESIGN.md specifications
- Icon library

### Auto-Numbered Explorations
Explorations are automatically numbered (01, 02, 03...) for chronological tracking.

### Personalized to Your Squad
- Squad name in header
- Custom epic themes
- Squad-specific CLAUDE.md

---

## Quick Start Workflow

1. **Set up workspace** (one-time):
   ```
   /setup-squad-explorations
   ```

2. **Create your first epic**:
   ```
   /new-epic
   ```

3. **Start exploring**:
   ```
   /new-exploration {epic-name}
   ```

4. **Open and prototype**:
   - Reference `shared/elevate-lite/design-system/DESIGN.md`
   - Browse [Elevate Lookbook](https://www.g2.test/elevate/lookbook)
   - Use templates from `shared/elevate-lite/components/templates/`

---

## Tips

### For Design Team Leads
Share this guide with your squad. The setup wizard makes it easy for anyone to get started.

### For Individual Designers
You can create multiple workspaces for different projects:
```
~/projects/
├── buyer-intent-explorations/
├── search-discovery-explorations/
└── onboarding-explorations/
```

Each workspace is independent but uses the same Elevate Lite design system.

### Keeping Elevate Lite Updated
```bash
cd ~/projects/your-squad-explorations/
git submodule update --remote shared/elevate-lite
```

---

## Sharing Your Workspace

### Push to GitHub
```bash
git remote add origin <your-repo-url>
git push -u origin main
```

Replace `<your-repo-url>` with your actual GitHub repository URL.

### Share with Your Squad
Other designers can clone and start creating explorations immediately:
```bash
git clone --recurse-submodules <your-repo-url>
cd <workspace-directory>
/new-exploration {epic-name}
```

---

## Questions?

- **Setup issues**: Check that git is available and you have GitHub access
- **Elevate questions**: See `shared/elevate-lite/design-system/DESIGN.md`
- **Skill questions**: Skills are documented in `.claude/new-epic.md` and `.claude/new-exploration.md`

---

**Happy prototyping! 🚀**

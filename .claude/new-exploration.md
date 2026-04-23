---
description: Start a new numbered exploration in the current epic
---

You are helping the user start a new design exploration following the Chicago Labs conventions.

## Your Task

1. **Determine the epic directory**
   - The user will provide an epic name (e.g., "search-results", "bulk-purchase")
   - Epic path: `/Users/schilds/projects/chicago-labs-explorations/epics/{epic-name}/explorations/`

2. **Find the next exploration number**
   - List all `##-*.html` files in the explorations directory
   - Find the highest number (e.g., if `01-base.html` and `02-refined.html` exist, next is `03`)
   - If no numbered explorations exist, start with `01`

3. **Get the exploration name**
   - Ask the user for a descriptive kebab-case name (e.g., "pricing-tiers", "null-state")
   - The final filename will be: `{number}-{name}.html` (e.g., `03-pricing-tiers.html`)

4. **Copy the starter template**
   - Copy `/Users/schilds/projects/chicago-labs-explorations/shared/exploration-starter.html`
   - To: `epics/{epic-name}/explorations/{number}-{name}.html`
   - Update the `<title>` tag to match the exploration name (title case)

5. **Update the epic's index.html**
   - Read `epics/{epic-name}/index.html`
   - Add a new entry to the explorations gallery linking to the new file
   - Follow the existing pattern in the index (usually a card or list item with thumbnail)
   - If no index.html exists, skip this step and inform the user

6. **Report completion**
   - Show the user the full path to the new exploration
   - Suggest opening it in their browser or editor

## Example Interaction

User: `/new-exploration search-results`

You:
1. List explorations in epics/search-results/explorations/
2. Find next number is `03`
3. Ask: "What should this exploration be called? (kebab-case, e.g., 'advanced-filters')"
4. User responds: "query-refinement"
5. Copy template → `epics/search-results/explorations/03-query-refinement.html`
6. Update title to "Query Refinement"
7. Add entry to `epics/search-results/index.html`
8. Report: "Created exploration at epics/search-results/explorations/03-query-refinement.html"

## Path Adjustments in Starter Template

The starter template has relative paths for CSS/JS that assume it's in an epic's explorations folder:
```html
<link rel="stylesheet" href="../../shared/tokens/elevate.css">
<link rel="stylesheet" href="../../shared/components/elevate.css">
<link rel="stylesheet" href="../../shared/icons/icons.css">
```

These paths are CORRECT for explorations in `epics/{epic}/explorations/` — do NOT modify them.

## Edge Cases

- **No explorations directory**: Create it first, then proceed
- **No index.html**: Skip index update, inform user
- **Non-standard numbering**: If explorations exist without numbers, ask user how to proceed
- **Name conflict**: If `{number}-{name}.html` exists, increment number

## Important

- Always use the EXACT starter template path: `/Users/schilds/projects/chicago-labs-explorations/shared/exploration-starter.html`
- Never invent exploration names — always ask the user
- Keep numbering sequential and zero-padded (01, 02, not 1, 2)

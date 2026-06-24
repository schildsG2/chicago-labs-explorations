# Migration Plan: elevate-lite → elevate-prototyping-kit

> Internal planning doc. Tracks the transition from the manually-synced `elevate-lite` submodule to a new `elevate-prototyping-kit` that consumes `@g2crowd/elevate` (npm) as its upstream CSS source.

---

## Background

### Why migrate?

`elevate-lite` is a manually-maintained static snapshot of compiled Elevate CSS, copied from the UE Rails monorepo. `@g2crowd/elevate` (npm package, v1.3.0+) now provides the same CSS as a proper versioned artifact. Rather than maintaining a manual sync, we should consume the npm package's `dist/elevate.css` and focus `elevate-prototyping-kit` on what elevate-g2 intentionally *doesn't* provide: icons, nav shells, HTML templates, DESIGN.md, and backward-compatible token aliases.

### What changes for exploration authors?

- CSS `<link>` paths change from `shared/elevate-lite/` → `shared/elevate-prototyping-kit/`
- Everything else stays the same: same `[elv]` attribute, same `elv-` utility classes, same BEM component classes, same `var(--bg-*)` token references

### What doesn't change?

- Old epics in `chicago-labs-explorations` — left as-is, referencing frozen elevate-lite files
- The zero-build-tools constraint — still just `<link>` tags and static HTML
- The design system spec (DESIGN.md) — same content, new home

---

## Scope

### Repos touched

| Repo | Role | Changes |
|---|---|---|
| `schildsG2/elevate-prototyping-kit` | **NEW** — submodule consumed by others | Created from elevate-lite content + elevate-g2 dist CSS |
| `chicago-labs-explorations` | Primary consumer | Freeze old submodule as regular files, add new submodule, update forward-looking files only |
| `squad-explorations-template` | Template for other squads | Update all references to new submodule path |

### Files NOT touched (old epics, frozen)

All 38 HTML files and 15 markdown files in `chicago-labs-explorations/epics/` that reference `shared/elevate-lite/` are left unchanged. They will continue to work because `shared/elevate-lite/` is preserved as regular (non-submodule) files.

---

## Architecture

### Critical finding: utility class parity gap

Pre-planning analysis revealed that `@g2crowd/elevate@1.3.0`'s `dist/elevate.css` only contains **575 of 1,003** `elv-` utility classes present in elevate-lite's `components/elevate.css`. The npm package's Tailwind build generates only utilities referenced by its own component CSS, while the UE production build (which elevate-lite snapshots) generates a full safelist.

**Decision**: For Phase 1, the kit carries forward **elevate-lite's full `components/elevate.css` as-is** — it is NOT replaced with the npm dist yet. The `sync.sh` script is included as infrastructure for a future switch when `@g2crowd/elevate` reaches full utility parity (or we confirm which utilities are actually needed). The kit's immediate value is the new identity, the token alias shim, and clean decoupling from the "elevate-lite" name.

### What lives where after migration

```
elevate-prototyping-kit/          ← NEW REPO (git submodule)
├── tokens/
│   └── elevate.css               ← AUTHORED: alias shim (59 aliases to --elv-* vars)
│                                    + hardcoded fallbacks (~151 palette/spacing/shadow/font tokens)
├── components/
│   └── elevate.css               ← CARRIED FORWARD: elevate-lite's full 13K-line CSS
│                                    (future: sync from @g2crowd/elevate when parity achieved)
│   └── templates/                ← KEPT: 44 copy-paste HTML templates
│       └── navigation/           ← KEPT: 4 nav shells (vendor-admin, g2-topbar, etc.)
├── icons/
│   └── icons.css                 ← KEPT: 305 SVG icons (not in elevate-g2)
├── design-system/
│   └── DESIGN.md                 ← KEPT: authoritative spec
├── assets/logos/                 ← KEPT: G2 SVG logos
├── sync.sh                       ← NEW: future-use script to pull @g2crowd/elevate dist
└── README.md                     ← UPDATED: explains the kit's purpose
```

### The alias shim (`tokens/elevate.css`)

This file provides backward compatibility so existing `var(--bg-primary)` references continue to work when the actual CSS defines `--elv-bg-primary`.

```css
/* === ALIAS SHIM ===
   Maps unprefixed token names (used in explorations) to
   --elv-* prefixed names (defined by @g2crowd/elevate dist).
   
   LOAD ORDER: This file loads BEFORE components/elevate.css
   in HTML <link> tags — but that's fine because both :root blocks
   merge. The aliases resolve at use-time, not definition-time.
   ============================================================ */

:root {
  /* --- Semantic aliases (map to --elv-* from dist) --- */

  /* Backgrounds */
  --bg-primary-5:   var(--elv-bg-primary-5);
  --bg-primary-10:  var(--elv-bg-primary-10);
  --bg-primary-20:  var(--elv-bg-primary-20);
  /* ... all ~32 bg tokens ... */
  --bg-primary:     var(--elv-bg-primary);

  /* Text */
  --text-default:     var(--elv-text-default);
  --text-subtle:      var(--elv-text-subtle);
  --text-nonessential: var(--elv-text-nonessential);
  /* ... all ~16 text tokens ... */

  /* Borders */
  --border-light:   var(--elv-border-light);
  --border-medium:  var(--elv-border-medium);
  /* ... all ~12 border tokens ... */

  /* --- Hardcoded values (not exposed as CSS vars by elevate-g2) --- */

  /* Raw palette (used in custom <style> blocks) */
  --palette-rorange-20:  #fff6f5;
  --palette-rorange-40:  #FFD7D1;
  --palette-rorange-60:  #ffa394;
  --palette-rorange-80:  #ff7761;
  --palette-rorange-100: #ff492c;
  --palette-rorange-120: #eb2000;
  --palette-rorange-140: #b21800;
  --palette-rorange-160: #610d00;
  --palette-rorange-180: #2e0600;
  /* ... purple, neutral, blue, green, yellow palettes ... */

  /* Typography */
  --font-sans: 'Figtree', sans-serif;
  --text-xs: 0.75rem;
  --text-sm: 0.875rem;
  /* ... all type scale + weight + leading tokens ... */

  /* Spacing */
  --space-0: 0;
  --space-1: 0.25rem;
  --space-2: 0.5rem;
  /* ... full spacing scale ... */

  /* Border radius */
  --radius-2xs: 0.125rem;
  --radius-xs: 0.25rem;
  /* ... all box + pill radius tokens ... */

  /* Shadows */
  --shadow-0: none;
  --shadow-1: 0px 0px 1px 0px rgba(32, 31, 35, 0.32), 0px 4px 4px 0px rgba(32, 31, 35, 0.04);
  /* ... all shadow tokens ... */

  /* Border widths */
  --border-width-default: 0.5px;
  --border-width-1: 1px;
  /* ... etc ... */
}
```

**Key design decision**: The shim is intentionally conservative. It maps *every* token that elevate-lite currently defines, even ones that may not be in active use. This prevents subtle breakage. Over time, the shim can be pruned as explorations adopt `--elv-*` directly.

### CSS loading order in HTML files

```html
<!-- 1. Alias shim (defines unprefixed vars, maps to --elv-*) -->
<link rel="stylesheet" href="../../shared/elevate-prototyping-kit/tokens/elevate.css">
<!-- 2. Full bundle (defines --elv-* vars, Tailwind utilities, component classes) -->
<link rel="stylesheet" href="../../shared/elevate-prototyping-kit/components/elevate.css">
<!-- 3. Icons (standalone, no dependencies) -->
<link rel="stylesheet" href="../../shared/elevate-prototyping-kit/icons/icons.css">
```

The shim loads first but CSS custom property aliases resolve at *use-time*, not definition-time. So `var(--bg-primary)` → `var(--elv-bg-primary)` works correctly even though `--elv-bg-primary` is defined in the second file. Both `:root` blocks merge.

### Sync script (`sync.sh`)

```bash
#!/bin/bash
# Sync components/elevate.css from @g2crowd/elevate npm package
set -euo pipefail

VERSION="${1:-latest}"
TMPDIR=$(mktemp -d)
trap "rm -rf $TMPDIR" EXIT

echo "Fetching @g2crowd/elevate@${VERSION}..."
cd "$TMPDIR"
npm pack "@g2crowd/elevate@${VERSION}" --quiet
tar xzf g2crowd-elevate-*.tgz

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cp package/dist/elevate.css "$SCRIPT_DIR/components/elevate.css"

echo "Synced components/elevate.css from @g2crowd/elevate@${VERSION}"
echo "Lines: $(wc -l < "$SCRIPT_DIR/components/elevate.css")"
```

Usage: `./sync.sh` (latest) or `./sync.sh 1.3.0` (pinned version)

---

## Phases

### Phase 0: Preparation (no repo changes) — RESOLVED

**Status**: Complete. Parity check was performed during planning. Finding: 689 of 1,003 `elv-` utility classes in elevate-lite are missing from `@g2crowd/elevate@1.3.0` dist. 

**Decision**: Carry forward elevate-lite's full `components/elevate.css` instead of replacing with npm dist. This eliminates the parity gap entirely — all existing classes continue to work. The sync script is included for future use when `@g2crowd/elevate` achieves full utility coverage.

**Gate**: ✅ Passed (by carrying forward full CSS rather than replacing it).

### Phase 1: Create elevate-prototyping-kit repo

**Goal**: A standalone repo that works as a drop-in submodule replacement.

- [x] **1.1** Create `schildsG2/elevate-prototyping-kit` on GitHub (public, same as elevate-lite)
- [x] **1.2** Seed with elevate-lite content (copy, not fork — clean history)
- [x] **1.3** Keep `components/elevate.css` as-is from elevate-lite (NOT replacing with npm dist — see Phase 0 decision)
- [x] **1.4** Author `tokens/elevate.css` as combined file: 59 aliases mapping unprefixed → `--elv-*` vars, plus ~151 hardcoded token values (palette, typography, spacing, radius, shadows) not exposed by elevate-g2
- [x] **1.5** Add `sync.sh` script
- [x] **1.6** Update `README.md` to explain the kit's purpose, relationship to @g2crowd/elevate, and sync process
- [x] **1.7** Remove `.internal/` maintainer docs that are chicago-labs-specific (not kit-specific)
- [x] **1.8** Remove `components/ELEVATE_COMPONENTS.md` (outdated — the templates themselves are the reference)
- [x] **1.9** Tag initial commit as `v1.0.0`

**Validation gate** (before proceeding to Phase 2):

- [x] **1.V1** Create `_test-validation.html` in kit repo root with this content:
  ```html
  <!DOCTYPE html>
  <html lang="en"><head>
    <link rel="stylesheet" href="./tokens/elevate.css">
    <link rel="stylesheet" href="./components/elevate.css">
    <link rel="stylesheet" href="./icons/icons.css">
  </head><body>
  <div elv>
    <div class="elv-flex elv-gap-4 elv-p-8">
      <button class="btn btn--primary btn--md">Primary</button>
      <button class="btn btn--secondary btn--md">Secondary</button>
    </div>
    <p class="elv-text-sm" style="color: var(--text-default)">Token test</p>
    <p class="elv-text-xs" style="color: var(--text-subtle)">Subtle test</p>
    <p style="background: var(--bg-primary); color: var(--text-inverted); padding: 8px;">
      BG alias test (should be purple #5746b2)
    </p>
    <p style="color: var(--palette-purple-100)">Palette var test (should be #5746b2)</p>
    <p style="font-family: var(--font-sans)">Font var test (should be Figtree)</p>
    <p style="margin-top: var(--space-4)">Spacing var test (should be 1rem/16px gap above)</p>
  </div>
  </body></html>
  ```
- [x] **1.V2** Open `_test-validation.html` in Chrome/Safari. Pass criteria (all must be true):
  - Primary button has purple (`#5746b2`) background and white text
  - Secondary button has transparent background with `#dfdfe2` border
  - "Token test" text renders in `#201f23` (not black, not missing)
  - "BG alias test" paragraph has purple background — confirms `var(--bg-primary)` alias resolves
  - "Palette var test" text is purple — confirms hardcoded `--palette-purple-100` works
  - "Font var test" renders in Figtree (check via DevTools computed font-family)
  - "Spacing var test" has 16px margin-top — confirms `--space-4` resolves
  - Browser DevTools Console shows **0 errors, 0 404s** in Network tab
- [x] **1.V3** Open `components/templates/navigation/vendor-admin-shell.html` in browser. Pass criteria:
  - Sidebar renders with dark blue (`#062846`) background
  - Top header bar renders with white background and bottom border
  - `var(--font-sans)` resolves (text renders in Figtree, not serif fallback)
  - `var(--text-default)` resolves (text is `#201f23`, not black or missing)
  - Browser Console shows 0 errors
- [x] **1.V4** Delete `_test-validation.html` after all checks pass (not committed to repo)

### Phase 2: Update chicago-labs-explorations

**Goal**: New explorations use the kit. Old epics continue working untouched.

- [x] **2.1** Freeze elevate-lite: convert submodule to regular files
  ```bash
  # Preserve current files, remove submodule tracking
  git submodule deinit shared/elevate-lite
  git rm --cached shared/elevate-lite
  rm -rf .git/modules/shared/elevate-lite
  # Files are still in shared/elevate-lite/ — just no longer a submodule
  git add shared/elevate-lite/
  # Remove from .gitmodules (file will be empty/deleted)
  git commit -m "Freeze shared/elevate-lite as regular files (no longer a submodule)"
  ```
- [x] **2.2** Add new submodule
  ```bash
  git submodule add https://github.com/schildsG2/elevate-prototyping-kit.git shared/elevate-prototyping-kit
  git commit -m "Add shared/elevate-prototyping-kit submodule"
  ```
- [x] **2.3** Update forward-looking files (paths: `shared/elevate-lite` → `shared/elevate-prototyping-kit`):
  - `shared/exploration-starter.html`
  - `index.html` (root portal — CSS links only, not epic card hrefs)
- [x] **2.4** Update documentation references:
  - `CLAUDE.md` — all references to elevate-lite paths, add note about legacy vs active
  - `AGENTS.md` — update submodule reference, CSS architecture section
  - `README.md` — update quick start and resources sections
- [x] **2.5** Commit: `"Update forward-looking files to use elevate-prototyping-kit"`
- [x] **2.6** Verify Phase 2 (all must pass):
  - Run `git submodule status` — output shows `shared/elevate-prototyping-kit` only (NOT `shared/elevate-lite`)
  - Run `ls shared/elevate-lite/tokens/elevate.css` — file exists (frozen regular files preserved)
  - Run `ls shared/elevate-prototyping-kit/tokens/elevate.css` — file exists (new submodule active)
  - Open `shared/exploration-starter.html` in Chrome/Safari:
    - Browser Network tab: 0 failed requests (no 404s for CSS files)
    - Primary button renders with purple background (`#5746b2`)
    - Browser Console: 0 errors
  - Open `epics/design-exploration-example/explorations/01-initial-concept.html` in browser:
    - CSS still loads from `shared/elevate-lite/` path (frozen files working)
    - No 404s, no console errors — confirms old epics are unaffected

**Not touched**: Any file under `epics/*/`. Old epics continue referencing `shared/elevate-lite/` which is now frozen regular files.

### Phase 3: Update squad-explorations-template

**Goal**: New squad setups use the kit from day one.

- [x] **3.1** Update submodule placeholder (`shared/elevate-lite-PLACEHOLDER.md` → references elevate-prototyping-kit)
- [x] **3.2** Update HTML files (paths: `shared/elevate-lite` → `shared/elevate-prototyping-kit`):
  - `index.html`
  - `epics/example-epic/index.html`
  - `epics/example-epic/explorations/01-example.html`
  - `shared/exploration-starter.html`
- [x] **3.3** Update skills (submodule URL + path references):
  - `.claude/setup-squad-explorations.skill`
  - `.claude/new-epic.skill`
  - `.claude/new-exploration.skill`
- [x] **3.4** Update docs:
  - `docs/SETUP_GUIDE.md`
  - `docs/SETUP_PROMPT.md`
- [x] **3.5** Update `CLAUDE.md` — all path references
- [x] **3.6** Commit: `"Migrate from elevate-lite to elevate-prototyping-kit"`
- [x] **3.7** Verify Phase 3 (all must pass):
  - Run `grep -r 'elevate-lite' index.html shared/ epics/ docs/ .claude/ CLAUDE.md` in the squad-explorations-template repo — output must be empty (zero remaining references to old path, except possibly in the placeholder rename description)
  - Run `grep -r 'elevate-prototyping-kit' index.html shared/ .claude/` — confirms new path appears in HTML files and skills
  - Open `index.html` in browser: CSS loads (no 404s), portal renders with Elevate styling
  - Open `epics/example-epic/explorations/01-example.html` in browser: CSS loads, button renders purple

### Phase 4: Coworker migration prompt

**Goal**: Existing squad repo users can migrate with a single copy-paste prompt.

- [x] **4.1** Write a Claude Code migration prompt (documented below)
- [x] **4.2** Test the prompt:
  - Clone `squad-explorations-template` into `/tmp/test-migration-squad/`
  - Simulate a post-setup state: run `git submodule add https://github.com/schildsG2/elevate-lite.git shared/elevate-lite` to mimic a squad that already set up with elevate-lite
  - Apply the migration prompt
  - Verify: `ls shared/elevate-prototyping-kit/tokens/elevate.css` exists, `grep -r 'elevate-lite' *.html **/*.html` returns zero matches in HTML link hrefs, open any HTML file in browser with no 404s
  - Clean up: `rm -rf /tmp/test-migration-squad/`
- [x] **4.3** Share with team

#### Draft migration prompt

```
Migrate this explorations workspace from elevate-lite to elevate-prototyping-kit.

Steps:
1. Check if shared/elevate-lite is a git submodule:
   - If YES: run `git submodule deinit shared/elevate-lite && git rm shared/elevate-lite`
   - If NO (regular files): skip this step

2. Add the new submodule:
   git submodule add https://github.com/schildsG2/elevate-prototyping-kit.git shared/elevate-prototyping-kit

3. Find-and-replace in ALL .html files (but ONLY in link href attributes and script src attributes):
   shared/elevate-lite/ → shared/elevate-prototyping-kit/

4. Find-and-replace in ALL .md files:
   elevate-lite → elevate-prototyping-kit

5. If shared/elevate-lite/ still exists as regular files, leave it — old explorations reference it.
   If it was a submodule and is now gone, copy the files from elevate-prototyping-kit:
   cp -r shared/elevate-prototyping-kit/ shared/elevate-lite/
   (This preserves backward compat for any old exploration HTML files.)

6. Verify: open any exploration HTML file in a browser. CSS should load. Buttons, chips, and
   typography should render correctly. Check browser console for 404s.

7. Commit: "Migrate from elevate-lite to elevate-prototyping-kit"
```

---

## Risks & Mitigations

| Risk | Likelihood | Impact | Mitigation |
|---|---|---|---|
| Missing utility classes in elevate-g2 dist | ~~Medium~~ Resolved | ~~High~~ None | Carrying forward elevate-lite's full CSS eliminates this risk entirely |
| Visual differences in component CSS (different compile pipeline) | Medium | Medium — subtle styling diffs | Phase 1 validation gate catches this before consumers update |
| Alias shim masks a future upstream var name collision | Low | Low — only if elevate-g2 adds an unprefixed var | Keep shim narrow; document each alias; prune over time |
| Coworkers break things during migration | Low | Low — isolated to their repo | Migration prompt includes verification step + rollback is `git revert` |
| `@g2crowd/elevate` makes a breaking change | Low | Medium | sync.sh accepts a pinned version; pin to known-good release |

## Rollback

Each phase is committed separately. Rollback at any point:

- **Phase 1 fails**: Delete the new repo. Nothing else changed.
- **Phase 2 fails**: `git revert` the two commits (freeze + add submodule). Re-add elevate-lite submodule from `.gitmodules` backup.
- **Phase 3 fails**: `git revert` the single commit. Template still works with old paths.
- **Phase 4 fails**: Coworkers `git revert` their migration commit.

---

## Post-migration

### Ongoing sync process

When `@g2crowd/elevate` releases a new version:

```bash
cd shared/elevate-prototyping-kit
./sync.sh          # or ./sync.sh 1.4.0 for a specific version
git add components/elevate.css
git commit -m "Sync components/elevate.css from @g2crowd/elevate@1.4.0"
git push
```

Consumer repos pull the update:
```bash
cd shared/elevate-prototyping-kit
git pull origin main
cd ../..
git add shared/elevate-prototyping-kit
git commit -m "Update elevate-prototyping-kit"
```

### Future: deprecating the alias shim

As new explorations are written using `--elv-*` prefixed tokens directly, the shim becomes less necessary. Eventually:
1. Audit which unprefixed tokens are still in use
2. Remove unused aliases
3. When no unprefixed references remain in active explorations, delete the shim and have `tokens/elevate.css` simply re-export or be empty

### Future: icons migration

If `@g2crowd/elevate` adds icon infrastructure, the kit's `icons/` directory can be deprecated in favor of the upstream package. Until then, icons stay here.

---

## Estimated effort

| Phase | Effort | Dependencies |
|---|---|---|
| Phase 0: Parity check | 30 min | None |
| Phase 1: Create kit repo | 1-2 hours | Phase 0 passes |
| Phase 2: Update chicago-labs | 30 min | Phase 1 validated |
| Phase 3: Update squad template | 30 min | Phase 1 validated |
| Phase 4: Coworker prompt | 15 min | Phases 2+3 verified |
| **Total** | **~3-4 hours** | |

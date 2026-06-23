# Squad Migration: elevate-lite → elevate-prototyping-kit

`elevate-lite` has been renamed to `elevate-prototyping-kit` to better reflect what it actually is — a prototyping toolkit, not a "lite" design system. The new repo lives at `https://github.com/schildsG2/elevate-prototyping-kit`. CSS, tokens, components, icons, and templates are identical; only the name and path changed.

**Your old explorations are not affected.** Only forward-looking files (your starter template, index pages, docs) need updating.

Copy the prompt below into Claude Code while inside your squad workspace.

---

## Migration Prompt

```
Migrate this squad explorations workspace from elevate-lite to elevate-prototyping-kit.

The new repo is: https://github.com/schildsG2/elevate-prototyping-kit.git
The new local path is: shared/elevate-prototyping-kit/

Steps:

1. Check whether shared/elevate-lite exists:
   a) If it is a git submodule (check with: git submodule status | grep elevate-lite):
      - git submodule deinit shared/elevate-lite
      - git rm shared/elevate-lite
      - rm -rf .git/modules/shared/elevate-lite
   b) If it is regular files (not a submodule): leave it in place — do NOT delete it.
   c) If it does not exist at all: skip to step 2.

2. Add the new submodule:
   git submodule add https://github.com/schildsG2/elevate-prototyping-kit.git shared/elevate-prototyping-kit

3. In ALL .html files, update only CSS <link> href attributes:
   shared/elevate-lite/tokens/elevate.css   → shared/elevate-prototyping-kit/tokens/elevate.css
   shared/elevate-lite/components/elevate.css → shared/elevate-prototyping-kit/components/elevate.css
   shared/elevate-lite/icons/icons.css       → shared/elevate-prototyping-kit/icons/icons.css
   Do NOT change epic card links, nav hrefs, or any other attributes — only <link rel="stylesheet"> hrefs.

4. In ALL .md files, replace: elevate-lite → elevate-prototyping-kit

5. In ANY .claude/*.skill files, update:
   - The git submodule add URL: elevate-lite.git → elevate-prototyping-kit.git
   - The submodule path argument: shared/elevate-lite → shared/elevate-prototyping-kit
   - Any CSS link href strings inside HTML templates in the skill

6. Backward compatibility: if shared/elevate-lite/ no longer exists after step 1
   (because it was a submodule and was removed), copy the new kit as a fallback:
   cp -r shared/elevate-prototyping-kit/ shared/elevate-lite/
   This ensures any old exploration HTML files that still reference the old path continue to work.

7. Verify: run this check and confirm zero matches:
   grep -r 'elevate-lite' --include="*.html" . | grep 'href.*elevate-lite'
   (There should be no CSS link hrefs pointing to elevate-lite. Non-href references in prose or epic card links are fine.)

8. Commit everything:
   git add -A
   git commit -m "Migrate from elevate-lite to elevate-prototyping-kit"
```

---

## Notes

- **No visual changes** — the CSS is identical. Buttons, tokens, icons, and utilities all behave the same.
- **Old explorations keep working** — step 6 ensures backward compat for any HTML that still references `shared/elevate-lite/`.
- **Rollback** — if anything looks wrong, `git revert HEAD` takes you back immediately.
- **New explorations** — after migration, use `shared/elevate-prototyping-kit/` in all new files.
- **v2.0.0 changes** — adds an `examples/` gallery with 45 elevate-g2 component pages: browse `shared/elevate-prototyping-kit/examples/index.html`. The `component library` footer link in `index.html` now points to this gallery instead of the old demo page. Components are unchanged — no visual differences.

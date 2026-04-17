# Open Questions

## Elevate CSS Sync Strategy

**Context:**
The `shared/components/elevate.css` file was originally a symlink to the UE production Elevate CSS:
```
shared/components/elevate.css → /Users/schilds/projects/ue/engines/elevate/public/elevate-assets/application.css
```

**Current State:**
Replaced with a static copy of the file (266KB) to enable GitHub Pages deployment.

**Trade-offs:**

✅ **Pros:**
- GitHub Pages works (symlinks caused build failures)
- Repo is self-contained (anyone can clone and run locally)
- Stable styling for existing explorations

⚠️ **Cons:**
- No automatic sync with UE Elevate updates
- Manual copy required to get new Elevate design system changes
- Repo is ~266KB larger

**Possible Solutions:**

1. **Keep as-is** (current approach)
   - Manually copy from UE when major Elevate updates are needed
   - Simple, works for prototyping
   
2. **Dual setup** (local symlink + committed file)
   - Gitignore the file, use symlink locally
   - Pre-commit hook copies file before deployment
   - More complex, but best of both worlds
   
3. **Deploy script**
   - Keep symlink in repo
   - Deployment script copies file only when publishing to GitHub Pages
   - Requires manual deployment step

**Decision needed:**
- How often does Elevate CSS update in meaningful ways?
- Is auto-sync critical for this prototyping repo?
- Worth the complexity of dual setup?

**Current decision:** Keep as static file for now. Revisit if Elevate updates become frequent.

---

*Last updated: 2026-04-17*

# Internal Planning Docs

This folder contains planning and progress tracking documents for maintaining the component library. **Not intended for design team sharing.**

## Documents

- **ELEVATE_ROADMAP.md** — Full 10-13 week roadmap with phases and timelines
- **COMPONENT_PROGRESS.md** — Detailed progress tracker for all components
- **NEXT_STEPS.md** — Tactical next actions and sprint planning

## Philosophy

**Keep it lightweight.** The Elevate Lookbook is the source of truth for documentation. This library is just a thin HTML translation layer.

**Team-facing docs** (in `/shared/`):
- Quick start guide
- Minimal component reference
- HTML templates with code snippets

**Internal docs** (this folder):
- Detailed roadmaps
- Progress tracking
- Implementation planning

## For Maintainers

When building components:
1. Browse Lookbook for reference
2. Copy `_template.html`
3. Build minimal HTML examples
4. Include code snippets
5. Link to Lookbook for full docs

**Don't duplicate Lookbook documentation.** Just provide copy-paste HTML.

## Current Status

- ✅ Foundation complete (tokens, docs, templates)
- 🔄 Icons in progress (agent porting)
- 📋 Simple components: 1/12 complete (chip done)
- 📋 Interactive components: 0/10
- 📋 Complex components: 0/12

Next: Build avatar, status_badge, spin_loader, link

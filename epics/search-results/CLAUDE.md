# Search Results Epic — Agent Context

## Epic Overview

**Search Results** explorations for ai.g2.com (G2 AI Agent Marketplace). This epic focuses on improving the search and browse experience for AI agents, MCP servers, and related tools.

**Problem Space:**
- Current browse page lacks clear search feedback (no result count, no query confirmation)
- Empty/null states need better guidance and next steps
- Search UX patterns should follow e-commerce best practices

**Research Foundation:**
- See `/research/spikes/search-ux-patterns.html` for UX research (via Baymard MCP)
- Key insights: query conveyance, result counts, accessible null states

**Source Material:**
- Production repo: https://github.com/g2crowd/g2-ai
- Current implementation: `/engines/marketplace/app/views/marketplace/homepage/`

## Key References

- **UX Research**: `/research/spikes/search-ux-patterns.html`
- **Base Implementation**: `./base/index.html` (models current ai.g2.com)
- **Production Repo**: g2crowd/g2-ai (marketplace engine)

## Design Principles

Follow Elevate design system specifications:
- Query conveyance with result count badges
- Practical, encouraging empty states with next steps
- Purple accent (#5746b2) for brand elements
- Dark theme matching ai.g2.com
- Accessibility-first (ARIA labels, screen reader support)

# PPL Form Flow Epic — Agent Context

## Epic Overview

**PPL Form Flow** explores a review-like wizard flow for collecting qualifying information from prospects. The hypothesis is that a guided, step-by-step form experience can surface sufficient qualifying signals to determine PPL fit — without requiring a sales conversation upfront.

**Problem Space:**
- Current qualification process relies heavily on manual sales outreach
- Need to determine if a structured wizard flow can collect enough qualifying data
- Exploring form UX patterns that balance completion rate with data quality

**Hypothesis:**
A guided wizard flow — modeled after review-style progressive disclosure — can collect sufficient qualifying information to assess PPL fit, reducing friction for both buyers and sellers.

## Research Foundation

- See `/research/spikes/advisor-router-wizard-options.html` for the options report
- Key insights: Option C (Turbo Frames + hidden fields) recommended as base, enhanced with Option B's StepIndicatorComponent and ModalFooterComponent
- SA wizard deep dive documents the Software Advice lead-acquisition wizard as a pattern reference
- Recommended step sequence: Contact Preference → Company Size → Use Case → Contact Info

## Key References

- **Options Report**: `/research/spikes/advisor-router-wizard-options.html`
- **Explorations**: `./explorations/` (numbered, hypothesis-driven)

## Design Principles

Follow Elevate design system specifications:
- Use `shared/elevate-prototyping-kit/` for all CSS (tokens, components, utilities, icons)
- Progressive disclosure — reveal complexity gradually
- Clear progress indication throughout the wizard flow
- Purple accent (#5746b2) for brand elements and primary CTAs
- Accessibility-first (ARIA labels, keyboard navigation, screen reader support)
- Never pure black — use text-default (#201f23)
- 4px spacing base for all layout

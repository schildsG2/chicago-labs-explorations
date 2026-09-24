# Qualification Chat — Agent Context

## Epic Overview

**Qualification Chat** explores a conversational, chat-style alternative to
the qualifying wizard in [PPL Form Flow](../ppl-form-flow/) — the same
timeframe / needs / contact / budget qualifying questions, but delivered as
a chat thread (bot message → inline controls → user reply) instead of a
step-by-step form.

**Problem Space:**
- PPL Form Flow validates a guided, form-based wizard for collecting PPL
  qualifying signals.
- This epic asks whether a chat framing — G2 "talking" the buyer through
  the same questions, with results and a human/AI/vendor handoff at the
  end — reads as more approachable, more agent-native, or just slower than
  the form. See [PPL Scrollytelling](../ppl-scrollytelling/) for a third,
  narrative-driven take on the same qualifying moment.

**Origin:**
- `explorations/01-figma-flow-mockup.html` was imported directly from a
  Figma-generated flow mockup (`qualification-chat-figma-flow-mockup.html`
  from Downloads) as the seed for iteration. It is self-contained (inline
  styles, a small state machine driving the chat) rather than wired to the
  shared `elevate-prototyping-kit` CSS bundle — treat it as a rough Figma
  export to refine, not a compliant baseline.

**Flow covered by the seed exploration:**
Intro → Timeframe → Needs (multi-select) → Contact form → Budget → Review
(with per-answer edit) → Results (product match cards) → Handoff (vendor /
human advisor / AI agent). A "Prototype Controls" toolbar jumps directly to
any state for review.

## Key References

- **Design System Spec**: `/shared/elevate-prototyping-kit/design-system/DESIGN.md`
- **Sibling explorations**: [PPL Form Flow](../ppl-form-flow/CLAUDE.md), [PPL Scrollytelling](../ppl-scrollytelling/CLAUDE.md)

## Next Steps

- Audit `01-figma-flow-mockup.html` against DESIGN.md and swap inline
  hard-coded values for the shared token/utility bundle once the concept
  direction is validated.
- Numbered explorations (`02-*.html`, `03-*.html`, ...) should branch from
  `01-figma-flow-mockup.html` as the concept iterates.

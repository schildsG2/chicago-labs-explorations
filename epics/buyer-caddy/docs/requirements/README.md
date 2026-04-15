# Requirements

## Overview

[Describe this project and its purpose.]

## Tech Stack

| Layer | Choice |
|---|---|
| [Framework] | [TBD] |
| [Database] | [TBD] |
| [Testing] | [TBD] |

## Feature Lifecycle

Features move through three buckets based on their readiness state:

```
features/todo/               ← stub or incomplete spec
        │
        │  (spec complete: full requirements + acceptance criteria + no blocking open ?s)
        ▼
features/ready-to-implement/ ← ready for /dev-cycle
        │
        │  (dev-cycle runs → reviewer approves → architecture overseer approves)
        │  (folder move committed to PR branch, then PR opened)
        ▼
features/completed/          ← folder already here when PR merges to main; immutable after that
```

- **`todo/`** = idea captured, not ready to build
- **`ready-to-implement/`** = build it; pick this up with `/dev-cycle docs/requirements/features/ready-to-implement/[feature-name]`
- **`completed/`** = shipped and merged; immutable

---

## Completed Features

Implemented and merged to main.

| Feature | Notes |
|---------|-------|
| _(none yet)_ | |

---

## Ready to Implement

Full spec exists; no blocking open questions. Pick these up with `/dev-cycle`.

| Feature | Notes |
|---------|-------|
| _(none yet)_ | |

---

## Todo

Stubs or incomplete specs — not ready to build yet.

| Feature | Notes |
|---------|-------|
| _(none yet)_ | |

---

## Technical Specs

Long-term architecture documentation. All agents must consult these before making architectural decisions.

| Spec | Notes |
|------|-------|
| [technical-overview](technical-overview/README.md) | Entry point — tech stack, architecture |
| [dev-standards](technical-overview/dev-standards/README.md) | Test conventions, code standards |

---

## Open Questions Registry

Unresolved questions from feature specs are tracked in [OPEN-QUESTIONS.md](OPEN-QUESTIONS.md).

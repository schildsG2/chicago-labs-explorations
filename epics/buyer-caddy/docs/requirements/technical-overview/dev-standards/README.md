# Development Standards

> Status: Draft — populate as conventions are established.

This document defines the development standards, test conventions, and code patterns for this project. All agents must follow these standards.

## Requirements Lifecycle

Features move through three buckets in `docs/requirements/features/`:

| Bucket | Meaning |
|---|---|
| `todo/` | Idea captured; spec may be incomplete |
| `ready-to-implement/` | Full spec with acceptance criteria; no blocking open questions |
| `completed/` | Shipped and merged to main; immutable |

Folder naming: kebab-case (e.g., `my-feature-name`).

## Running Tests

> Update this section with the actual test commands once the project is bootstrapped.

```bash
# Unit tests
[command TBD]

# End-to-end tests
[command TBD]
```

Run the full test suite after every code change. Do not leave a broken test suite.

## End-to-End Testing

Every new user-facing feature must include end-to-end tests covering its key flows. Add them to the project's e2e test directory. Run and verify they pass before opening a PR.

## Code Conventions

> Add project-specific conventions here as they emerge (e.g., file layout, naming conventions, module boundaries, import patterns).

## Test File Conventions

> Define where test files live relative to source files (e.g., co-located, `__tests__/` subdirectory, etc.).

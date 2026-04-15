# CLAUDE.md

## Project Overview
[Describe this project: what it is, who it's for, what it does.]

## Authoritative Architecture Reference

> **ALL agents must consult `docs/requirements/technical-overview/` before making any architectural or implementation decisions.**
>
> This directory is the authoritative long-term architecture reference for the project. It defines technology choices, structural patterns, security constraints, integration patterns, and development standards. If a decision conflicts with `technical-overview/`, escalate — do not invent your own approach.
>
> Key docs:
> - `docs/requirements/technical-overview/README.md` — entry point, tech stack overview
> - `docs/requirements/technical-overview/dev-standards/README.md` — test conventions, code standards, repository patterns

## Rules for Agents

- **After every code change, run the full test suite** and confirm all tests pass before considering the task done.
  - Update this section with the project's actual test commands once they are established.
- If any tests fail, fix them before proceeding — do not leave a broken test suite.
- **Every new user-facing feature must include end-to-end tests** covering its key flows.

## Key References
- **Requirements Index**: `docs/requirements/README.md`
- **Technical Overview**: `docs/requirements/technical-overview/README.md`
- **Dev Standards**: `docs/requirements/technical-overview/dev-standards/README.md`

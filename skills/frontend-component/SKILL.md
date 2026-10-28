---
name: frontend-component
description: Build accessible reusable UI components with props, states, and tests. Use when creating or refactoring any frontend component or page.
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: software-build
  version: 0.1.0
  author: hornet-swarm
---

## What I do

- Scaffold components with clear props, loading/empty/error states
- Enforce accessibility (labels, focus, keyboard, contrast) and responsive basics
- Add a minimal interaction test per component

## When to use me

Use when:

- Creating or refactoring any frontend component or page
- Fixing duplicated markup or inaccessible controls

Don't use when:

- Designing visual mockups from scratch (no design tokens available)

## Workflow

1. **Inspect** — read the design requirement, existing components, and design tokens. Identify reuse candidates.
2. **Plan** — propose props API, states (loading/empty/error/disabled), and file location. Confirm framework conventions.
3. **Execute** — implement the component: semantic markup, controlled props, no hardcoded copy, colocated styles.
4. **Verify** — render each state, keyboard-tab through it, run the component test.

## Rules / Constraints

- MUST: semantic HTML, associated labels, visible focus, keyboard operable.
- MUST: handle loading, empty, and error states explicitly.
- MUST NOT: duplicate an existing component; extend it instead.

## Output format

```markdown
## Component: <Name> (`path/to/file`)
- Props: `prop: type` ...
- States covered: default / loading / empty / error
- A11y checks: labels ok, focus ok, keyboard ok
- Test: `<command>` → PASS
```

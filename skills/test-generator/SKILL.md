---
name: test-generator
description: Generate focused unit, integration, and e2e tests with clear arrange-act-assert. Use when adding tests for new or uncovered code.
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: quality-testing
  version: 0.1.0
  author: hornet-swarm
---

## What I do

- Add unit tests for edge cases, integration tests for boundaries, e2e for critical paths
- Follow the repo's existing test framework and naming
- Prove each test fails without the fix and passes with it where applicable

## When to use me

Use when:

- Adding tests for new or uncovered code
- A bug fix needs a regression test

Don't use when:

- Defining the development process itself (use `tdd-workflow`)

## Workflow

1. **Inspect** — read the code under test and existing test patterns. List uncovered branches and edge cases.
2. **Plan** — propose test list: happy path, boundaries, errors, one regression case. Confirm framework and file locations.
3. **Execute** — write arrange-act-assert tests, deterministic (no sleeps, seeded fakes), colocated per repo convention.
4. **Verify** — run the new tests plus neighbors; show fail-without/passing output.

## Rules / Constraints

- MUST: match repo framework/style; deterministic tests only.
- MUST: name tests by behavior (`does X when Y`), not by method.
- MUST NOT: test implementation details that lock refactoring.

## Output format

```markdown
## Tests added: <files>
- <test name> — covers <case>
- Run: `<command>` → PASS (<N> tests)
```

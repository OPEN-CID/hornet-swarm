---
name: tdd-workflow
description: Drive development red-green-refactor in tiny verifiable loops. Use when building features test-first or fixing bugs with regression proof.
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: quality-testing
  version: 0.1.0
  author: hornet-swarm
---

## What I do

- Run red-green-refactor loops: failing test → minimal code → cleanup
- Keep cycles under 10 minutes with always-green main
- Produce tested, refactored increments

## When to use me

Use when:

- Building features test-first or fixing bugs with regression proof
- The user explicitly asks for TDD

Don't use when:

- Spiking an unknown approach (spike first, then TDD the real thing)

## Workflow

1. **Inspect** — read requirements and existing tests. Define the smallest behavior slice.
2. **Plan** — RED: write one failing test describing the behavior; confirm it fails for the right reason.
3. **Execute** — GREEN: minimal code to pass; REFACTOR: clean duplication with tests green.
4. **Verify** — run the suite; commit the tested increment; pick the next slice.

## Rules / Constraints

- MUST: never write production code without a failing test first (during TDD).
- MUST: keep each loop to one behavior; tests stay green at loop end.
- MUST NOT: gold-plate beyond the failing test.

## Output format

```markdown
## TDD loop: <behavior>
- RED: <test> → FAIL (expected)
- GREEN: <change> → PASS
- REFACTOR: <cleanup> → suite `<command>` PASS
```

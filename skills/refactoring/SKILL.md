---
name: refactoring
description: Restructure code safely in small behavior-preserving steps. Use when cleaning duplication, renaming, or extracting modules.
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: software-build
  version: 0.1.0
  author: hornet-swarm
---

## What I do

- Split large functions, remove duplication, clarify names and boundaries
- Keep behavior identical with tests green after every step
- Leave the code easier to delete or extend than before

## When to use me

Use when:

- Cleaning duplication, renaming widely, or extracting modules
- Preparing code for a feature that currently fights the structure

Don't use when:

- Behavior must change (that's a feature — do it separately)

## Workflow

1. **Inspect** — read the target code and its tests/coverage. List smells with `file:line` evidence.
2. **Plan** — propose the smallest step sequence (rename → extract → simplify). Confirm no behavior change is intended.
3. **Execute** — one step at a time: rename, extract function/module, remove dead code. Run tests after each step.
4. **Verify** — full test suite green, diff reviewed for accidental behavior change, no new warnings.

## Rules / Constraints

- MUST: tests pass after every step; stop and report on first red.
- MUST: separate refactoring commits from behavior-change commits.
- MUST NOT: refactor and change behavior in the same edit.

## Output format

```markdown
## Refactor: <scope>
- Steps done: 1) ... 2) ...
- Tests: `<command>` → PASS (before and after)
- Behavior change: none (or explicit list if found — stop)
```

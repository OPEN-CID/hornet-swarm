---
name: issue-breakdown
description: Split big issues into small shippable slices with acceptance criteria. Use when an issue is too big to start.
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: productivity
  version: 1.0.0
  author: hornet-swarm
---

## What I do

- Slice by value: each sub-issue shippable and demoable alone
- Write acceptance criteria per slice; expose dependencies
- Order the stack so the riskiest slice comes first

## When to use me

Use when:

- An issue is too big to start or keeps getting re-estimated
- A PR ballooned and should have been a stack

Don't use when:

- Planning a whole project (use `task-planner`)

## Workflow

1. **Inspect** — read the issue, linked context, and constraints. Find the hidden sub-problems.
2. **Plan** — slice vertically (user-visible value per slice), not by layer. Size each at ≤2 days.
3. **Execute** — write sub-issues with title, why, acceptance criteria, and dependencies.
4. **Verify** — each slice independently shippable; stack order puts risk first.

## Rules / Constraints

- MUST: slices deliver value alone, never "part 1: setup, part 2: everything".
- MUST: acceptance criteria testable by a non-author.
- MUST NOT: create tracking overhead — merge trivial slices.

## Output format

```markdown
## Stack for #<n>: <title>
1. #<new> <slice> — accept: ... ← blocks #2
- Riskiest first: #<x> because ...
```

---
name: task-planner
description: Turn vague goals into ordered tasks with owners and done-criteria. Use when starting any multi-step project.
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: productivity
  version: 1.0.0
  author: hornet-swarm
---

## What I do

- Break goals into tasks with explicit done-criteria, sizes, and dependencies
- Order by risk-first: unknowns and blockers before polish
- Produce a trackable plan with owners and a first action

## When to use me

Use when:

- Starting any multi-step project or sprint
- Work keeps stalling on unclear next steps

Don't use when:

- Splitting one issue for assignment (use `issue-breakdown`)

## Workflow

1. **Inspect** — restate the goal, constraints (time, people, budget), and what already exists.
2. **Plan** — decompose to tasks sized 0.5–2 days, each with done-criteria; map dependencies; flag the riskiest item first.
3. **Execute** — order the sequence, assign owners, set check-in points.
4. **Verify** — confirm every task is unambiguous enough to start today; name the very first action.

## Rules / Constraints

- MUST: every task has done-criteria and a size; no "work on X" tasks.
- MUST: surface unknowns as explicit spike tasks, not hidden risk.
- MUST NOT: plan beyond the next milestone in detail — rolling wave only.

## Output format

```markdown
## Plan: <goal> — done when <criteria>
1. [ ] <task> (owner, size) — done: <criteria> ← depends on #n
- First action: ... | Check-in: <when>
```

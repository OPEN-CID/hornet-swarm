---
name: renovate-room
description: "Renovate one room on budget without chaos. Use for refreshes."
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: housing
  version: 1.0.0
  author: hornet-swarm
  kind: workflow
  triggers: "room refreshes, small renovations"
  steps: "renovation-budget, paint-guide, declutter-guide"
---

## What I do

- fixed budget
- finished room
- no chaos

This is a workflow: I play 3 skills in order, carrying each step's output into the next. Do not skip steps; each gate exists for a reason.

## When to use me

Use when:

- room refreshes
- small renovations

Don't use when:

- You only need one of the steps below - load that skill directly instead.
- The situation changed mid-play - stop, restate, and re-plan rather than forcing the sequence.

## Workflow

The play, in order:

| # | Skill | Job | Handoff |
|---|---|---|---|
| 1 | `renovation-budget` | Budget renovations with contingencies and contractor bids. Use before remodeling. | artifact feeds step 2 |
| 2 | `paint-guide` | Paint rooms with prep, coats, and finish picks. Use for DIY painting. | artifact feeds step 3 |
| 3 | `declutter-guide` | Declutter room by room with keep rules and donation flow. Use when overwhelmed. | artifact feeds step 4 |

How to run me:
1. Start at step 1. Load that skill fully (read its SKILL.md) and complete it.
2. Carry its artifact into the next step as input - never redo completed work.
3. If a step returns a NO-GO / FIX-FIRST / fail verdict, stop the play and fix it before continuing.
4. Review-type steps are gates: nothing moves past them red.

## Rules / Constraints

- MUST: run steps in order; each step's output is the next step's input.
- MUST: load the full SKILL.md of each step - summaries are not enough.
- MUST NOT: skip verification or review steps to go faster.
- MUST NOT: invent outputs for a step you did not run.

## Output format

```text
## Room: <room> — budgeted to beautiful
- Steps run: <names in order>
- Step artifacts: <one line each>
- Confidence: <high/medium/low + what would raise it>
```

## References

- Steps live in skills/<name>/SKILL.md (loaded on demand, never pasted here).
- If the play grows new branches, split it: propose a new workflow, don't bloat this one.
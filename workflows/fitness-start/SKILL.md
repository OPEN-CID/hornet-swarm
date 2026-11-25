---
name: fitness-start
description: "Get fit with training, food, habits, and sleep. Use for fresh starts."
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: fitness
  version: 1.0.0
  author: hornet-swarm
  kind: workflow
  triggers: "fresh fitness starts, getting in shape"
  steps: "fitness-plan, nutrition-plan, habit-builder, sleep-improve"
---

## What I do

- training plan
- eating plan
- locked habit

This is a workflow: I play 4 skills in order, carrying each step's output into the next. Do not skip steps; each gate exists for a reason.

## When to use me

Use when:

- fresh fitness starts
- getting in shape

Don't use when:

- You only need one of the steps below - load that skill directly instead.
- The situation changed mid-play - stop, restate, and re-plan rather than forcing the sequence.

## Workflow

The play, in order:

| # | Skill | Job | Handoff |
|---|---|---|---|
| 1 | `fitness-plan` | Build progressive workout plans around goals and limits. Use when starting or fixing a training routine. | artifact feeds step 2 |
| 2 | `nutrition-plan` | Plan balanced meals around budget and restrictions. Use when meal planning for health goals. General information, not medical advice. | artifact feeds step 3 |
| 3 | `habit-builder` | Build lasting habits with tiny starts and environment design. Use for any new habit. | artifact feeds step 4 |
| 4 | `sleep-improve` | Audit sleep habits and build an improvement plan. Use for insomnia or fatigue routines. | artifact feeds step 5 |

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
## Fit: <weeks> — plan to habit
- Steps run: <names in order>
- Step artifacts: <one line each>
- Confidence: <high/medium/low + what would raise it>
```

## References

- Steps live in skills/<name>/SKILL.md (loaded on demand, never pasted here).
- If the play grows new branches, split it: propose a new workflow, don't bloat this one.
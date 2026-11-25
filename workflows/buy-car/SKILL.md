---
name: buy-car
description: "Buy a used car with research, inspection, and insurance. Use when car shopping."
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: vehicles
  version: 1.0.0
  author: hornet-swarm
  kind: workflow
  triggers: "car shopping, buying a used car"
  steps: "car-buy, used-car-review, insurance-guide"
---

## What I do

- shortlist
- inspection verdict
- coverage

This is a workflow: I play 3 skills in order, carrying each step's output into the next. Do not skip steps; each gate exists for a reason.

## When to use me

Use when:

- car shopping
- buying a used car

Don't use when:

- You only need one of the steps below - load that skill directly instead.
- The situation changed mid-play - stop, restate, and re-plan rather than forcing the sequence.

## Workflow

The play, in order:

| # | Skill | Job | Handoff |
|---|---|---|---|
| 1 | `car-buy` | Buy cars with total-cost math and negotiation scripts. Use before dealerships. | artifact feeds step 2 |
| 2 | `used-car-review` | Inspect used cars with a 100-point check before paying. Use before any used purchase. | artifact feeds step 3 |
| 3 | `insurance-guide` | Buy the right insurance with coverage math. Use for life, health, and home cover. Educational. | artifact feeds step 4 |

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
## Keys: <car> — researched, inspected, insured
- Steps run: <names in order>
- Step artifacts: <one line each>
- Confidence: <high/medium/low + what would raise it>
```

## References

- Steps live in skills/<name>/SKILL.md (loaded on demand, never pasted here).
- If the play grows new branches, split it: propose a new workflow, don't bloat this one.
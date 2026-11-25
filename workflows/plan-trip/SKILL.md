---
name: plan-trip
description: "Plan a complete trip from idea to packed bag. Use for any vacation."
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: travel
  version: 1.0.0
  author: hornet-swarm
  kind: workflow
  triggers: "planning a vacation, trip from scratch"
  steps: "trip-plan, itinerary-builder, budget-travel, packing-list, travel-safety"
---

## What I do

- day-by-day plan
- packing list
- budget and safety

This is a workflow: I play 5 skills in order, carrying each step's output into the next. Do not skip steps; each gate exists for a reason.

## When to use me

Use when:

- planning a vacation
- trip from scratch

Don't use when:

- You only need one of the steps below - load that skill directly instead.
- The situation changed mid-play - stop, restate, and re-plan rather than forcing the sequence.

## Workflow

The play, in order:

| # | Skill | Job | Handoff |
|---|---|---|---|
| 1 | `trip-plan` | Plan a complete trip from budget to bookings with day-by-day flow. Use when starting any vacation or work trip. | artifact feeds step 2 |
| 2 | `itinerary-builder` | Turn must-sees into a timed daily itinerary with buffers. Use when the destination is decided. | artifact feeds step 3 |
| 3 | `budget-travel` | Cut trip costs with swaps that keep the experience. Use when the trip must cost less. | artifact feeds step 4 |
| 4 | `packing-list` | Build a trip-specific packing list by weather, activities, and bag size. Use before any trip. | artifact feeds step 5 |
| 5 | `travel-safety` | Build a safety plan with document backup, scams, health, and contacts. Use before unfamiliar destinations. | artifact feeds step 6 |

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
## Trip: <place> — plan, pack, budget, safety
- Steps run: <names in order>
- Step artifacts: <one line each>
- Confidence: <high/medium/low + what would raise it>
```

## References

- Steps live in skills/<name>/SKILL.md (loaded on demand, never pasted here).
- If the play grows new branches, split it: propose a new workflow, don't bloat this one.
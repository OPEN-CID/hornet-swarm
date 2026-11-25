---
name: buy-and-move
description: "Buy and move into a home from search to settled. Use for house hunters."
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: housing
  version: 1.0.0
  author: hornet-swarm
  kind: workflow
  triggers: "house hunting, buying a home"
  steps: "buy-home, home-inspect, mortgage-basics, moving-checklist"
---

## What I do

- offer accepted
- clean inspection
- moved in

This is a workflow: I play 4 skills in order, carrying each step's output into the next. Do not skip steps; each gate exists for a reason.

## When to use me

Use when:

- house hunting
- buying a home

Don't use when:

- You only need one of the steps below - load that skill directly instead.
- The situation changed mid-play - stop, restate, and re-plan rather than forcing the sequence.

## Workflow

The play, in order:

| # | Skill | Job | Handoff |
|---|---|---|---|
| 1 | `buy-home` | Buy a home with affordability math and offer strategy. Use when house hunting. | artifact feeds step 2 |
| 2 | `home-inspect` | Inspect a home like a pro with systems checklist. Use before offers. | artifact feeds step 3 |
| 3 | `mortgage-basics` | Understand mortgages with types, rates, and total cost. Use before talking to lenders. Educational. | artifact feeds step 4 |
| 4 | `moving-checklist` | Plan a move with timeline, boxes, and address changes. Use when relocating. | artifact feeds step 5 |

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
## Home: <address> — searched to moved
- Steps run: <names in order>
- Step artifacts: <one line each>
- Confidence: <high/medium/low + what would raise it>
```

## References

- Steps live in skills/<name>/SKILL.md (loaded on demand, never pasted here).
- If the play grows new branches, split it: propose a new workflow, don't bloat this one.
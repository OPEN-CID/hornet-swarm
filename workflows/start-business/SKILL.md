---
name: start-business
description: "Launch a business from idea to first paying customer. Use for founders."
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: business-ops
  version: 1.0.0
  author: hornet-swarm
  kind: workflow
  triggers: "founding something, first paying customer"
  steps: "idea-validate, business-plan, llc-start, marketing-copy"
---

## What I do

- validated idea
- legal entity
- first sale

This is a workflow: I play 4 skills in order, carrying each step's output into the next. Do not skip steps; each gate exists for a reason.

## When to use me

Use when:

- founding something
- first paying customer

Don't use when:

- You only need one of the steps below - load that skill directly instead.
- The situation changed mid-play - stop, restate, and re-plan rather than forcing the sequence.

## Workflow

The play, in order:

| # | Skill | Job | Handoff |
|---|---|---|---|
| 1 | `idea-validate` | Stress-test startup ideas with customers and numbers. Use before building anything. | artifact feeds step 2 |
| 2 | `business-plan` | Draft lean business plans with unit economics. Use when pitching or planning. | artifact feeds step 3 |
| 3 | `llc-start` | Form an LLC with state steps and operating basics. Use for new businesses. Lawyer for specifics. | artifact feeds step 4 |
| 4 | `marketing-copy` | Write landing pages and ads that convert. Use for launches and campaigns. | artifact feeds step 5 |

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
## Open: <business> — idea to first sale
- Steps run: <names in order>
- Step artifacts: <one line each>
- Confidence: <high/medium/low + what would raise it>
```

## References

- Steps live in skills/<name>/SKILL.md (loaded on demand, never pasted here).
- If the play grows new branches, split it: propose a new workflow, don't bloat this one.
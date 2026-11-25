---
name: college-application
description: "Apply to college with essays, interviews, and funding. Use for admissions season."
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: education
  version: 1.0.0
  author: hornet-swarm
  kind: workflow
  triggers: "admissions season"
  steps: "college-apps, essay-feedback, interview-prep, scholarship-search"
---

## What I do

- submitted apps
- strong essays
- funding plan

This is a workflow: I play 4 skills in order, carrying each step's output into the next. Do not skip steps; each gate exists for a reason.

## When to use me

Use when:

- admissions season

Don't use when:

- You only need one of the steps below - load that skill directly instead.
- The situation changed mid-play - stop, restate, and re-plan rather than forcing the sequence.

## Workflow

The play, in order:

| # | Skill | Job | Handoff |
|---|---|---|---|
| 1 | `college-apps` | Apply to colleges with lists, essays, and deadlines. Use for admissions. | artifact feeds step 2 |
| 2 | `essay-feedback` | Critique essays for thesis, structure, and evidence. Use when revising writing. | artifact feeds step 3 |
| 3 | `interview-prep` | Run mock interviews with STAR feedback. Use before real interviews. | artifact feeds step 4 |
| 4 | `scholarship-search` | Win scholarships with matches and reusable essays. Use for college funding. | artifact feeds step 5 |

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
## Admitted: <school> — applied and funded
- Steps run: <names in order>
- Step artifacts: <one line each>
- Confidence: <high/medium/low + what would raise it>
```

## References

- Steps live in skills/<name>/SKILL.md (loaded on demand, never pasted here).
- If the play grows new branches, split it: propose a new workflow, don't bloat this one.
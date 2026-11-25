---
name: ace-exam
description: "Pass exams with prep, mocks, and readiness proof. Use before test day."
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: education
  version: 1.0.0
  author: hornet-swarm
  kind: workflow
  triggers: "upcoming exams, test day"
  steps: "exam-prep, practice-test-maker, exam-readiness-review"
---

## What I do

- coverage done
- mock scores
- test-day plan

This is a workflow: I play 3 skills in order, carrying each step's output into the next. Do not skip steps; each gate exists for a reason.

## When to use me

Use when:

- upcoming exams
- test day

Don't use when:

- You only need one of the steps below - load that skill directly instead.
- The situation changed mid-play - stop, restate, and re-plan rather than forcing the sequence.

## Workflow

The play, in order:

| # | Skill | Job | Handoff |
|---|---|---|---|
| 1 | `exam-prep` | Build an exam study plan with spaced practice tests. Use before any exam. | artifact feeds step 2 |
| 2 | `practice-test-maker` | Turn any chapter into a timed mock test with answer key. Use for exam prep. | artifact feeds step 3 |
| 3 | `exam-readiness-review` | Audit exam readiness with a timed mock and gap list. Use one week before any exam. | artifact feeds step 4 |

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
## Passed: <exam> — prepped and calm
- Steps run: <names in order>
- Step artifacts: <one line each>
- Confidence: <high/medium/low + what would raise it>
```

## References

- Steps live in skills/<name>/SKILL.md (loaded on demand, never pasted here).
- If the play grows new branches, split it: propose a new workflow, don't bloat this one.
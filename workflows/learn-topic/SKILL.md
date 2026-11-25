---
name: learn-topic
description: "Master any topic from syllabus to exam pass. Use for serious learning."
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: education
  version: 1.0.0
  author: hornet-swarm
  kind: workflow
  triggers: "serious learning, mastering a topic"
  steps: "curriculum-plan, study-doc-parse, practice-test-maker, exam-prep"
---

## What I do

- study plan
- practice reps
- exam pass

This is a workflow: I play 4 skills in order, carrying each step's output into the next. Do not skip steps; each gate exists for a reason.

## When to use me

Use when:

- serious learning
- mastering a topic

Don't use when:

- You only need one of the steps below - load that skill directly instead.
- The situation changed mid-play - stop, restate, and re-plan rather than forcing the sequence.

## Workflow

The play, in order:

| # | Skill | Job | Handoff |
|---|---|---|---|
| 1 | `curriculum-plan` | Design a self-study syllabus with milestones. Use when learning a subject solo. | artifact feeds step 2 |
| 2 | `study-doc-parse` | Turn textbook chapters or PDFs into notes, key terms, and self-test questions. Use when reading dense material. | artifact feeds step 3 |
| 3 | `practice-test-maker` | Turn any chapter into a timed mock test with answer key. Use for exam prep. | artifact feeds step 4 |
| 4 | `exam-prep` | Build an exam study plan with spaced practice tests. Use before any exam. | artifact feeds step 5 |

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
## Learned: <topic> — plan to pass
- Steps run: <names in order>
- Step artifacts: <one line each>
- Confidence: <high/medium/low + what would raise it>
```

## References

- Steps live in skills/<name>/SKILL.md (loaded on demand, never pasted here).
- If the play grows new branches, split it: propose a new workflow, don't bloat this one.
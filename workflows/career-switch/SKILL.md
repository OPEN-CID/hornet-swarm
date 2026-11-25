---
name: career-switch
description: "Switch careers with skills, proof, and network. Use for pivots."
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: career
  version: 1.0.0
  author: hornet-swarm
  kind: workflow
  triggers: "career pivots, changing fields"
  steps: "career-playbook, curriculum-plan, resume-writer, networking-guide"
---

## What I do

- skill plan
- proof of work
- warm intros

This is a workflow: I play 4 skills in order, carrying each step's output into the next. Do not skip steps; each gate exists for a reason.

## When to use me

Use when:

- career pivots
- changing fields

Don't use when:

- You only need one of the steps below - load that skill directly instead.
- The situation changed mid-play - stop, restate, and re-plan rather than forcing the sequence.

## Workflow

The play, in order:

| # | Skill | Job | Handoff |
|---|---|---|---|
| 1 | `career-playbook` | Career-growth best practices for steady advancement. Use for yearly planning. | artifact feeds step 2 |
| 2 | `curriculum-plan` | Design a self-study syllabus with milestones. Use when learning a subject solo. | artifact feeds step 3 |
| 3 | `resume-writer` | Tailor resumes to job posts with measurable impact. Use when applying for jobs. | artifact feeds step 4 |
| 4 | `networking-guide` | Network genuinely with follow-ups that help others first. Use for career events. | artifact feeds step 5 |

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
## Switched: <field> — skilled and hired
- Steps run: <names in order>
- Step artifacts: <one line each>
- Confidence: <high/medium/low + what would raise it>
```

## References

- Steps live in skills/<name>/SKILL.md (loaded on demand, never pasted here).
- If the play grows new branches, split it: propose a new workflow, don't bloat this one.
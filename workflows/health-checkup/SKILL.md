---
name: health-checkup
description: "Do an annual health review with data and tune-ups. Use once a year. Info only; doctors decide."
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: medical-health
  version: 1.0.0
  author: hornet-swarm
  kind: workflow
  triggers: "annual review, yearly health check"
  steps: "med-symptom-triage, med-lab-reader, nutrition-plan, sleep-improve"
---

## What I do

- health snapshot
- lab questions
- tune-up plan

This is a workflow: I play 4 skills in order, carrying each step's output into the next. Do not skip steps; each gate exists for a reason.

## When to use me

Use when:

- annual review
- yearly health check

Don't use when:

- You only need one of the steps below - load that skill directly instead.
- The situation changed mid-play - stop, restate, and re-plan rather than forcing the sequence.

## Workflow

The play, in order:

| # | Skill | Job | Handoff |
|---|---|---|---|
| 1 | `med-symptom-triage` | Organize symptoms into a clear timeline summary for a clinician visit. Use when preparing for a doctor appointment. Information only, never a diagnosis. | artifact feeds step 2 |
| 2 | `med-lab-reader` | Explain lab results in plain language with questions to ask. Use when reviewing bloodwork or test reports. Information only. | artifact feeds step 3 |
| 3 | `nutrition-plan` | Plan balanced meals around budget and restrictions. Use when meal planning for health goals. General information, not medical advice. | artifact feeds step 4 |
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
## Healthy: <year> — checked and tuned
- Steps run: <names in order>
- Step artifacts: <one line each>
- Confidence: <high/medium/low + what would raise it>
```

## References

- Steps live in skills/<name>/SKILL.md (loaded on demand, never pasted here).
- If the play grows new branches, split it: propose a new workflow, don't bloat this one.
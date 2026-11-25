---
name: onboard-hire
description: "Onboard a new hire to productive in 30 days. Use for every new team member."
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: productivity
  version: 1.0.0
  author: hornet-swarm
  kind: workflow
  triggers: "new hire starting, onboarding someone"
  steps: "hiring-interview, onboarding-plan, repo-onboarder, meeting-notes"
---

## What I do

- 30-60-90 plan
- buddy assigned
- first win

This is a workflow: I play 4 skills in order, carrying each step's output into the next. Do not skip steps; each gate exists for a reason.

## When to use me

Use when:

- new hire starting
- onboarding someone

Don't use when:

- You only need one of the steps below - load that skill directly instead.
- The situation changed mid-play - stop, restate, and re-plan rather than forcing the sequence.

## Workflow

The play, in order:

| # | Skill | Job | Handoff |
|---|---|---|---|
| 1 | `hiring-interview` | Design structured interviews with scorecards. Use when hiring. | artifact feeds step 2 |
| 2 | `onboarding-plan` | Build 30-60-90 onboarding for new hires. Use for every new role. | artifact feeds step 3 |
| 3 | `repo-onboarder` | Onboard anyone to a repo with setup, tour, and first task. Use when a new dev or agent joins a codebase. | artifact feeds step 4 |
| 4 | `meeting-notes` | Turn meetings into decisions, owners, and dated actions. Use for any meeting worth remembering. | artifact feeds step 5 |

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
## Onboarded: <hire> — 30-60-90, buddy, first win
- Steps run: <names in order>
- Step artifacts: <one line each>
- Confidence: <high/medium/low + what would raise it>
```

## References

- Steps live in skills/<name>/SKILL.md (loaded on demand, never pasted here).
- If the play grows new branches, split it: propose a new workflow, don't bloat this one.
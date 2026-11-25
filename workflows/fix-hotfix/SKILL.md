---
name: fix-hotfix
description: "Fix bugs with diagnosis, minimal fix, and regression proof. Use for any defect."
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: software-build
  version: 1.0.0
  author: hornet-swarm
  kind: workflow
  triggers: "fixing a bug, production defect"
  steps: "debugging, test-generator, code-review, pr-create"
---

## What I do

- root cause
- minimal fix
- regression test

This is a workflow: I play 4 skills in order, carrying each step's output into the next. Do not skip steps; each gate exists for a reason.

## When to use me

Use when:

- fixing a bug
- production defect

Don't use when:

- You only need one of the steps below - load that skill directly instead.
- The situation changed mid-play - stop, restate, and re-plan rather than forcing the sequence.

## Workflow

The play, in order:

| # | Skill | Job | Handoff |
|---|---|---|---|
| 1 | `debugging` | Diagnose bugs systematically with reproduction, hypothesis, and fix verification. Use when investigating any error, failure, or unexpected behavior. | artifact feeds step 2 |
| 2 | `test-generator` | Generate focused unit, integration, and e2e tests with clear arrange-act-assert. Use when adding tests for new or uncovered code. | artifact feeds step 3 |
| 3 | `code-review` | Perform thorough actionable code reviews with severity-ranked findings. Use when reviewing a diff, PR, or uncommitted changes. | artifact feeds step 4 |
| 4 | `pr-create` | Open focused reviewable pull requests with context and test proof. Use when the branch is ready for review or merge. | artifact feeds step 5 |

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
## Fixed: <bug> — cause, fix, regression test
- Steps run: <names in order>
- Step artifacts: <one line each>
- Confidence: <high/medium/low + what would raise it>
```

## References

- Steps live in skills/<name>/SKILL.md (loaded on demand, never pasted here).
- If the play grows new branches, split it: propose a new workflow, don't bloat this one.
---
name: ship-feature
description: "Ship a feature from branch to merged PR with tests and review. Use when building anything shippable."
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: software-build
  version: 1.0.0
  author: hornet-swarm
  kind: workflow
  triggers: "building a feature, shipping code"
  steps: "git-branch, task-planner, tdd-workflow, test-generator, code-review, pr-create"
---

## What I do

- scoped branch
- tested code
- reviewed PR

This is a workflow: I play 6 skills in order, carrying each step's output into the next. Do not skip steps; each gate exists for a reason.

## When to use me

Use when:

- building a feature
- shipping code

Don't use when:

- You only need one of the steps below - load that skill directly instead.
- The situation changed mid-play - stop, restate, and re-plan rather than forcing the sequence.

## Workflow

The play, in order:

| # | Skill | Job | Handoff |
|---|---|---|---|
| 1 | `git-branch` | Manage clean focused branches with safe sync and naming. Use when starting work, switching context, or cleaning up branches. | artifact feeds step 2 |
| 2 | `task-planner` | Turn vague goals into ordered tasks with owners and done-criteria. Use when starting any multi-step project. | artifact feeds step 3 |
| 3 | `tdd-workflow` | Drive development red-green-refactor in tiny verifiable loops. Use when building features test-first or fixing bugs with regression proof. | artifact feeds step 4 |
| 4 | `test-generator` | Generate focused unit, integration, and e2e tests with clear arrange-act-assert. Use when adding tests for new or uncovered code. | artifact feeds step 5 |
| 5 | `code-review` | Perform thorough actionable code reviews with severity-ranked findings. Use when reviewing a diff, PR, or uncommitted changes. | artifact feeds step 6 |
| 6 | `pr-create` | Open focused reviewable pull requests with context and test proof. Use when the branch is ready for review or merge. | artifact feeds step 7 |

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
## Shipped: <feature> — branch, tests, review, PR link
- Steps run: <names in order>
- Step artifacts: <one line each>
- Confidence: <high/medium/low + what would raise it>
```

## References

- Steps live in skills/<name>/SKILL.md (loaded on demand, never pasted here).
- If the play grows new branches, split it: propose a new workflow, don't bloat this one.
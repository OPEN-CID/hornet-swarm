---
name: migrate-database
description: "Migrate databases with zero-surprise cutover. Use for moves."
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: data-pipeline
  version: 1.0.0
  author: hornet-swarm
  kind: workflow
  triggers: "database moves, migrations"
  steps: "db-migration, data-quality-check, deploy-checklist"
---

## What I do

- migration run
- quality checks
- clean cutover

This is a workflow: I play 3 skills in order, carrying each step's output into the next. Do not skip steps; each gate exists for a reason.

## When to use me

Use when:

- database moves
- migrations

Don't use when:

- You only need one of the steps below - load that skill directly instead.
- The situation changed mid-play - stop, restate, and re-plan rather than forcing the sequence.

## Workflow

The play, in order:

| # | Skill | Job | Handoff |
|---|---|---|---|
| 1 | `db-migration` | Write safe reversible database migrations with backfill plans. Use when changing schema, adding indexes, or backfilling data. | artifact feeds step 2 |
| 2 | `data-quality-check` | Define freshness, schema, and anomaly checks. Use when data breaks trust. | artifact feeds step 3 |
| 3 | `deploy-checklist` | Ship safely with preflight checks, rollout steps, and rollback. Use before any production deploy or release rollout. | artifact feeds step 4 |

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
## Migrated: <db> — moved and verified
- Steps run: <names in order>
- Step artifacts: <one line each>
- Confidence: <high/medium/low + what would raise it>
```

## References

- Steps live in skills/<name>/SKILL.md (loaded on demand, never pasted here).
- If the play grows new branches, split it: propose a new workflow, don't bloat this one.
---
name: db-migration
description: Write safe reversible database migrations with backfill plans. Use when changing schema, adding indexes, or backfilling data.
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: software-build
  version: 0.1.0
  author: hornet-swarm
---

## What I do

- Author up/down migrations with explicit transactions and index strategy
- Plan zero-downtime deploys (expand-migrate-contract) and backfills
- List rollback steps and data-loss risks before anything runs

## When to use me

Use when:

- Changing schema, adding indexes, or backfilling data
- Reviewing a migration for production safety

Don't use when:

- Writing ad-hoc analytics queries (use `sql-query`)

## Workflow

1. **Inspect** — read current schema, row-count estimates, and deploy pipeline. Identify locks the migration may take.
2. **Plan** — choose expand-migrate-contract steps for renames/type changes; decide online vs lock, batch size for backfills. Ask about downtime tolerance.
3. **Execute** — write `up` (with `IF NOT EXISTS` where supported) and `down`; batch backfills with progress logging.
4. **Verify** — dry-run on a copy, show `up` + `down` + rollback command; state lock/time risk.

## Rules / Constraints

- MUST: every migration has a tested `down`/rollback path.
- MUST: batch large backfills; never load full tables into memory.
- MUST NOT: run destructive changes (drop/rename/type-narrow) without explicit confirmation and backup note.

## Output format

```markdown
## Migration: <name>
- Up: <file/statement> | Down: <file/statement>
- Backfill: batches of <N>, progress log yes/no
- Risk: locks <x>, est. time <y>, rollback: <command>
```

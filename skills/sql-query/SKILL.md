---
name: sql-query
description: Write correct parameterized SQL with joins, aggregates, and EXPLAIN checks. Use when querying or changing relational data.
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: data-ai
  version: 1.0.0
  author: hornet-swarm
---

## What I do

- Write SELECTs with explicit columns, correct JOINs, and window/aggregate logic
- Parameterize every input; handle NULLs, timezones, and pagination explicitly
- Verify with EXPLAIN and a row-count sanity check before calling it done

## When to use me

Use when:

- Querying or changing relational data, building reports or exports
- Debugging a slow or wrong query

Don't use when:

- Designing the pipeline around the query (use `etl-pipeline`)
- Choosing what the business question means (use `query-translate`)

## Workflow

1. **Inspect** — read the schema (`\d table`, `DESCRIBE`, or migration files). Confirm keys, types, nullability, and volume. Restate the question in your own words.
2. **Plan** — sketch: tables → joins → filters → grouping → ordering → limit. Decide read-only vs write; writes need a transaction + backup note.
3. **Execute** — write the query with named parameters (`$1`, `:name`), never string-concatenated values. SELECT before UPDATE/DELETE with the same WHERE.
4. **Verify** — run EXPLAIN, check the plan uses indexes; compare row counts against an independent count; show 5 sample rows.

## Rules / Constraints

- MUST: parameterize all inputs; explicit column lists, no `SELECT *` in production code.
- MUST: preview writes with SELECT first; destructive statements need confirmation.
- MUST NOT: run unbounded queries on production; always LIMIT while exploring.

## Output format

```sql
-- purpose: <one line> | tables: <list> | est. rows: <n>
SELECT ... FROM ... WHERE ... -- params: [...]
-- plan: <index scan / seq scan + why ok> | sample: <5 rows>
```

---
name: data-clean
description: Profile and clean messy datasets with auditable rules. Use when data has nulls, duplicates, or inconsistent formats.
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: data-ai
  version: 1.0.0
  author: hornet-swarm
---

## What I do

- Profile first: nulls, duplicates, distributions, outliers, encoding issues
- Apply explicit cleaning rules, one per commit/step, with before/after counts
- Preserve raw data untouched; output cleaned copy plus a cleaning log

## When to use me

Use when:

- Data has nulls, duplicates, mixed formats, or suspect values
- Preparing a dataset for analysis or model training

Don't use when:

- The schema itself is unknown (use `data-doc-parse` first)

## Workflow

1. **Inspect** — profile: row count, per-column null %, distinct counts, min/max, top outliers. Never clean blind.
2. **Plan** — write cleaning rules as decisions: drop vs impute nulls, dedupe keys, canonical formats, outlier caps. Confirm destructive choices.
3. **Execute** — one rule at a time on a copy; log rows affected per rule.
4. **Verify** — re-profile after cleaning; show before/after table and the replayable script.

## Rules / Constraints

- MUST: never modify the raw source; cleaning is a replayable script.
- MUST: log every rule with rows affected; imputation must be labeled.
- MUST NOT: silently drop outliers or rows — report them.

## Output format

```markdown
## Clean report: <dataset>
| Rule | Rows affected | Reason |
Re-profile: nulls x%→y%, dupes N→M | Script: <path/command>
```

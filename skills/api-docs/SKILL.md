---
name: api-docs
description: Write accurate API references with examples from real code. Use when documenting endpoints, SDKs, or modules.
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: docs-research
  version: 0.1.0
  author: hornet-swarm
---

## What I do

- Document endpoints/functions with params, types, defaults, and errors
- Add copy-pasteable request/response examples verified against code
- Note auth, rate limits, and versioning behavior

## When to use me

Use when:

- Documenting endpoints, SDKs, or modules
- Consumers report the API is hard to use correctly

Don't use when:

- Designing the contract from scratch (use `api-design`)

## Workflow

1. **Inspect** — read routes/handlers/schemas and one real client call. Record actual field names and status codes.
2. **Plan** — outline per surface: signature, params table, examples, errors, notes. Confirm audience (internal/external).
3. **Execute** — write one example per operation (happy path + one error); keep snippets runnable.
4. **Verify** — cross-check every field against source `file:line`; mark anything unverified.

## Rules / Constraints

- MUST: examples match real code; cite source files.
- MUST: document errors and auth requirements, not just happy paths.
- MUST NOT: invent fields, codes, or limits.

## Output format

```markdown
## `METHOD /path` — <purpose> (`source: file:line`)
Params table + request/response code blocks + error table.
```

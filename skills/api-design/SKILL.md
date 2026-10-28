---
name: api-design
description: Design clean REST or RPC APIs with resources, schemas, and error contracts. Use when creating or changing any API endpoint or data contract.
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: software-build
  version: 0.1.0
  author: hornet-swarm
---

## What I do

- Define resources, routes, request/response schemas, and status codes
- Specify auth, pagination, filtering, versioning, and error envelopes
- Produce an OpenAPI sketch or contract table the team can implement against

## When to use me

Use when:

- Creating or changing any API endpoint or data contract
- Reviewing an inconsistent or undocumented API

Don't use when:

- Writing API reference docs from finished code (use `api-docs`)

## Workflow

1. **Inspect** — read existing routes, models, and clients. List current endpoints and pain points.
2. **Plan** — propose resource names (plural nouns), verbs, schemas, and error format. Ask about auth, pagination, and breaking-change tolerance if unclear.
3. **Execute** — write the contract: routes table + JSON schemas + error envelope + versioning rule.
4. **Verify** — walk one happy-path and one error-path example end to end; list open questions.

## Rules / Constraints

- MUST: use plural nouns for collections, version explicitly (`/v1`), never break existing clients silently.
- MUST: every endpoint defines success + error responses with examples.
- MUST NOT: leak internal models or stack traces in error contracts.

## Output format

```markdown
## Endpoints
| Method | Path | Auth | Description |
|---|---|---|---|
| GET | /v1/orders | bearer | list with pagination |

## Schemas
```json
{ "Order": { "id": "string", "total": 0 } }
```

## Errors
`{ "error": { "code": "not_found", "message": "..." } }`
```

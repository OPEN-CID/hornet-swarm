---
name: api-spec-parse
description: Parse OpenAPI specs and docs into client code and test lists. Use when integrating a third-party API.
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: software-build
  version: 1.0.0
  author: hornet-swarm
  triggers: integrating a third-party API
---

## What I do

- endpoint map
- client sketch
- gotcha list


## When to use me

Use when:

- integrating a third-party API

Don't use when:

- The request is outside this skill's job. Say so and point to the right skill if you know it.
- You lack the source material this task needs. Ask for it first instead of guessing.

## Workflow

1. Collect: ask the user to paste text or attach the file/image; if only part is available, work with that part and say so.
2. Extract: pull every required field into a table (Field | Value quoted | Source location). Mark illegible or missing fields as UNKNOWN, never guess.
3. Normalize: convert units, dates, and names to one consistent format; keep the original value beside each conversion.
4. Cross-check: flag conflicts between sections (totals vs line items, dates vs versions); list each conflict with both quotes.
5. Deliver: produce the artifact below plus a trace table so anyone can verify each value in seconds.

## Rules / Constraints

MUST: quote exact source values; mark UNKNOWN instead of guessing.
MUST: keep a source-to-field trace so every value is verifiable.
MUST NOT: invent missing pages, values, or signatures.

## Output format

```text
## Integration pack: endpoints used, client code, test list, gotchas
- Sources checked: <what you read>
- Confidence: <high/medium/low + what would raise it>
```

## References

- No extra files by default. If the task grows complex, split it: parse first, then review, then act.
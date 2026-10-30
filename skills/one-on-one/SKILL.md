---
name: one-on-one
description: Run 1:1s people value with agendas and career talk. Use weekly.
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: leadership
  version: 1.0.0
  author: hornet-swarm
  triggers: weekly 1:1s
---

## What I do

- agenda template
- question bank
- notes


## When to use me

Use when:

- weekly 1:1s

Don't use when:

- The request is outside this skill's job. Say so and point to the right skill if you know it.
- You lack the source material this task needs. Ask for it first instead of guessing.

## Workflow

1. Inspect: gather the real inputs first (files, numbers, constraints); restate what you found.
2. Plan: propose the approach and the definition of done; ask clarifying questions when ambiguous.
3. Execute: do the work in smallest verifiable steps, cheapest test first.
4. Verify: check the result against the definition of done; show evidence, not claims.

## Rules / Constraints

MUST: verify inputs before acting; smallest steps first.
MUST: show evidence for the result.
MUST NOT: invent sources, URLs, or data.

## Output format

```text
## 1:1: agenda and growth
- Sources checked: <what you read>
- Confidence: <high/medium/low + what would raise it>
```

## References

- No extra files by default. If the task grows complex, split it: parse first, then review, then act.
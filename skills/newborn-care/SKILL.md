---
name: newborn-care
description: Handle feeding, sleep, and soothing in the first weeks with logs. Use for newborns 0-3 months. Info only; pediatrician decides.
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: parenting
  version: 1.0.0
  author: hornet-swarm
---

## What I do

- log sheets
- soothing ladder
- red flags

> Family information only: for health or developmental concerns, consult your pediatrician or a qualified professional.


## When to use me

Use when:

- newborns 0-3 months

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
## Newborn week: logs, ladder, flags
- Sources checked: <what you read>
- Confidence: <high/medium/low + what would raise it>
```

## References

- No extra files by default. If the task grows complex, split it: parse first, then review, then act.
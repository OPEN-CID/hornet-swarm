---
name: pet-care
description: Build feeding, exercise, and vet schedules. Use for new or busy pet owners.
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: home-life
  version: 1.0.0
  author: hornet-swarm
---

## What I do

- daily care schedule
- vet calendar
- sitter handoff note


## When to use me

Use when:

- new pet or busy schedule

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
## Pet plan: feeding, walks, vet dates, sitter instructions
- Sources checked: <what you read>
- Confidence: <high/medium/low + what would raise it>
```

## References

- No extra files by default. If the task grows complex, split it: parse first, then review, then act.
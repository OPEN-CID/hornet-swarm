---
name: solo-travel
description: Plan a first solo trip with safety nets and social options. Use when traveling alone.
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: travel
  version: 1.0.0
  author: hornet-swarm
  triggers: traveling alone
---

## What I do

- safety nets
- stay picks
- social options


## When to use me

Use when:

- traveling alone

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
## Solo: <place> — nets, stays, meetups
- Sources checked: <what you read>
- Confidence: <high/medium/low + what would raise it>
```

## References

- No extra files by default. If the task grows complex, split it: parse first, then review, then act.
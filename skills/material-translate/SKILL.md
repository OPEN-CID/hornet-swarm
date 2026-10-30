---
name: material-translate
description: Decode lumber grades, fastener codes, and paint labels into what to buy. Use at the hardware store.
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: diy-maker
  version: 1.0.0
  author: hornet-swarm
  triggers: shopping at the hardware store
---

## What I do

- decoded shopping list
- substitution options
- waste allowance


## When to use me

Use when:

- shopping at the hardware store

Don't use when:

- The request is outside this skill's job. Say so and point to the right skill if you know it.
- You lack the source material this task needs. Ask for it first instead of guessing.

## Workflow

1. Audience: ask who it is for (age, background); match vocabulary and sentence length to them.
2. Plain version: rewrite the meaning with zero jargon, keeping every number and name exact.
3. Rebuild layers: add one layer of precision back (student, practitioner) so nothing is lost.
4. Glossary: term table with original, plain meaning, and why it matters.
5. Next questions: 3 questions the reader should now ask the expert, in their own words.

## Rules / Constraints

MUST: keep all numbers, names, and doses character-identical.
MUST: match reading level to the stated audience.
MUST NOT: drop warnings, risks, or side effects while simplifying.

## Output format

```text
## Buy list decoded: grade, size, count + cheaper alternative
- Sources checked: <what you read>
- Confidence: <high/medium/low + what would raise it>
```

## References

- No extra files by default. If the task grows complex, split it: parse first, then review, then act.
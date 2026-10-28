---
name: query-translate
description: Turn business questions into query plans and SQL sketches. Use when stakeholders ask for numbers.
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: data-pipeline
  version: 1.0.0
  author: hornet-swarm
---

## What I do

- restated question
- table map
- SQL sketch

## When to use me

Use when:

- stakeholders asking for numbers

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

``text
## Query plan: plain question, tables needed, SQL sketch, check
- Sources checked: <what you read>
- Confidence: <high/medium/low + what would raise it>
``

## References

- No extra files by default. If the task grows complex, split it: parse first, then review, then act.

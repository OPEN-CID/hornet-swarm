---
name: biz-jargon-translate
description: Translate investor, legal, and finance jargon for founders. Use when term sheets or metrics confuse.
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: business-ops
  version: 1.0.0
  author: hornet-swarm
---

## What I do

- plain translations
- implication notes
- questions to ask back

## When to use me

Use when:

- confusing term sheets or metrics

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
## Decoded: term, what it really means, what to ask back
- Sources checked: <what you read>
- Confidence: <high/medium/low + what would raise it>
``

## References

- No extra files by default. If the task grows complex, split it: parse first, then review, then act.

---
name: legal-jargon-translate
description: Translate legal clauses into plain obligations. Use when a contract paragraph makes no sense. Not legal advice.
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: legal-finance
  version: 1.0.0
  author: hornet-swarm
---

## What I do

- plain obligation
- risk flag
- ask-a-lawyer note

> General information only: not legal, tax, or financial advice. Confirm consequential decisions with a licensed professional.


## When to use me

Use when:

- unreadable contract paragraphs

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
## Clause in plain words: obligation, risk, ask-a-lawyer flag
- Sources checked: <what you read>
- Confidence: <high/medium/low + what would raise it>
```

## References

- No extra files by default. If the task grows complex, split it: parse first, then review, then act.

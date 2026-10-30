---
name: workshop-playbook
description: Workshop safety and tool-care best practices. Use when setting up or leveling up a shop.
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: diy-maker
  version: 1.0.0
  author: hornet-swarm
  triggers: setting up a workshop
---

## What I do

- safety rules
- maintenance schedule
- layout guide


## When to use me

Use when:

- setting up a workshop

Don't use when:

- The request is outside this skill's job. Say so and point to the right skill if you know it.
- You lack the source material this task needs. Ask for it first instead of guessing.

## Workflow

1. Principles: state the 3-5 rules experts follow and why each one pays off.
2. Starter routine: give the smallest weekly/daily loop a beginner can run from today.
3. Do / Don't: concrete behaviors with examples, not slogans.
4. Anti-patterns: the 3 common failure modes, how to spot each, and the escape move.
5. Adopt: first-30-days plan with one measurable check per week.

## Rules / Constraints

MUST: every principle has a concrete example.
MUST: include a starter routine runnable this week.
MUST NOT: generic motivation with no actionable steps.

## Output format

```text
## Shop rules: PPE, tool care, layout, first-aid, mistake log
- Sources checked: <what you read>
- Confidence: <high/medium/low + what would raise it>
```

## References

- No extra files by default. If the task grows complex, split it: parse first, then review, then act.
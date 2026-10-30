---
name: arch-playbook
description: Architecture best practices for evolvable systems. Use when setting engineering standards.
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: company-arch
  version: 1.0.0
  author: hornet-swarm
  triggers: setting engineering standards
---

## What I do

- principle set
- standard templates
- ADR backlog


## When to use me

Use when:

- setting engineering standards

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
## Standards: decoupling, contracts, evolvability + ADRs to write
- Sources checked: <what you read>
- Confidence: <high/medium/low + what would raise it>
```

## References

- No extra files by default. If the task grows complex, split it: parse first, then review, then act.
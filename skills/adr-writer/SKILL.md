---
name: adr-writer
description: Record architecture decisions with context, options, and consequences. Use when choosing frameworks, patterns, or data models.
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: docs-research
  version: 0.1.0
  author: hornet-swarm
---

## What I do

- Capture context, decision drivers, considered options with trade-offs
- Record the decision, consequences, and migration/rollback notes
- Keep one decision per short dated record

## When to use me

Use when:

- Choosing frameworks, patterns, data models, or vendors
- Revisiting a past decision that needs rationale

Don't use when:

- The choice is trivial or easily reversible (just do it)

## Workflow

1. **Inspect** — read the problem, constraints, and current code. List drivers (scale, team, cost, risk).
2. **Plan** — compare 2-3 options in a trade-off table; ask about hidden constraints if the winner is unclear.
3. **Execute** — write the ADR: status, context, decision, alternatives, consequences, follow-ups.
4. **Verify** — confirm the record answers: what, why, what-else, what-next.

## Rules / Constraints

- MUST: one decision per ADR; dated with status (proposed/accepted/superseded).
- MUST: record rejected options and why, plus reversibility cost.
- MUST NOT: write implementation steps here — link the plan instead.

## Output format

```markdown
# ADR-<N>: <decision> (status: proposed|accepted, date: YYYY-MM-DD)
## Context / Options (table) / Decision / Consequences / Follow-ups
```

---
name: tech-research
description: Compare options with evidence and give a justified recommendation. Use when choosing libraries, tools, or approaches.
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: docs-research
  version: 0.1.0
  author: hornet-swarm
---

## What I do

- Frame requirements and constraints before comparing anything
- Evaluate 2-4 options on docs, maturity, cost, and fit with a scoring table
- Recommend one option with risks and a trial plan

## When to use me

Use when:

- Choosing libraries, tools, or approaches
- Validating a "we should use X" claim

Don't use when:

- The decision is recorded architecture (use `adr-writer` to record it)

## Workflow

1. **Inspect** — list must-haves vs nice-to-haves, scale/team/license constraints, and current stack.
2. **Plan** — shortlist 2-4 candidates; define scoring criteria and weights.
3. **Execute** — research each (official docs first): maturity, maintenance, cost, DX, risks. Build the comparison table.
4. **Verify** — recommend one with trial steps; state what would change the pick. Never invent URLs — only cite ones you verified.

## Rules / Constraints

- MUST: separate verified facts from opinions; cite real sources.
- MUST: include total cost (license + ops + learning), not just features.
- MUST NOT: fabricate benchmarks, URLs, or version claims.

## Output format

```markdown
## Recommendation: <option> (for <use case>)
| Criteria | A | B | Winner |
Risks: ... | Trial: <N steps> | If wrong: <fallback>
```

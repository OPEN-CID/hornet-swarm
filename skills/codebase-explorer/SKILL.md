---
name: codebase-explorer
description: Map unfamiliar codebases to entry points, flows, and ownership. Use when onboarding, scoping work, or finding where to change.
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: docs-research
  version: 0.1.0
  author: hornet-swarm
---

## What I do

- Produce a guided tour: layout, entry points, key flows, data ownership
- Answer "where does X happen" with `file:line` evidence
- Suggest the smallest safe change area for a task

## When to use me

Use when:

- Onboarding, scoping work, or finding where to change
- Estimating an unfamiliar repo

Don't use when:

- The change location is already known (go build it)

## Workflow

1. **Inspect** — survey manifests, top-level dirs, entry points, configs, and tests. Trace one core flow end to end.
2. **Plan** — pick the 3-5 concepts the user must learn first; note what to ignore for now.
3. **Execute** — write the map: layout table, entry points, request/job flow, data ownership, test strategy.
4. **Verify** — every claim has `file:line`; mark guesses as guesses.

## Rules / Constraints

- MUST: ground every statement in read files; no hallucinated modules.
- MUST: keep it tour-sized (one page), link deeper docs instead of pasting code.
- MUST NOT: refactor while exploring.

## Output format

```markdown
## Map: <repo>
- Layout table (dir → purpose) | Entry points | Core flow (N steps with file:line)
- Change here for <task>: `path` — because ...
```

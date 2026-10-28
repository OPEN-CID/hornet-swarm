---
name: repo-onboarder
description: Onboard anyone to a repo with setup, tour, and first task. Use when a new dev or agent joins a codebase.
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: meta
  version: 1.0.0
  author: hornet-swarm
---

## What I do

- Verify setup end-to-end: clone, install, test, run
- Give a guided tour: layout, entry points, key flows with `file:line`
- Assign a first scoped task with a buddy and a definition of done

## When to use me

Use when:

- A new developer or agent joins a codebase
- Setup docs are suspected stale

Don't use when:

- Mapping code without onboarding intent (use `codebase-explorer`)

## Workflow

1. **Inspect** — follow the setup docs literally on a clean checkout; note every deviation or missing step.
2. **Plan** — tour order: run it → break it (one test) → trace one request → read the map.
3. **Execute** — fix setup docs as you go; write the tour with verified commands and file pointers.
4. **Verify** — new setup completes from your notes alone; first task is scoped to ≤1 day with done-criteria.

## Rules / Constraints

- MUST: every setup command verified by running it, not by reading it.
- MUST: first task shippable in a day with a reviewer assigned.
- MUST NOT: hand over stale docs — fix them in the same pass.

## Output format

```markdown
## Onboarding: <repo>
- Setup: <commands, verified> | Tour: <5 stops with file:line>
- First task: <scope> — done: <criteria> — buddy: <who>
```

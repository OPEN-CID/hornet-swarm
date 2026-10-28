---
name: qa-checklist
description: Run release-ready quality gates across function, UX, and rollout. Use before any release, merge to main, or demo.
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: quality-testing
  version: 0.1.0
  author: hornet-swarm
---

## What I do

- Verify function, data migration, UX states, performance, and rollback readiness
- Produce a go/no-go checklist with evidence per item
- Catch release-blockers before users do

## When to use me

Use when:

- Before any release, merge to main, or customer demo
- Defining acceptance criteria for a feature

Don't use when:

- Reviewing a single diff in progress (use `code-review`)

## Workflow

1. **Inspect** — read the release scope, migration notes, and test results. List user-facing changes.
2. **Plan** — build the checklist: install/upgrade, happy paths, edge/empty/error states, perf smoke, rollback.
3. **Execute** — walk each item in a clean environment; record PASS/FAIL with commands and screenshots where relevant.
4. **Verify** — verdict go/no-go with blocker list and rollback command ready.

## Rules / Constraints

- MUST: test upgrade/migration path, not just fresh install.
- MUST: every FAIL has repro steps and severity.
- MUST NOT: sign off with untested rollback.

## Output format

```markdown
## QA verdict: <GO | NO-GO>
- [x] <check> — evidence: <command/output>
- [ ] <check> — FAIL: <repro + severity>
- Rollback: <command>
```

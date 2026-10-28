---
name: deploy-checklist
description: Ship safely with preflight checks, rollout steps, and rollback. Use before any production deploy or release rollout.
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: devops-infra
  version: 0.1.0
  author: hornet-swarm
---

## What I do

- Verify migrations, flags, monitors, and rollback before shipping
- Define rollout steps (canary → full) with health signals
- Produce a go/no-go with an explicit abort command

## When to use me

Use when:

- Before any production deploy or release rollout
- After a failed deploy needs a safer retry plan

Don't use when:

- Writing release notes (use `changelog-release`)

## Workflow

1. **Inspect** — read what changed, migration risk, flag states, dashboards, and last deploy outcome.
2. **Plan** — sequence: freeze → backup/snapshot → migrate → deploy → verify → full rollout. Define abort triggers.
3. **Execute** — write the checklist with owners, commands, and health URLs.
4. **Verify** — dry-run commands where safe; confirm rollback path is tested, not theoretical.

## Rules / Constraints

- MUST: every deploy has a tested rollback command and data-backup note.
- MUST: define abort triggers (error budget, latency, 5xx) in advance.
- MUST NOT: deploy untested migrations with code in one unverified step.

## Output format

```markdown
## Deploy verdict: <GO | NO-GO>
- Preflight: [ ] tests [ ] migration dry-run [ ] flags [ ] monitors
- Rollout: 1) ... 2) canary ... 3) full
- Rollback: <command> | Abort if: <signals>
```

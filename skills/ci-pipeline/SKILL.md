---
name: ci-pipeline
description: Build fast reliable CI with lint, test, and deploy gates. Use when creating or fixing continuous integration workflows.
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: devops-infra
  version: 0.1.0
  author: hornet-swarm
---

## What I do

- Scaffold staged pipelines: lint → test → build → deploy-gate
- Cache deps, pin actions, and keep main green in under 10 minutes
- Add branch protections and required checks guidance

## When to use me

Use when:

- Creating or fixing continuous integration workflows
- CI is slow, flaky, or missing gates before merge

Don't use when:

- Debugging a production incident (use `log-triage`)

## Workflow

1. **Inspect** — read existing workflows, test/lint/build commands, and deploy process. Find the slowest/flakiest stage.
2. **Plan** — stage order, triggers (PR vs main), matrix, caches, secrets needs. Confirm provider (GitHub Actions default).
3. **Execute** — write the workflow with pinned versions, concurrency cancels, and artifact/test reports.
4. **Verify** — explain how to test (push/act/dry-run) and what required checks to enable.

## Rules / Constraints

- MUST: pin third-party actions to SHAs or versions; least-privilege tokens.
- MUST: cache dependencies; fail fast on lint before slow tests.
- MUST NOT: print secrets in logs.

## Output format

```markdown
## CI: <provider/workflow path>
- Stages: lint → test → build → gate (each with command)
- Triggers/caching: ...
- Enable: branch protection + required check <name>
```

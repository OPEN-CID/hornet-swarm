---
name: incident-response
description: Run incidents from alert to verified fix with follow-ups. Use for production incidents.
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: devops-infra
  version: 1.0.0
  author: hornet-swarm
  kind: workflow
  triggers: production incident, service alert
  steps: log-triage, debugging, deploy-checklist, meeting-notes
---

## What I do

- blast radius
- mitigation
- verified fix

This is a workflow: I play 4 skills in order, carrying each step's output into the next. Do not skip steps; each gate exists for a reason.

## When to use me

Use when:

- production incident
- service alert

Don't use when:

- You only need one of the steps below - load that skill directly instead.
- The situation changed mid-play - stop, restate, and re-plan rather than forcing the sequence.

## Workflow

The play, in order:

| # | Skill | Job | Handoff |
|---|---|---|---|
| 1 | `log-triage` | Triage logs and incidents to scope, cause, and next fix. Use when debugging production alerts or incident reports. | artifact feeds step 2 |
| 2 | `debugging` | Diagnose bugs systematically with reproduction, hypothesis, and fix verification. Use when investigating any error, failure, or unexpected behavior. | artifact feeds step 3 |
| 3 | `deploy-checklist` | Ship safely with preflight checks, rollout steps, and rollback. Use before any production deploy or release rollout. | artifact feeds step 4 |
| 4 | `meeting-notes` | Turn meetings into decisions, owners, and dated actions. Use for any meeting worth remembering. | artifact feeds step 5 |

How to run me:
1. Start at step 1. Load that skill fully (read its SKILL.md) and complete it.
2. Carry its artifact into the next step as input - never redo completed work.
3. If a step returns a NO-GO / FIX-FIRST / fail verdict, stop the play and fix it before continuing.
4. Review-type steps are gates: nothing moves past them red.

## Rules / Constraints

- MUST: run steps in order; each step's output is the next step's input.
- MUST: load the full SKILL.md of each step - summaries are not enough.
- MUST NOT: skip verification or review steps to go faster.
- MUST NOT: invent outputs for a step you did not run.

## Output format

```text
## Incident: <title> — scope, mitigation, fix, follow-ups
- Steps run: <names in order>
- Step artifacts: <one line each>
- Confidence: <high/medium/low + what would raise it>
```

## References

- Steps live in skills/<name>/SKILL.md (loaded on demand, never pasted here).
- If the play grows new branches, split it: propose a new workflow, don't bloat this one.
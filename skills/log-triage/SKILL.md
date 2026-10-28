---
name: log-triage
description: Triage logs and incidents to scope, cause, and next fix. Use when debugging production alerts or incident reports.
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: devops-infra
  version: 0.1.0
  author: hornet-swarm
---

## What I do

- Scope blast radius: who/what/when from logs and metrics
- Extract timelines, top errors, and the most likely cause with evidence
- Recommend the next fix and what to monitor after

## When to use me

Use when:

- Debugging production alerts or incident reports
- Deciding whether an error spike is a real incident

Don't use when:

- The bug reproduces locally with no ops data (use `debugging`)

## Workflow

1. **Inspect** — gather: alert text, time window, error samples, deploy/migration timeline. Quote exact log lines.
2. **Plan** — group by signature; correlate errors with deploys/traffic; rank causes by evidence.
3. **Execute** — write timeline + top-3 error signatures + likely cause with supporting lines.
4. **Verify** — propose immediate mitigation, permanent fix, and follow-up monitors. Redact secrets/PII.

## Rules / Constraints

- MUST: quote real log lines with timestamps; no invented errors.
- MUST: redact tokens, PII, and secrets.
- MUST NOT: restart/destroy production resources without explicit approval.

## Output format

```markdown
## Incident: <title> (severity: <S1-S4>)
- Scope: <who/what/when> | Timeline: ...
- Top errors: `signature` × <count> — e.g. <log line>
- Likely cause: ... | Mitigate: ... | Fix: ...
```

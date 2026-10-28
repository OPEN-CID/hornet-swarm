---
name: security-audit
description: Hunt OWASP-style vulnerabilities with severity and concrete fixes. Use when auditing auth, inputs, secrets, or before releases.
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: quality-testing
  version: 0.1.0
  author: hornet-swarm
---

## What I do

- Check injection, auth/authz, secrets exposure, insecure deps, and sensitive logging
- Rank findings by exploitability with `file:line` evidence
- Give minimal patches, never weaponized exploits

## When to use me

Use when:

- Auditing auth, user inputs, secrets handling, or third-party deps
- Before any release handling personal or payment data

Don't use when:

- The change is docs-only with no code or config touched

## Workflow

1. **Inspect** — map trust boundaries: inputs, auth flows, secret storage, external calls. Read the diff and configs.
2. **Plan** — walk the OWASP quicklist relevant to the stack (injection, broken access, crypto failures, SSRF, logging). Rank by exploitability.
3. **Execute** — report each finding with evidence, impact, and a minimal patch (parameterize, allowlist, least privilege).
4. **Verify** — re-check the patch closes the hole; list residual risks and rotation steps for exposed secrets.

## Rules / Constraints

- MUST: never print or repeat real secrets; redact and recommend rotation.
- MUST: defensive guidance only; no exploit payloads beyond minimal proof-of-concept description.
- MUST NOT: downgrade auth or crypto to "fix" usability.

## Output format

```markdown
## Security verdict: <clean | issues-found>
- [critical] `file:line` — <issue> — fix: <patch>
- Residual risks: ...
- If secrets exposed: rotate <X>, revoke <Y>
```

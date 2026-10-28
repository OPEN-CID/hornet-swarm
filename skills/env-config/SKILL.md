---
name: env-config
description: Organize env vars and secrets with schemas and safe rotation. Use when adding config, onboarding devs, or fixing env bugs.
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: devops-infra
  version: 0.1.0
  author: hornet-swarm
---

## What I do

- Define a config schema: required vs optional vars, defaults, validation
- Provide `.env.example` plus per-environment guidance without leaking secrets
- Document rotation and debugging steps for config errors

## When to use me

Use when:

- Adding config, onboarding devs, or fixing env bugs
- Secrets sprawl or "missing env" startup failures

Don't use when:

- Auditing code vulnerabilities (use `security-audit`)

## Workflow

1. **Inspect** — grep code for env reads; list required/optional vars, defaults, and where documented.
2. **Plan** — schema table (name, required, default, example); decide secret storage per env; confirm which values are truly secret.
3. **Execute** — write `.env.example`, validation snippet, and per-env setup notes.
4. **Verify** — boot with a clean env following only your notes; confirm the missing-var error is helpful.

## Rules / Constraints

- MUST: never output real secrets; examples use placeholders.
- MUST: fail fast with a message naming the missing var.
- MUST NOT: commit real `.env` files.

## Output format

```markdown
## Config schema
| Var | Required | Default | Example |
Setup: <steps> | Rotation: <steps> | Debug: <missing-var checklist>
```

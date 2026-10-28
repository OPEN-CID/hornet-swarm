---
name: readme-writer
description: Write README files that onboard in five minutes with setup and usage. Use when creating or overhauling any project README.
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: docs-research
  version: 0.1.0
  author: hornet-swarm
---

## What I do

- Produce what/why, quickstart, install, usage, config, and troubleshooting sections
- Verify every command by reading the repo (no invented scripts)
- Keep it scannable: 30-second pitch + 5-minute quickstart

## When to use me

Use when:

- Creating or overhauling any project README
- Onboarding complaints say setup is unclear

Don't use when:

- Documenting a single API surface (use `api-docs`)

## Workflow

1. **Inspect** — read manifests, entry points, existing docs. List real install/run/test commands.
2. **Plan** — outline: pitch, prerequisites, quickstart, usage examples, config table, troubleshooting, contributing link.
3. **Execute** — write concrete commands and copy-pasteable examples; link don't duplicate detailed docs.
4. **Verify** — mentally run the quickstart top→bottom; flag anything unverified.

## Rules / Constraints

- MUST: every command verified against the repo; no invented URLs or scripts.
- MUST: state prerequisites and minimum versions.
- MUST NOT: paste secrets or environment-specific paths.

## Output format

```markdown
# <Project> — <one-line pitch>
## Quickstart (5 min): <numbered commands>
## Usage / Config / Troubleshooting / Contributing
```

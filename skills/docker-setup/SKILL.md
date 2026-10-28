---
name: docker-setup
description: Containerize apps with lean Dockerfiles and compose for local dev. Use when adding Docker or fixing image and compose issues.
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: devops-infra
  version: 0.1.0
  author: hornet-swarm
---

## What I do

- Write multi-stage Dockerfiles with pinned bases and non-root users
- Add compose services for app + deps with healthchecks and volumes
- Keep images small, builds cached, and local dev one command

## When to use me

Use when:

- Adding Docker or fixing image and compose issues
- Dev/prod parity problems ("works on my machine")

Don't use when:

- Designing cloud deployment topology (that's infra beyond compose)

## Workflow

1. **Inspect** — read runtime version, start command, env needs, and ports. Check existing Dockerfiles.
2. **Plan** — choose base image, build stages, layer order (deps before code), and compose services.
3. **Execute** — write Dockerfile + compose + `.dockerignore`; document env and one-command startup.
4. **Verify** — build fresh, run, and hit the health endpoint; report image size.

## Rules / Constraints

- MUST: pin base versions, run as non-root, never bake secrets into layers.
- MUST: `.dockerignore` node_modules/.git/build output.
- MUST NOT: run databases with ephemeral-only storage in dev without warning.

## Output format

```markdown
## Docker: <service>
- Files: `Dockerfile`, `compose.yaml`
- Run: `docker compose up --build` → health: <url> OK
- Image: <size>, user: <non-root>
```

---
name: repo-structure-guide
description: Design repo layouts that stay navigable at scale: monorepo vs polyrepo, per-language folders, docs and CI placement. Use when scaffolding or reorganizing any repository.
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: software-build
  version: 1.0.0
  author: hornet-swarm
---

## What I do

- Choose monorepo vs polyrepo vs hybrid from team size, deploy coupling, and ownership
- Lay out per-language folders, shared code, docs, and CI so newcomers find things in minutes
- Define naming, boundaries, and what lives where with a one-page map

## When to use me

Use when:

- Scaffolding a new repository or reorganizing a grown one
- Onboarding complaints say nobody can find anything
- Debating monorepo vs splitting services

Don't use when:

- Mapping an existing repo without changing it (use `codebase-explorer`)

## Workflow

1. **Inspect** — list deployables, languages, teams/owners, and pain points. Count what ships together.
2. **Plan** — pick the topology below; draft the tree with ownership per top-level dir. Confirm with the team.
3. **Execute** — create/move the skeleton: code, tests beside code, `docs/`, CI, templates, and a README map.
4. **Verify** — a stranger clones and reaches the run command in under 5 minutes following only your map.

## Rules / Constraints

- MUST: one deployable has one obvious root; shared code lives in exactly one place.
- MUST: tests colocated with code; docs in `docs/` with an index; no mystery folders.
- MUST NOT: nest deeper than 4 levels for daily-touched code.
- MUST NOT: split repos to fix a coupling problem — fix the boundary first.

## Topology picks

| Situation | Pick |
|---|---|
| One team, services ship together | monorepo (`apps/`, `libs/`, `infra/`) |
| Independent teams, independent deploys | polyrepo, shared via versioned libs |
| Mixed | hybrid: product monorepo + separate infra/data repos |

## Per-language home bases

| Stack | Code | Tests | Config |
|---|---|---|---|
| Python | `src/<pkg>/` + `pyproject.toml` | `tests/` | `ruff`, `pytest.ini` |
| TypeScript/JS | `src/` + `package.json` | `src/**/*.test.*` | `tsconfig`, `eslint` |
| Go | `cmd/`, `internal/`, `pkg/` | `*_test.go` beside code | `go.mod` |
| Rust | workspace crates `crates/` | `tests/` per crate | `Cargo.toml` |
| Java/Kotlin | `module/src/main|test` | beside main | `pom.xml`/`build.gradle` |
| C# | `src/<Proj>/`, `tests/` | xUnit per project | `.sln` |
| Ruby/PHP | `app/`, `lib/` or framework default | framework spec/test | `Gemfile`/`composer.json` |

## Output format

```text
Topology: <monorepo|polyrepo|hybrid> — because <deploy/ownership reason>
Tree:
  apps/<a>/ (owner) | libs/<shared>/ | docs/ | .github/workflows/
First-run check: clone → <3 commands> → running in <N> min
```

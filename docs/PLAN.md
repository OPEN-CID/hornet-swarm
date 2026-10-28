# Universal Agent Skills — Perfect Plan

Single source of truth: **Anthropic Agent Skills spec (`SKILL.md` + YAML frontmatter)**.
Consumed via copy + lightweight installer into `.agents/skills/`, `.claude/skills/`, `.opencode/skills/`.

## 1. Goals

1. **Universal:** one skill works in OpenCode, Claude Code, Cursor, Copilot, Gemini, Windsurf without modification.
2. **Lightweight:** zero dependencies by default. Copy 1 folder = use skill. Core `SKILL.md` < 500 lines, < 5KB ideal. Heavy content goes to `references/`, heavy automation to `scripts/`.
3. **Progressive disclosure:** agent reads frontmatter (name+description, <1024 chars) → loads `SKILL.md` body only when needed → loads `references/*.md` / runs `scripts/*` only if instructed.
4. **Discoverable + composable:** flat `skills/<name>/` namespace, `registry.json` as index, no nested categories on disk.

## 2. Use-Case Taxonomy (all agent jobs)

| Domain | Skills (proposed, 35 total) | Why |
|---|---|---|
| **A. Software build** | `api-design`, `frontend-component`, `db-migration`, `debugging`, `refactoring` | 80% of agent coding work |
| **B. Quality & testing** | `test-generator`, `tdd-workflow`, `code-review`, `qa-checklist`, `perf-profile`, `security-audit` | review/QA loop |
| **C. Git & release** | `git-commit`, `git-branch`, `pr-create`, `changelog-release`, `version-bump` | consistent VCS hygiene |
| **D. Docs & research** | `readme-writer`, `api-docs`, `adr-writer`, `codebase-explorer`, `tech-research` | onboarding + decisions |
| **E. DevOps & infra** | `docker-setup`, `ci-pipeline`, `env-config`, `deploy-checklist`, `log-triage` | ship + operate |
| **F. Data & AI** | `sql-query`, `data-clean`, `prompt-engineer`, `rag-builder`, `eval-harness` | data/LLM tasks |
| **G. Productivity** | `task-planner`, `meeting-notes`, `issue-breakdown` | planning layer |
| **H. Meta** | `skill-creator`, `repo-onboarder` | repo self-extends; teaches agents to use this repo |

V1 ships 3 exemplar skills (`skill-creator`, `git-commit`, `code-review`). Rest added iteratively from template.

## 3. Repo Structure (flat + indexed)

```text
hornet-swarm/
  README.md                  # 30-sec usage
  registry.json              # machine index: name, description, category, path, version
  templates/
    SKILL.md                 # perfect skill template
    references-example.md
  skills/
    <skill-name>/            # kebab-case, ^[a-z0-9]+(-[a-z0-9]+)*$, = frontmatter name
      SKILL.md               # required, frontmatter + body
      references/            # optional, extra docs loaded on-demand
      scripts/               # optional, deterministic helpers (no deps)
      assets/                # optional, templates/prompts
  scripts/
    install.ps1 / install.sh # copy skills → target dirs
    validate.ps1             # frontmatter + spec check (no deps)
  docs/
    PLAN.md                  # this file
    CONTRIBUTING.md          # how to add a skill in 5 min
```

Why flat `skills/<name>/` and not `skills/<category>/<name>/`:
most agents scan `skills/*/SKILL.md` (one level). Categories live in `registry.json` + README tables, not paths.

## 4. Perfect Skill Anatomy (`SKILL.md`)

```markdown
---
name: git-commit              # = folder name, 1-64 chars, kebab-case
description: Craft conventional commits ... Use when ...  # 1-1024 chars, WHAT + WHEN
license: MIT                  # optional
compatibility: opencode, claude-code, cursor, copilot, generic  # optional
metadata:
  category: git-release
  version: 0.1.0
  author: hornet-swarm
---

## What I do
- 3-7 bullets, outcome-focused

## When to use me
- explicit triggers + non-triggers ("Use when... Don't use when...")

## Workflow
1. numbered steps, agent follows top→bottom
2. include decision points + clarifying questions

## Rules / Constraints
- hard must/must-not list

## Output format
- exact artifact shape (code block example)

## References (optional)
- `references/foo.md` — when to load it
```

Rules:
- No tool-specific syntax (`skill({})`, slash commands). Plain markdown + shell-agnostic commands.
- Scripts must run with stdlib only; document usage in SKILL.md; never auto-run.
- Every claim verifiable; no network calls in core flow.

## 5. Lightweight Distribution

| Method | Command | Target |
|---|---|---|
| Copy 1 skill | `Copy-Item -Recurse skills/git-commit .agents/skills/` | ad-hoc |
| Install all (Win) | `powershell scripts/install.ps1 -Target .agents/skills` | project |
| Install all (nix) | `bash scripts/install.sh --target .agents/skills` | project |
| Global | `-Scope global` / `--global` | `~/.agents/skills`, `~/.claude/skills`, `~/.config/opencode/skills` |

Installer = pure copy + name-collision check. No npm/pip. <100 lines.

## 6. Quality Gates

`scripts/validate.ps1` checks (no deps):
1. `SKILL.md` exists, filename all-caps.
2. Frontmatter has `name`, `description`; name matches regex + folder; description 1–1024 chars.
3. Body has `## What I do`, `## When to use me`, `## Workflow`, `## Output format`.
4. No banned tool-specific strings.
5. `registry.json` entry exists and matches frontmatter.

CI: run validate on PR. No build step.

## 7. Roadmap

- [x] Phase 0: structure + template + registry + installer + validator + 3 examples (this pass)
- [ ] Phase 1: domains A–C (build/quality/git, ~12 skills)
- [ ] Phase 2: domains D–E (docs/devops, ~10 skills)
- [ ] Phase 3: domains F–H (data/productivity/meta, ~10 skills)
- [ ] Phase 4: i18n note, marketplace publishing, `npx hornet-swarm add <name>`

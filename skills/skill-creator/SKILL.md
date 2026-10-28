---
name: skill-creator
description: Author new spec-compliant SKILL.md skills from scratch. Use when creating, updating, or reviewing any skill in this repo.
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: meta
  version: 0.1.0
  author: hornet-swarm
---

## What I do

- Scaffold a new `skills/<name>/SKILL.md` from `templates/SKILL.md`
- Validate name regex, description length, and required sections
- Register the skill in `registry.json`

## When to use me

Use when:

- User asks to create, add, update, or fix a skill
- Reviewing whether a SKILL.md meets the repo standard

Don't use when:

- Doing the domain task itself (use that skill instead)

## Workflow

1. **Inspect** — ask: skill name (kebab-case), one-sentence job, trigger phrases, desired output artifact, allowed scripts/references.
2. **Plan** — propose `name`, `description` (WHAT + WHEN, ≤1024 chars), category, and sections. Confirm name matches `^[a-z0-9]+(-[a-z0-9]+)*$`.
3. **Execute** — copy `templates/SKILL.md` to `skills/<name>/SKILL.md`, fill every section, keep core < 500 lines. Put long docs in `references/`, helpers in `scripts/` (stdlib only).
4. **Verify** — run `powershell scripts/validate.ps1 -Skill <name>`; fix failures; add `registry.json` entry with matching name/description/path.

## Rules / Constraints

- MUST: folder name = frontmatter `name`; file named exactly `SKILL.md`.
- MUST: description states WHAT + WHEN.
- MUST NOT: use tool-specific syntax, invent URLs, or add dependencies by default.
- MUST NOT: nest skills (`skills/<cat>/<name>` is forbidden — flat only).

## Output format

```text
Created skills/<name>/SKILL.md (<N> lines)
Registry entry added: <name> — <category>
Validate: PASS (or list of failures fixed)
Usage: Copy-Item -Recurse skills/<name> .agents/skills/
```

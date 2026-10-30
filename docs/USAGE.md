# Using hornet-swarm skills in every tool

One skill folder works everywhere because every skill follows the
[Agent Skills](https://agentskills.io) standard (`SKILL.md` + `name` +
`description`, name matches folder). Install = copy folder(s) into the
directory your tool scans. No build, no account, no plugin.

## 30-second picker

| Tool | Install command (run in your project) | Skills live in | Trigger it |
|---|---|---|---|
| OpenCode | `powershell scripts/install.ps1 -Tool opencode` | `.opencode/skills/` (also reads `.agents/skills/`, `.claude/skills/`) | automatic, or via `skill` tool |
| Claude Code | `powershell scripts/install.ps1 -Tool claude` | `.claude/skills/` | automatic, or `/skill-name` |
| Cursor | `powershell scripts/install.ps1 -Tool cursor` | `.agents/skills/` (alt: `.cursor/skills/`) | automatic, or `/skill-name` |
| Copilot (VS Code / CLI / app) | `powershell scripts/install.ps1 -Tool copilot` | `.github/skills/` (also reads `.agents/skills/`, `.claude/skills/`) | automatic, or `/skill-name` |
| Codex (CLI / IDE) | `powershell scripts/install.ps1 -Tool codex` | `.agents/skills/` (VS Code integration also reads `.github/skills/`) | automatic, or `$skill-name` |
| Gemini CLI | `powershell scripts/install.ps1 -Tool gemini` + manual step below | `.agents/skills/` (as staging only) | manual (no native discovery) |
| Anything else | `powershell scripts/install.ps1 -Target <dir>` | whatever your tool scans | paste `SKILL.md` on demand |

macOS/Linux: replace `powershell scripts/install.ps1` with `bash scripts/install.sh`
(same flags: `--tool`, `--target`, `--skills`, `--global`).

## What you should get (works in all cases)

1. **Discovery**: a fresh session sees installed skills (name + description only — cheap).
2. **Auto-load**: ask something matching a description and the agent loads the full
   `SKILL.md` by itself (e.g. "review this diff" loads `code-review`).
3. **Manual**: type `/meal-plan` (Claude/Cursor/Copilot), `$meal-plan` (Codex) to force it.
4. **Progressive**: referenced files load only when needed — 400 installed skills
   cost almost nothing until used.

## Per-tool workflows

### OpenCode
```powershell
powershell scripts/install.ps1 -Tool opencode        # project .opencode/skills
powershell scripts/install.ps1 -Tool opencode -Scope global
```
Verify: new session, ask "what skills are available?" — the `skill` tool lists
them. Single skill: `-Skills code-review`. Update: re-run installer (copy overwrites).

### Claude Code
```powershell
powershell scripts/install.ps1 -Tool claude           # project .claude/skills (commit it)
powershell scripts/install.ps1 -Tool claude -Scope global   # ~/.claude/skills
```
Verify: `/` menu lists `/meal-plan`; ask "what changed?" to test auto-load.
Cloud/Cowork sessions don't read your machine's `~/.claude/skills` — commit
project skills to the repo instead. Monorepos: nested `.claude/skills/` work too.

### Cursor
```powershell
powershell scripts/install.ps1 -Tool cursor           # project .agents/skills
powershell scripts/install.ps1 -Tool cursor -Scope global    # ~/.agents/skills
```
Verify: **Customize → Skills** lists them; `/meal-plan` in Agent chat forces it.
Cloud Agents only see repo-committed skills (`.cursor/skills/` or
`.agents/skills/`), not your `~/.agents/skills/` — commit for cloud runs.

### Copilot (VS Code, CLI, app)
```powershell
powershell scripts/install.ps1 -Tool copilot          # project .github/skills
powershell scripts/install.ps1 -Tool copilot -Scope global   # ~/.copilot/skills
```
Verify: fresh chat, `/` menu shows the skill; ask a matching task to test
auto-load. You can also copy one skill: `Copy-Item -Recurse skills/first-aid-basics .github/skills/`.

### Codex (CLI / IDE)
```powershell
powershell scripts/install.ps1 -Tool codex            # project .agents/skills
powershell scripts/install.ps1 -Tool codex -Scope global     # ~/.agents/skills
```
Verify: `$meal-plan` or `/skills` menu. Codex scans `.agents/skills` from your
current directory up to the repo root — skills near the work win.

### Gemini CLI (manual path — no native SKILL.md discovery)
Gemini CLI (as researched) offers slash commands, `GEMINI.md` context, MCP, and
extensions — but no skill-directory scanning. Two working options:
1. **Pointer**: append to your project's `GEMINI.md`:
   `When the task matches <X>, read .agents/skills/<name>/SKILL.md and follow it.`
   then install skills there with `-Tool gemini`.
2. **Paste**: open `skills/<name>/SKILL.md`, paste it into chat with your task.
Both give you the workflow; you just invoke it explicitly.

## Team distribution (3 patterns)

1. **Commit it** (recommended): copy needed skills into your repo
   (`.agents/skills/` is read by Cursor, Copilot, Codex, OpenCode, and Local harnesses —
   one location, widest coverage) and commit. Reviewers see exactly what the agent sees.
2. **Vendor + installer**: `git submodule add https://github.com/OPEN-CID/hornet-swarm.git vendor/skills`
   then `scripts/install.ps1 -Target .agents/skills -Skills <names>` from the submodule
   (run installer with workdir inside the submodule, or copy first).
3. **Sparse checkout** (many skills, slow network):
   `git clone --filter=blob:none --sparse <url> && git sparse-checkout set skills/<name>` then copy.

## Updating

Re-run the same install command — copy overwrites. To audit what changed:
`git status --short <skills-dir>` before committing.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| Skill not listed | wrong directory for your tool | check the table above; restart the session |
| Skill listed but never auto-loads | vague description | our validator enforces WHAT+WHEN; file a `skill-fix` issue |
| Wrong skill triggers | overlapping descriptions | invoke explicitly (`/name`, `$name`) |
| `/name` does nothing | name/folder mismatch | `validate.ps1` catches this in CI; report it |
| Cloud session missing skills | personal `~/` skills don't sync | commit project-level skills to the repo |
| Tool not in the table (Windsurf, Zed, Aider, JetBrains…) | unverified path | use `.agents/skills/` (the open-standard location) + paste-on-demand; open an issue with the tool's docs link and we'll verify and add it |

Every skill in this repo passes `scripts/validate.ps1` (name = folder,
description WHAT+WHEN ≤1024 chars, required sections) — if a skill misbehaves
in your tool, it's a tool quirk, not the skill; tell us which tool.

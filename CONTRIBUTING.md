# Contributing to Hornet Swarm

Everyone can add a skill — no coding required. Pick the path that fits you;
a maintainer (or CI) handles the rest.

## 5 ways to add a skill (easiest first)

| # | Path | Who | How |
|---|---|---|---|
| 1 | **Issue proposal** | anyone | Open a *Skill proposal* issue, fill 6 fields, done |
| 2 | **AI proposer prompt** | anyone with any chatbot | Paste `templates/PROPOSER-PROMPT.md` into ChatGPT/Claude/etc., paste the JSON it returns into an issue or PR |
| 3 | **CSV import** | spreadsheet people | Add rows to a CSV, run `scripts/import-skills.ps1` |
| 4 | **Catalog JSON** | comfortable with JSON | Add a 6-line entry to `catalog/custom.json`, run the generator |
| 5 | **Hand-write** | skill experts | Copy `templates/SKILL.md` to `skills/<name>/SKILL.md` |

Full comparison: `docs/INTAKE.md`. Skill design rules: `docs/SKILL-FAMILIES.md`.

## What every skill must satisfy (CI enforces this)

- Path `skills/<kebab-name>/SKILL.md`, folder name = frontmatter `name`
  (`^[a-z0-9]+(-[a-z0-9]+)*$`, max 64 chars).
- `description` states WHAT + WHEN, 1-1024 chars.
- Body has `What I do`, `When to use me`, `Workflow`, `Output format`.
- No secrets, no invented URLs, no tool-specific syntax.
- Medical/legal skills carry the "information only, consult a professional" note
  (the generator adds it automatically).
- `registry.json` and `wiki/` regenerated (CI checks; run the scripts below).

## Standard workflow (paths 3-5)

```powershell
# 1. add your skill (pick one path)
powershell scripts/new-skill.ps1            # interactive
powershell scripts/import-skills.ps1 -Csv my-skills.csv   # spreadsheet
# or edit catalog/custom.json by hand

# 2. generate + index + wiki
powershell scripts/generate-skills.ps1
powershell scripts/rebuild-registry.ps1
powershell scripts/generate-wiki.ps1

# 3. validate (must print PASS, no FAIL)
powershell scripts/validate.ps1
```

Then open a PR. Keep PRs to one skill (or one domain batch) so review is fast.
CI runs `validate.ps1` plus a registry/wiki freshness check.

## Review bar

- Would a stranger understand WHEN to trigger this skill from the description alone?
- Is the workflow concrete (commands, tables, examples) rather than advice?
- Could every output be verified by the user in under 5 minutes?

## Conduct and security

- Be kind and direct: see `CODE_OF_CONDUCT.md`.
- Never commit secrets, tokens, or private data: see `SECURITY.md`.
- License: everything here is MIT (`LICENSE`); by contributing you agree your
  additions are MIT-licensed too.

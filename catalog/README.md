# Catalog — the source of truth for generated skills

Hand-written skills live in `skills/` directly (never overwritten unless
`-Force`). Everything else starts here as short entries; generators expand them.

## Files

| File(s) | Purpose | Who edits |
|---|---|---|
| `world.json` | core task skills per domain (curated) | maintainers |
| `families.json` | translate/parse/review/playbook skills (curated) | maintainers |
| `languages/*.json` | one file per language skill (toolchain, style, idioms, arch[4], pitfalls[4], sample) | maintainers |
| `workflows.json` | workflow plays; `steps` MUST be existing skill names | anyone via PR |
| `travel.json`, `cooking.json`, ... | one file per life domain (see `docs/WORLD-TAXONOMY.md`, 50 categories) | anyone via PR |
| `custom.json` | community entries (created by `new-skill.ps1`) | anyone via PR |
| `imports.json` | created by `import-skills.ps1` (CSV bulk import) | anyone via PR |

Any `*.json` file at this level with a `skills[]` array is picked up by
`generate-skills.ps1`; `workflows.json` (with `workflows[]`) is picked up by
`generate-workflows.ps1`; `languages/*.json` by `generate-lang-skills.ps1`.

## Entry schema (6 fields)

```json
{ "name": "meal-plan",
  "category": "home-life",
  "description": "Plan a week of dinners around budget and diet. Use for weekly cooking.",
  "outcomes": ["7-day dinner plan", "prep order", "shopping list"],
  "triggers": ["weekly cooking"],
  "artifact": "## Meal plan (Mon-Sun): ..." }
```

- `name`: kebab-case, `^[a-z0-9]+(-[a-z0-9]+)*$`, unique repo-wide (validator
  also rejects `--` and edge hyphens).
- `category`: one of the 50 keys in `registry.json` (see `wiki/README.md`).
- `description`: WHAT + WHEN, max 200 chars recommended (hard limit 1024).
  Values with `: ` or ` #` MUST be YAML double-quoted (generators do this;
  hand-written files must too — see `docs/INTAKE.md`).
- `triggers`: 1-3 user phrases; flows into `metadata`, the registry, the
  `SKILLS.md` router, and MCP search.
- Kind suffixes steer the generator: `-translate`, `-parse`, `-review`,
  `-playbook`; plain verbs are task skills. Details: `docs/SKILL-FAMILIES.md`.
- Workflow entries add `steps[]` (existing skill names, in order).

After editing: `generate-skills.ps1` → `generate-workflows.ps1` (if touched) →
`rebuild-registry.ps1` → `generate-wiki.ps1` → `generate-router.ps1` →
`validate.ps1`. CI verifies all of them were run.

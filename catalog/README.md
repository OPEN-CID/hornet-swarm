# Catalog — the source of truth for generated skills

Hand-written skills live in `skills/` directly. Everything generated starts
here as short entries; `scripts/generate-skills.ps1` expands them.

## Files

| File | Purpose | Who edits |
|---|---|---|
| `world.json` | core task skills per domain (curated) | maintainers |
| `families.json` | translate/parse/review/playbook skills (curated) | maintainers |
| `custom.json` | community entries (created by `new-skill.ps1`) | anyone via PR |
| `imports.json` | created by `import-skills.ps1` | anyone via PR |

## Entry schema (6 fields)

```json
{ "name": "meal-plan",
  "category": "home-life",
  "description": "Plan a week of dinners around budget and diet. Use for weekly cooking.",
  "outcomes": ["7-day dinner plan", "prep order", "shopping list"],
  "triggers": ["weekly cooking"],
  "artifact": "## Meal plan (Mon-Sun): ..." }
```

- `name`: kebab-case, `^[a-z0-9]+(-[a-z0-9]+)*$`, unique repo-wide.
- `category`: one of the 19 keys in `registry.json` (see `wiki/README.md`).
- `description`: WHAT + WHEN, max 200 chars recommended (hard limit 1024).
- Kind suffixes steer the generator: `-translate`, `-parse`, `-review`,
  `-playbook`; plain verbs are task skills. Details: `docs/SKILL-FAMILIES.md`.

After editing: `generate-skills.ps1` → `rebuild-registry.ps1` →
`generate-wiki.ps1` → `validate.ps1`. CI verifies all four were run.

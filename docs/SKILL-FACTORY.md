# Skill Factory — define a skill for anything in 60 seconds

Hand-writing 163 `SKILL.md` files is wasteful. Facts change; structure
doesn't. So structure lives in **one generator**, facts live in **small
JSON entries**, and detail is produced, not typed.

## The 6-line entry (the nice way)

`catalog/world.json`, `catalog/families.json`, or `catalog/custom.json`:

```json
{ "name": "meal-plan",
  "category": "home-life",
  "description": "Plan a week of dinners around budget and diet. Use for weekly cooking.",
  "outcomes": ["7-day dinner plan", "prep order", "shopping list"],
  "triggers": ["weekly cooking"],
  "artifact": "## Meal plan (Mon–Sun): ..." }
```

`scripts/generate-skills.ps1` detects the **kind** from the name
(`-parse`, `-review`, `-playbook`, `-translate`/`-explain`, else task)
and emits a detailed, spec-valid `SKILL.md`: frontmatter, What/When,
kind-specific 5-step workflow, kind rules, output format with confidence
note. Category safety notes (medical/legal) are injected automatically.

## Commands

```powershell
powershell scripts/new-skill.ps1        # interactive: 6 prompts → catalog + skill
powershell scripts/generate-skills.ps1  # regenerate from catalog (skips hand-written unless -Force)
powershell scripts/generate-lang-skills.ps1  # regenerate 20 language skills from catalog/languages*.json
powershell scripts/rebuild-registry.ps1 # registry.json from skills/*/SKILL.md
powershell scripts/generate-wiki.ps1    # wiki/ index + per-category pages
powershell scripts/validate.ps1         # spec check, must print PASS
powershell scripts/install.ps1 -Target .agents/skills
```

## When to hand-write instead

Core judgment skills (debugging, code review, architecture) deserve
hand-written workflows with real examples — see `skills/*/SKILL.md`
committed before the factory. The generator never overwrites them
unless you pass `-Force`. Everything else: catalog entry + generate.

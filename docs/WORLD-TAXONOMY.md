# World Skills Taxonomy — every job gets a skill

Dev-only catalogs cover ~10% of agent work. This repo covers the rest:
14 super-domains, 116 skills in v1, open-ended via the skill factory.

## The 14 domains

| # | Domain | Category key | Skills | Covers |
|---|---|---|---|---|
| 1 | Software build | `software-build` | 5 | api design, components, migrations, debugging, refactoring |
| 2 | Quality & testing | `quality-testing` | 6 | tests, TDD, review, QA, perf, security |
| 3 | Git & release | `git-release` | 5 | commit, branch, PR, changelog, semver |
| 4 | Docs & research | `docs-research` | 5 | readme, api docs, ADR, explorer, tech research |
| 5 | DevOps & infra | `devops-infra` | 5 | docker, CI, env, deploy, logs |
| 6 | Data & AI | `data-ai` | 5 | sql, cleaning, prompting, RAG, evals |
| 7 | Productivity | `productivity` | 3 | tasks, meetings, breakdowns |
| 8 | Meta | `meta` | 2 | skill-creator, repo-onboarder |
| 9 | Medical & health | `medical-health` | 8 | triage prep, labs, discharge, meds, fitness, nutrition, sleep, stress |
| 10 | Legal & finance | `legal-finance` | 7 | contracts, invoices, budget, tax, expenses, offers, pricing |
| 11 | Education | `education` | 8 | math, physics, chemistry, languages, exams, essays, curricula, kids |
| 12 | Science & lab | `science-lab` | 6 | experiments, papers, citations, analysis, protocols, stats |
| 13 | Home & life | `home-life` | 8 | meals, groceries, cleaning, maintenance, moving, pets, routines, emergency |
| 14 | DIY & maker | `diy-maker` | 8 | plumbing, electrical safety, woodworking, 3D print, car, garden, energy, assembly |
| 15 | Business & ops | `business-ops` | 10 | ideas, plans, copy, outreach, support, hiring, onboarding, SOPs, KPIs, decks |
| 16 | Company architecture | `company-arch` | 6 | frontend, backend, data, ML, security, platform arch |
| 17 | Data pipelines | `data-pipeline` | 6 | ETL, quality, dashboards, spreadsheets, surveys, scraping |
| 18 | Creative & media | `creative-media` | 7 | blog, video, podcast, newsletter, photo, music, brand |
| 19 | Career | `career` | 6 | resume, cover letter, interviews, LinkedIn, negotiation, reviews |

(19 category keys; "14 domains" groups some. Total: 36 dev + 80 task + 47 family + 2 community = **165 skills** and growing via `docs/INTAKE.md`.)

## Naming convention (avoids collisions across the world)

- Flat namespace: `skills/<name>/`, regex `^[a-z0-9]+(-[a-z0-9]+)*$`.
- Domain prefix where the word is generic: `med-`, `diy-`, no prefix where unique (`meal-plan`, `resume-writer`).
- One job = one skill. If a skill answers two jobs, split it.

## The nice way to define a skill for anything (factory)

Adding a skill is **6 lines of JSON + 1 command** — no hand-writing boilerplate:

```json
{ "name": "meal-plan",
  "category": "home-life",
  "description": "Plan a week of dinners around budget and diet. Use for weekly cooking.",
  "outcomes": ["7-day dinner plan", "prep order", "leftover reuse"],
  "triggers": ["weekly cooking", "grocery planning"],
  "artifact": "## Meal plan (Mon–Sun): ..." }
```

Then: `powershell scripts/generate-skills.ps1` scaffolds a spec-valid
`SKILL.md` (frontmatter + all 4 required sections + category safety rules),
`scripts/rebuild-registry.ps1` updates `registry.json`,
`scripts/generate-wiki.ps1` rebuilds the browsable wiki.

Full spec for skill authors: `docs/SKILL-FACTORY.md`.
Catalog source of truth: `catalog/world.json`.

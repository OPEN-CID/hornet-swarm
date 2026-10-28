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
| 20 | Languages | `languages` | 20 | python, typescript, javascript, go, rust, java, csharp, cpp, c, ruby, php, swift, kotlin, dart, r, scala, elixir, bash, powershell, lua — each with toolchain, style, idioms, arch patterns, pitfalls |
| 21 | Travel | `travel` | 10 | trip plans, packing, visas, itineraries, budget, safety, flights, road trips, solo, phrasebooks |
| 22 | Cooking & food | `cooking` | 12 | baking, knives, spices, meal prep, grilling, fermentation, coffee, tea, cocktails, wine, food safety, pantry |
| 23 | Parenting & family | `parenting` | 10 | newborns, toddlers, teens, elder care, homeschool, budget, siblings, screens, grandparents, baby-proofing |
| 24 | Relationships | `relationships` | 8 | communication, repair, dating, friendship, check-ins, apologies, boundaries, networking |
| 25 | Mind & habits | `mind` | 10 | habits, focus, procrastination, journaling, meditation, detox, gratitude, stoicism, memory, speed reading |
| 26 | Fitness & sport | `fitness` | 10 | running, strength, yoga, stretching, swimming, cycling, marathon, injury prevention, ergonomics, youth coaching |
| 27 | Outdoors | `outdoors` | 10 | hiking, camping, fishing, climbing safety, kayaking, survival, navigation, weather, wildlife, camp cooking |
| 28 | Housing | `housing` | 10 | renting, lease review, buying, mortgages, inspection, renovation, paint, flooring, declutter, interior design |
| 29 | Vehicles | `vehicles` | 6 | car buying, used-car review, motorcycles, EVs, bike repair, winter driving |
| 30 | Wealth | `wealth` | 8 | investing basics, retirement, insurance, estate notes, crypto basics, portfolio review, side hustles, tax habits |
| 31 | Everyday law | `law-life` | 8 | tenants, small claims, wills, copyright, privacy, warranty, scams, freelance contracts |
| 32 | Leadership | `leadership` | 8 | first-time managing, feedback, 1:1s, public speaking, decks, remote, exits, facilitation |
| 33 | Knowledge work | `knowledge` | 8 | notes, inbox zero, calendar, reports, data viz, typing, PKM tools, research briefs |
| 34 | Everyday tech | `everyday-tech` | 12 | linux CLI, regex, password managers, phishing, PC repair, backups, phones, smart home, wifi, AI tools, no-code, hardening |
| 35 | Cloud & infra | `cloud` | 8 | kubernetes, terraform, AWS, networking, DNS, TLS, monitoring, cost control |
| 36 | Big science | `science-big` | 8 | stargazing, weather, climate, genetics, psychology, economics, evolution, geology |
| 37 | Play & games | `play` | 8 | chess, poker, board nights, game tuning, game design, D&D, puzzles, go |
| 38 | Craft | `craft` | 12 | drawing, watercolor, photography, photo editing, calligraphy, knitting, sewing, pottery, origami, candles, jewelry, scrapbooking |
| 39 | Music | `music` | 6 | guitar, piano, singing, theory, recording, sheet reading |
| 40 | Writing | `writing` | 8 | fiction, poetry, screenwriting, grants, tech writing, self-publishing, editing, storytelling |
| 41 | Events | `events` | 6 | weddings, parties, budgets, holidays, memorials, toasts |
| 42 | Civic life | `civic` | 6 | volunteering, fundraising, organizing, voting, local government, block safety |
| 43 | Safety & emergency | `safety` | 8 | first aid, CPR awareness, fire, quakes, floods, storms, self-defense, scams |
| 44 | Eco living | `eco` | 6 | recycling, compost, waste-less, water, sustainable shopping, carbon cuts |
| 45 | Pets & animals | `pets` | 6 | dogs, cats, aquariums, birds, chickens, bees |
| 46 | Culture & thinking | `culture` | 6 | genealogy, media literacy, critical thinking, debate, art history, museums |

(46 category keys. Total: **404 skills** — 36 hand-written + 368 factory-generated — and growing via `docs/INTAKE.md`.)

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

# Hornet Swarm — Universal Agent Skills

165 lightweight, universal (`SKILL.md`) skills covering every domain where
AI can help: code, data, business, health, home, DIY, study, science,
creative work, and career. One folder = one skill. Works in OpenCode,
Claude Code, Cursor, Copilot, Gemini, Windsurf.

## 30-second use

```powershell
# browse the wiki: wiki/README.md (19 category pages)
# use one skill: copy it into a dir your agent scans
Copy-Item -Recurse skills/meal-plan .agents/skills/
# also supported: .claude/skills/ , .opencode/skills/

# or install all 165
powershell scripts/install.ps1 -Target .agents/skills
bash scripts/install.sh --target .agents/skills
```

## Wiki (browsable index)

Start at [`wiki/README.md`](wiki/README.md) — 19 categories:

| Domain | Skills | Examples |
|---|---|---|
| software-build, quality-testing, git-release | 16 | `debugging`, `code-review`, `pr-create` |
| docs-research, devops-infra, data-ai, productivity, meta | 17 | `api-docs`, `deploy-checklist`, `rag-builder`, `task-planner` |
| medical-health | 8 | `med-symptom-triage`, `med-record-parse`, `health-playbook` |
| legal-finance | 7 | `contract-reader`, `budget-plan`, `finance-review` |
| education | 8 | `math-tutor`, `exam-prep`, `learn-playbook` |
| science-lab | 6 | `experiment-design`, `paper-parse`, `stats-helper` |
| home-life | 8 | `meal-plan`, `manual-parse`, `home-safety-review` |
| diy-maker | 8 | `diy-plumbing-fix`, `plan-parse`, `workshop-playbook` |
| business-ops | 10 | `idea-validate`, `proposal-parse`, `business-review` |
| company-arch | 6 | `backend-arch`, `ml-arch`, `arch-review` |
| data-pipeline | 6 | `etl-pipeline`, `data-doc-parse`, `dashboard-design` |
| creative-media | 7 | `blog-writer`, `brief-parse`, `content-review` |
| career | 6 | `resume-writer`, `job-post-parse`, `interview-prep` |

Every domain follows the same 5 kinds — **Translate → Parse → Do →
Review → Playbook** (see [`docs/SKILL-FAMILIES.md`](docs/SKILL-FAMILIES.md)):

- **Translate** (`med-jargon-translate`, `code-explain`): jargon to plain language
- **Parse** (`med-record-parse`, `legal-doc-parse`, `plan-parse`): documents to structured facts
- **Do** (`meal-plan`, `sql-query`, `pitch-deck`): perform the task
- **Review** (`med-care-review`, `arch-review`, `content-review`): audit before it ships
- **Playbook** (`health-playbook`, `data-playbook`, `ops-playbook`): expert best practices

## Add a skill in 60 seconds (6 paths, easiest first)

| Path | Command |
|---|---|
| Issue (no tools) | *Skill proposal* issue template — maintainer runs the factory |
| Any chatbot | `templates/PROPOSER-PROMPT.md` → paste JSON into issue/PR |
| Spreadsheet | `powershell scripts/import-skills.ps1 -Csv my-skills.csv` |
| Interactive | `powershell scripts/new-skill.ps1` |
| JSON | edit `catalog/*.json`, then generate → registry → wiki → validate |
| Hand-write | copy `templates/SKILL.md` to `skills/<name>/SKILL.md` |

Details: [`CONTRIBUTING.md`](CONTRIBUTING.md) (rules) ·
[`docs/INTAKE.md`](docs/INTAKE.md) (all 6 paths + structure map) ·
[`docs/SKILL-FACTORY.md`](docs/SKILL-FACTORY.md) (generator).

Docs: [`docs/PLAN.md`](docs/PLAN.md) (vision) ·
[`docs/WORLD-TAXONOMY.md`](docs/WORLD-TAXONOMY.md) (all domains) ·
[`docs/SKILL-FAMILIES.md`](docs/SKILL-FAMILIES.md) (the 5 kinds) ·
[`CONTRIBUTING.md`](CONTRIBUTING.md) (contribution rules).
Machine index: [`registry.json`](registry.json) (165 entries).

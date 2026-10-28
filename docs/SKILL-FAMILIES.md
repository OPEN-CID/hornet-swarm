# Skill Families — the nice way to cover every area

Every domain where AI can help gets the **same 5 skill kinds**.
Learn the pattern once, apply it to medicine, law, home, DIY, math,
science, data, business, architecture — anything.

## The 5 kinds

| Kind | Suffix | Job | Answers |
|---|---|---|---|
| **Translate** | `-translate`, `-explain` | Turn jargon into plain language | "What does this mean?" |
| **Parse** | `-parse` | Extract structure from documents | "Pull the facts out of this file" |
| **Do** | (task verb) | Perform the core task | "Do the work" |
| **Review** | `-review` | Audit work for gaps and risks | "Check this before it ships" |
| **Playbook** | `-playbook` | Best practices + operating system | "How do experts run this?" |

## Applied to every domain (v1: 163 skills)

| Domain | Translate | Parse | Do (examples) | Review | Playbook |
|---|---|---|---|---|---|
| medical-health | med-jargon-translate | med-record-parse | med-symptom-triage, fitness-plan | med-care-review | health-playbook |
| legal-finance | legal-jargon-translate | legal-doc-parse | contract-reader, budget-plan | finance-review | money-playbook |
| education | eli5-explainer | study-doc-parse | math-tutor, exam-prep | exam-readiness-review | learn-playbook |
| science-lab | sci-term-translate | paper-parse | experiment-design, stats-helper | result-review | research-playbook |
| home-life | label-reader | manual-parse | meal-plan, moving-checklist | home-safety-review | home-playbook |
| diy-maker | material-translate | plan-parse | diy-plumbing-fix, gardening-plan | build-review | workshop-playbook |
| business-ops | biz-jargon-translate | proposal-parse | idea-validate, sop-writer | business-review | ops-playbook |
| company-arch | stakeholder-translate | arch-doc-parse | backend-arch, ml-arch | arch-review | arch-playbook |
| data-pipeline | query-translate | data-doc-parse | etl-pipeline, dashboard-design | pipeline-review | data-playbook |
| creative-media | tone-translate | brief-parse | blog-writer, video-script | content-review | creative-playbook |
| career | feedback-translate | job-post-parse | resume-writer, interview-prep | application-review | career-playbook |
| software-build | code-explain | api-spec-parse | api-design, debugging | code-review | review-playbook |
| languages | n/a (each `-code` skill embeds plain-language idioms) | api-spec-parse | 20 × `-code` (do + playbook in one) | code-review | style + arch + pitfalls embedded per language |

## Language skills (the 6th family in practice)

One skill per programming language (`python-code`, `go-code`, ...) generated
from `catalog/languages/*.json` by `scripts/generate-lang-skills.ps1`. Each
contains toolchain commands, style rules, native idioms with a sample,
architecture patterns with when-to-use, a pitfalls table, and testing notes —
do + playbook fused. Data per language: description, toolchain, style[5],
idioms[5], arch[4], pitfalls[4], testing, sample.

## Life domains use the same 5 kinds

All 26 life categories (`travel` … `culture`) follow Translate → Parse →
Do → Review → Playbook like the dev domains. Examples: `visa-prep` (parse),
`lease-review` / `used-car-review` / `portfolio-review` (review kind —
severity findings plus verdict), `pack-playbook`-style routines embedded in
each playbook skill. Sensitive categories (`safety`, `wealth`, `law-life`,
`parenting`, `fitness`, `outdoors`, `vehicles`, `pets`, `cooking`) get
automatic guardrail notes from the generator (see `scripts/generate-skills.ps1`
`$SafetyNote`) — information only, professionals decide.

## Kind contracts (enforced by the generator)

- **Parse skills MUST:** quote exact source values, mark illegible/missing
  fields explicitly, never invent data, keep a source→field trace table.
  Input = pasted text, attached file, or image the user provides.
- **Review skills MUST:** rank findings by severity, cite evidence
  (`file:line` or quoted line), give a verdict (go / fix-first / no-go).
- **Playbook skills MUST:** principles, do/don't list, a starter routine,
  and anti-patterns — no generic motivation.
- **Translate skills MUST:** meet the reader at their level, rebuild upward
  in layers, end with "what to ask next".
- **Medical/legal skills MUST:** carry "information only, consult a
  professional" and never diagnose, dose, or give legal conclusions.

## Defining a new skill for anything (60 seconds)

1. Pick domain + kind. Name = `^[a-z0-9]+(-[a-z0-9]+)*$`.
2. Add 6 lines to `catalog/world.json` (or `families.json`):
   `name, category, description (WHAT + WHEN), outcomes[3], triggers, artifact`.
3. Run `powershell scripts/generate-skills.ps1` → detailed `SKILL.md`.
4. Run `powershell scripts/rebuild-registry.ps1` + `generate-wiki.ps1`.
5. Run `powershell scripts/validate.ps1` → must print PASS.

Hand-write only when the task needs true expertise (core dev skills);
generate everything else from the catalog. Detail lives in the kind
template, facts live in your 6 lines.

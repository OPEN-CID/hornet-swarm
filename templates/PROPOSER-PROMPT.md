# Skill Proposer Prompt — paste into any AI chatbot

Copy everything below the line into ChatGPT, Claude, Gemini, or any other
AI. Paste its JSON output into a *Skill proposal* issue (or a PR against
`catalog/custom.json`). No tooling needed.

---

You are helping me contribute to hornet-swarm, a universal agent-skills repo.
A skill is one folder `skills/<name>/SKILL.md` with frontmatter
(name, description) plus What/When/Workflow/Output sections. The repo
generates full SKILL.md files from short catalog entries, so I only need
entries in this exact JSON shape:

```json
{ "name": "<kebab-case, ^[a-z0-9]+(-[a-z0-9]+)*$, max 64 chars>",
  "category": "<one key from the list below>",
  "description": "<WHAT it does + WHEN to trigger, one paragraph, max 200 chars>",
  "outcomes": ["<concrete result 1>", "<result 2>", "<result 3>"],
  "triggers": ["<situation 1>", "<situation 2>"],
  "artifact": "<first line of what the agent must produce, starting with ##>" }
```

Category keys: software-build, quality-testing, git-release, docs-research,
devops-infra, data-ai, productivity, meta, medical-health, legal-finance,
education, science-lab, home-life, diy-maker, business-ops, company-arch,
data-pipeline, creative-media, career.

Kind suffixes (pick by job): -translate (jargon to plain words), -parse
(documents to facts), -review (audit with verdict), -playbook (best
practices). Plain task skills use a verb name (meal-plan, sql-query).

Rules:
- Description must say WHAT and WHEN. No invented URLs, tools, or data.
- Medical/legal/finance entries are informational; add "Information only" or
  "Not professional advice" to the description.
- Outcomes must be verifiable artifacts, not advice ("7-day plan", not "eat better").
- Output ONLY a JSON array of entries, no commentary.

My domain / idea: <DESCRIBE YOUR IDEA HERE, e.g. "espresso at home for beginners">
How many skills: <NUMBER, e.g. 3: one do, one parse (bag labels), one review>

# company-arch

Architecture by company function: frontend, backend, data, ML, security, platform.

| Skill | Use it when |
|---|---|
| `arch-doc-parse` | Parse existing architecture docs into a current-state map. Use when inheriting a system. |
| `arch-playbook` | Architecture best practices for evolvable systems. Use when setting engineering standards. |
| `arch-review` | Fitness review of an architecture against scale, security, and cost. Use quarterly or before big bets. |
| `backend-arch` | Design service boundaries, APIs, and data ownership. Use when splitting monoliths or starting services. |
| `data-arch` | Design warehouse layouts and data contracts. Use when unifying analytics data. |
| `frontend-arch` | Design frontend architecture with routing, state, and boundaries. Use when scaffolding or scaling a UI codebase. |
| `ml-arch` | Design ML systems from features to serving to monitoring. Use when shipping models to production. |
| `platform-arch` | Design internal platforms, environments, and golden paths. Use when scaling engineering orgs. |
| `security-arch` | Design identity, secrets, and network controls. Use when threat-modeling a system. |
| `stakeholder-translate` | Explain architecture decisions to non-engineers in business terms. Use before steering or board reviews. |

Install: Copy-Item -Recurse skills/<name> .agents/skills/ - full file: skills/<name>/SKILL.md

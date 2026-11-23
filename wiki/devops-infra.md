# devops-infra

Ship and run software reliably.

| Skill | Type | Use it when |
|---|---|---|
| `ci-pipeline` | skill | Build fast reliable CI with lint, test, and deploy gates. Use when creating or fixing continuous integration workflows. |
| `deploy-checklist` | skill | Ship safely with preflight checks, rollout steps, and rollback. Use before any production deploy or release rollout. |
| `docker-setup` | skill | Containerize apps with lean Dockerfiles and compose for local dev. Use when adding Docker or fixing image and compose issues. |
| `env-config` | skill | Organize env vars and secrets with schemas and safe rotation. Use when adding config, onboarding devs, or fixing env bugs. |
| `incident-response` | flow | Run incidents from alert to verified fix with follow-ups. Use for production incidents. |
| `log-triage` | skill | Triage logs and incidents to scope, cause, and next fix. Use when debugging production alerts or incident reports. |

Install: Copy-Item -Recurse skills/<name> .agents/skills/ - full file: `skills/<name>/SKILL.md`

Workflows (plays) live on the [workflows](workflows.md) page.

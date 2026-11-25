# devops-infra

Ship and run software reliably.

| Skill | Type | Use it when |
|---|---|---|
| `ansible-basics` | skill | Manage servers with Ansible roles and idempotent runs. Use for fleet config. |
| `ci-pipeline` | skill | Build fast reliable CI with lint, test, and deploy gates. Use when creating or fixing continuous integration workflows. |
| `cloudflare-basics` | skill | Run sites behind Cloudflare with DNS, cache, and WAF. Use for web protection. |
| `deploy-checklist` | skill | Ship safely with preflight checks, rollout steps, and rollback. Use before any production deploy or release rollout. |
| `docker-setup` | skill | Containerize apps with lean Dockerfiles and compose for local dev. Use when adding Docker or fixing image and compose issues. |
| `env-config` | skill | Organize env vars and secrets with schemas and safe rotation. Use when adding config, onboarding devs, or fixing env bugs. |
| `github-actions-guide` | skill | Build GitHub Actions with caching, matrices, and OIDC. Use for GitHub repos. |
| `gitlab-ci` | skill | Build GitLab CI pipelines with stages and runners. Use for GitLab repos. |
| `incident-response` | flow | Run incidents from alert to verified fix with follow-ups. Use for production incidents. |
| `log-triage` | skill | Triage logs and incidents to scope, cause, and next fix. Use when debugging production alerts or incident reports. |
| `nginx-config` | skill | Serve sites with Nginx blocks, TLS, and caching. Use for reverse proxies. |
| `pre-commit-hooks` | skill | Run pre-commit hooks for lint and secrets. Use for clean commits. |
| `proxmox-basics` | skill | Virtualize home labs with Proxmox VMs and backups. Use for homelabs. |
| `ship-service` | flow | Ship a service from container to monitored production. Use for launches. |
| `temporal-guide` | skill | Orchestrate durable workflows with Temporal activities and workers. Use for reliable background work. |
| `vercel-deploy` | skill | Ship frontends on Vercel with previews and envs. Use for web apps. |
| `wireguard-vpn` | skill | Connect sites and devices with WireGuard tunnels. Use for private networks. |

Install: Copy-Item -Recurse skills/<name> .agents/skills/ - full file: `skills/<name>/SKILL.md`

Workflows (plays) live on the [workflows](workflows.md) page.

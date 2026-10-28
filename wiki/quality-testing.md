# quality-testing

Prove it works: tests, reviews, QA, performance, security.

| Skill | Use it when |
|---|---|
| `code-review` | Perform thorough actionable code reviews with severity-ranked findings. Use when reviewing a diff, PR, or uncommitted changes. |
| `perf-profile` | Measure first, then optimize hot paths with before-after proof. Use when facing slowness, timeouts, or high resource usage. |
| `qa-checklist` | Run release-ready quality gates across function, UX, and rollout. Use before any release, merge to main, or demo. |
| `review-playbook` | Best practices for running fast, kind, effective code reviews. Use when setting team review culture. |
| `security-audit` | Hunt OWASP-style vulnerabilities with severity and concrete fixes. Use when auditing auth, inputs, secrets, or before releases. |
| `tdd-workflow` | Drive development red-green-refactor in tiny verifiable loops. Use when building features test-first or fixing bugs with regression proof. |
| `test-generator` | Generate focused unit, integration, and e2e tests with clear arrange-act-assert. Use when adding tests for new or uncovered code. |

Install: Copy-Item -Recurse skills/<name> .agents/skills/ - full file: skills/<name>/SKILL.md

# quality-testing

Prove it works: tests, reviews, QA, performance, security.

| Skill | Type | Use it when |
|---|---|---|
| `code-review` | skill | Perform thorough actionable code reviews with severity-ranked findings. Use when reviewing a diff, PR, or uncommitted changes. |
| `load-test` | skill | Load test with scenarios, thresholds, and bottlenecks. Use before launches. |
| `perf-profile` | skill | Measure first, then optimize hot paths with before-after proof. Use when facing slowness, timeouts, or high resource usage. |
| `playwright-e2e` | skill | Test web flows with Playwright locators and CI runs. Use for browser testing. |
| `qa-checklist` | skill | Run release-ready quality gates across function, UX, and rollout. Use before any release, merge to main, or demo. |
| `review-playbook` | skill | Best practices for running fast, kind, effective code reviews. Use when setting team review culture. |
| `security-audit` | skill | Hunt OWASP-style vulnerabilities with severity and concrete fixes. Use when auditing auth, inputs, secrets, or before releases. |
| `tdd-workflow` | skill | Drive development red-green-refactor in tiny verifiable loops. Use when building features test-first or fixing bugs with regression proof. |
| `test-generator` | skill | Generate focused unit, integration, and e2e tests with clear arrange-act-assert. Use when adding tests for new or uncovered code. |

Install: Copy-Item -Recurse skills/<name> .agents/skills/ - full file: `skills/<name>/SKILL.md`

Workflows (plays) live on the [workflows](workflows.md) page.

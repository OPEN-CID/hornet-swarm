---
name: code-review
description: Perform thorough actionable code reviews with severity-ranked findings. Use when reviewing a diff, PR, or uncommitted changes.
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: quality-testing
  version: 0.1.0
  author: hornet-swarm
---

## What I do

- Review diffs for correctness, security, performance, and maintainability
- Rank findings by severity (blocker / major / minor / nit) with file:line evidence
- Propose minimal fixes and verification steps

## When to use me

Use when:

- User asks to review a diff, PR, branch, or uncommitted changes
- Pre-commit / pre-push quality gate

Don't use when:

- Writing the code itself (build first, then review); generating tests (see `test-generator` roadmap skill)

## Workflow

1. **Inspect** — get the diff: `git diff`, `git diff --cached`, `git diff main...HEAD`, or the PR diff. Read the full changed files around each hunk — never review from filenames alone.
2. **Plan** — check: correctness (logic/edge cases), security (injection, secrets, auth), performance (complexity, N+1, allocations), readability (naming, duplication). Note scope limits if diff is large.
3. **Execute** — list findings ordered by severity, each with `file:line`, what is wrong, why it matters, and a concrete fix or diff snippet.
4. **Verify** — give a verdict: `approve` / `approve-with-nits` / `request-changes`; list suggested test/build commands to re-check.

## Rules / Constraints

- MUST: base every finding on read evidence (`file:line`); no speculation without marking it as such.
- MUST: distinguish blockers from nits; max 10 findings, most severe first.
- MUST NOT: rewrite entire files; propose minimal edits.

## Output format

```markdown
## Verdict: <approve | approve-with-nits | request-changes>

### Blockers
- `path:line` — issue — fix: ...

### Major / Minor / Nits
- ...

### Verification
- [ ] suggested commands: ...
```

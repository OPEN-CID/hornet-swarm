---
name: pr-create
description: Open focused reviewable pull requests with context and test proof. Use when the branch is ready for review or merge.
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: git-release
  version: 0.1.0
  author: hornet-swarm
---

## What I do

- Verify the branch is clean, tested, and rebased before opening
- Write a PR with what/why, scope, test proof, and rollout notes
- Provide the exact create command for review

## When to use me

Use when:

- The branch is ready for review or merge
- Splitting a large branch into reviewable PRs

Don't use when:

- Code is still untested or mixes unrelated concerns (split first)

## Workflow

1. **Inspect** — run `git status --short`, `git log --oneline main...HEAD`, `git diff --stat`. Run tests.
2. **Plan** — confirm scope is one concern; draft title (conventional, imperative), summary, breaking changes, screenshots if UI.
3. **Execute** — push branch, draft body: context, changes, test evidence, rollback.
4. **Verify** — show final title + body + `gh pr create` command; request specific reviewers/checks.

## Rules / Constraints

- MUST: tests green and diff reviewed before opening.
- MUST: one concern per PR; state breaking changes and migration plainly.
- MUST NOT: open PRs with secrets, huge generated files, or unreviewed diffs.

## Output format

```markdown
## PR: <title>
- Base: main ← <branch> (`<N>` commits)
- What/why: ...
- Tests: `<command>` → PASS
- Command: `gh pr create --title "..." --body "..."`
```

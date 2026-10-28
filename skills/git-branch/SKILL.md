---
name: git-branch
description: Manage clean focused branches with safe sync and naming. Use when starting work, switching context, or cleaning up branches.
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: git-release
  version: 0.1.0
  author: hornet-swarm
---

## What I do

- Create short-lived branches named `type/short-topic` from the right base
- Sync safely (pull-rebase vs merge) and keep history reviewable
- Clean up merged branches without losing work

## When to use me

Use when:

- Starting work, switching context, or cleaning up branches
- Untangling a branch that mixes unrelated changes

Don't use when:

- Writing the commit message itself (use `git-commit`)

## Workflow

1. **Inspect** — run `git status --short`, `git branch --show-current`, `git log --oneline -5`. Confirm working tree state.
2. **Plan** — pick base (`main` default), name (`feat/`, `fix/`, `chore/` + 2-4 words), and whether to stash or commit WIP first.
3. **Execute** — create/sync: `git checkout -b <name>`, `git fetch && git rebase origin/main` (or merge per team rule).
4. **Verify** — show `git status --short` + `git log --oneline -5`; give cleanup commands for merged branches.

## Rules / Constraints

- MUST: verify clean or safely stashed tree before switching.
- MUST NOT: force-push shared branches or delete unmerged work without confirmation.
- MUST: one concern per branch.

## Output format

```markdown
## Branch: <name> (base: <main>)
- State: <clean/stashed> — `git status --short`
- Sync: <rebase/merge commands run>
- Cleanup: `git branch -d <x>` when merged
```

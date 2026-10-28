---
name: git-commit
description: Craft conventional commits from diffs. Use when the user asks to commit, write a commit message, or clean up VCS history.
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: git-release
  version: 0.1.0
  author: hornet-swarm
---

## What I do

- Inspect staged/unstaged diffs and produce a conventional commit (`type(scope): subject`)
- Split unrelated changes into separate commits when needed
- Provide copy-pasteable git commands, never commit without confirmation

## When to use me

Use when:

- User asks to commit, write a commit message, or check what to commit
- Cleaning up vague messages (`fix stuff`, `wip`)

Don't use when:

- Pushing, tagging, or releasing (see `changelog-release` roadmap skill)

## Workflow

1. **Inspect** — run `git status --short` and `git diff --stat`; then `git diff` (unstaged) / `git diff --cached` (staged). Never inspect via file search alone.
2. **Plan** — group changes by concern. If >1 concern, propose a commit stack. Ask scope/type if ambiguous. Allowed types: `feat, fix, docs, refactor, test, chore, perf, ci, build`.
3. **Execute** — draft message: subject ≤72 chars, imperative mood; body bullets explaining why. Stage explicitly (`git add <paths>`) only after user confirms paths.
4. **Verify** — show final `git status --short` + full message; give command `git commit -m "<msg>"`; never run it unasked. Only commit/push on explicit request.

## Rules / Constraints

- MUST: verify `git status`/`git diff` before drafting.
- MUST NOT: commit, amend, push, or force-push without explicit user request.
- MUST NOT: mix unrelated concerns in one commit; stage only intended files.

## Output format

```text
type(scope): imperative subject <=72 chars

- why/what bullet 1
- bullet 2

Files: <paths>
Command: git add <paths>; git commit -m "type(scope): subject"
```

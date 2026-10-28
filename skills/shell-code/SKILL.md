---
name: shell-code
description: Write safe Bash with strict mode, quoting discipline, and shellcheck-clean code. Use for any shell scripting or review.
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: languages
  version: 1.0.0
  author: hornet-swarm
---

## What I do

- Write idiomatic Bash that passes the project's format, lint, and tests
- Review Bash diffs for style, pitfalls, and architecture fit
- Set up or fix the Bash toolchain (format, lint, test) in any repo

## When to use me

Use when:

- writing or reviewing shell scripts
- setting up shellcheck or bats

Don't use when:

- The task is language-agnostic design (pick the design skill first, implement with me after).
- The repo pins a different toolchain - match the repo, tell me, and I adapt.

## Toolchain

| Step | Command |
|---|---|
| format | `shfmt -w .` |
| lint | `shellcheck` |
| setup | `chmod +x (no install)` |
| test | `bats tests/` |

Run format, then lint, then tests - in that order, every time.

## Style rules

1. shellcheck zero findings, shfmt formatted
2. lowercase locals, UPPER constants
3. double-bracket tests, arithmetic contexts
4. usage on wrong args with exit 2
5. bats tests for logic functions

## Idioms (write like a native)

- set -euo pipefail at the top of every script
- quote every expansion unless splitting intended
- functions for blocks over 5 lines
- readonly for constants, local in functions
- check cd success before relative paths

```bash
set -euo pipefail

main() {
  local dir="${1:?usage: run <dir>}"
  cd "$dir" || exit 1
  printf 'working in %s\n' "$PWD"
}

main "$@"
```

## Architecture patterns

| Pattern | When |
|---|---|
| lib sourced by main | functions testable, main thin |
| usage function plus arg parsing | every script self-documents |
| temp files via mktemp with trap cleanup | no residue |
| flock lock files for cron jobs | never double-run |

## Pitfalls (mistake - fix)

- unquoted variables -- fix: word splitting and globbing
- parsing ls output -- fix: use globs or find
- rm -rf with empty vars -- fix: guard with parameter checks
- curl piped to shell unverified -- fix: pin and hash

## Testing

bats for functions; dry-run flags for destructive scripts.

## Workflow

1. Inspect: read the repo layout, toolchain configs, and neighboring code. Restate the conventions you found.
2. Plan: confirm new file vs edit, pattern choice, and test plan. Flag new dependencies before adding them.
3. Execute: implement in the smallest compiling steps; keep diffs reviewable.
4. Verify: run format, lint, and the affected tests; paste the commands and results.

## Rules / Constraints

- MUST: run the toolchain above (or the repo's pinned equivalent) before calling anything done.
- MUST: match surrounding idioms; no drive-by refactors of unrelated code.
- MUST NOT: add dependencies, change versions, or reformat unrelated files without asking.
- MUST NOT: leave TODOs or dead code in the diff.

## Output format

```text
Files: <paths changed>
Checks: format PASS / lint PASS / tests <cmd> PASS (<n> tests)
Notes: <pattern used, follow-ups if any>
```

## References

- Pair with code-review for the audit pass and repo-structure-guide for layout decisions.

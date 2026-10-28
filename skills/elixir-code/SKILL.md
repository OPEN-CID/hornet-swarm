---
name: elixir-code
description: Write concurrent Elixir with OTP discipline, changesets, and ExUnit proof. Use for any Elixir code or review.
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: languages
  version: 1.0.0
  author: hornet-swarm
---

## What I do

- Write idiomatic Elixir that passes the project's format, lint, and tests
- Review Elixir diffs for style, pitfalls, and architecture fit
- Set up or fix the Elixir toolchain (format, lint, test) in any repo

## When to use me

Use when:

- writing or reviewing Elixir code
- setting up Mix, Credo, or ExUnit

Don't use when:

- The task is language-agnostic design (pick the design skill first, implement with me after).
- The repo pins a different toolchain - match the repo, tell me, and I adapt.

## Toolchain

| Step | Command |
|---|---|
| format | `mix format --check-formatted` |
| lint | `mix credo --strict` |
| setup | `mix deps.get` |
| test | `mix test` |

Run format, then lint, then tests - in that order, every time.

## Style rules

1. mix format enforced, credo strict in CI
2. function heads ordered specific to general
3. moduledoc and doc on public functions
4. no commented-out code
5. doctests for pure examples

## Idioms (write like a native)

- pattern match function heads over conditionals
- pipe operator for data transforms
- with chains for happy-path sequences
- supervisors for recovery, not rescue-all
- changesets validate at the edge

```elixir
def total(%{items: items}) do
  Enum.reduce(items, 0, fn %{cents: c}, acc -> acc + c end)
end
```

## Architecture patterns

| Pattern | When |
|---|---|
| phoenix contexts per domain | web stays thin |
| GenServers own state, tasks own work | never both |
| ecto changesets at boundary | invalid data never reaches repo |
| umbrella apps for bounded contexts | deploy independently |

## Pitfalls (mistake - fix)

- rescuing everything -- fix: let supervisors handle it
- unbounded process spawning -- fix: use pools or backpressure
- N+1 via Ecto -- fix: preload associations
- large binaries copied -- fix: mind binary handling

## Testing

ExUnit plus Mox for boundaries; property tests for parsers.

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

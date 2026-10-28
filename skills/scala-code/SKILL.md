---
name: scala-code
description: Write immutable Scala 3 with ADTs, for-comprehensions, and munit proof. Use for any Scala code or review.
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: languages
  version: 1.0.0
  author: hornet-swarm
---

## What I do

- Write idiomatic Scala that passes the project's format, lint, and tests
- Review Scala diffs for style, pitfalls, and architecture fit
- Set up or fix the Scala toolchain (format, lint, test) in any repo

## When to use me

Use when:

- writing or reviewing Scala code
- setting up sbt builds, scalafmt, or tests

Don't use when:

- The task is language-agnostic design (pick the design skill first, implement with me after).
- The repo pins a different toolchain - match the repo, tell me, and I adapt.

## Toolchain

| Step | Command |
|---|---|
| format | `scalafmt` |
| lint | `scalafix` |
| setup | `sbt compile` |
| test | `sbt test` |

Run format, then lint, then tests - in that order, every time.

## Style rules

1. scalafmt enforced, scalafix in CI
2. indentation syntax (Scala 3) consistently
3. explicit return types on public defs
4. no wildcard imports except given
5. munit suites named by behavior

## Idioms (write like a native)

- val over var, immutable collections by default
- enums and case classes for domain models
- for-comprehensions for effect chains
- given instances for type classes, explicit imports
- Option and Either over nulls and throws

```scala
enum Status:
  case Loading
  case Ready(ids: List[String])

def count(s: Status): Int = s match
  case Status.Loading    => 0
  case Status.Ready(ids) => ids.size
```

## Architecture patterns

| Pattern | When |
|---|---|
| sbt modules by boundary | shared kernel module |
| services as traits with narrow algebras | test with fakes |
| ADTs for domain states | make illegal states unrepresentable |
| opaque types for ids and money | zero-cost safety |

## Pitfalls (mistake - fix)

- nulls from Java interop -- fix: wrap in Option at edge
- implicit resolution puzzles -- fix: keep instances local
- parallel collections on small data -- fix: measure first
- throwing in pure code -- fix: use Either

## Testing

munit plus ScalaCheck for properties.

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
---
name: kotlin-code
description: Write null-safe Kotlin with coroutines discipline and detekt-clean code. Use for any Kotlin code or review.
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: languages
  version: 1.0.0
  author: hornet-swarm
---

## What I do

- Write idiomatic Kotlin that passes the project's format, lint, and tests
- Review Kotlin diffs for style, pitfalls, and architecture fit
- Set up or fix the Kotlin toolchain (format, lint, test) in any repo

## When to use me

Use when:

- writing or reviewing Kotlin code
- setting up Gradle builds, detekt, or tests

Don't use when:

- The task is language-agnostic design (pick the design skill first, implement with me after).
- The repo pins a different toolchain - match the repo, tell me, and I adapt.

## Toolchain

| Step | Command |
|---|---|
| format | `ktlint -F` |
| lint | `detekt` |
| setup | `gradle build -x test` |
| test | `gradle test` |

Run format, then lint, then tests - in that order, every time.

## Style rules

1. ktlint plus detekt clean
2. explicit visibility modifiers
3. expression bodies for single-expression functions
4. no wildcard imports
5. JUnit 5 nested tests by context

## Idioms (write like a native)

- null safety with safe calls and elvis, never double-bang
- data classes for models, sealed for states
- coroutines with structured concurrency
- when expressions over if-else chains
- extension functions for domain vocabulary

```kotlin
data class Order(val id: String, val totalCents: Long)

suspend fun load(id: String): Order? =
    withContext(Dispatchers.IO) { repo.find(id) }
```

## Architecture patterns

| Pattern | When |
|---|---|
| gradle modules by feature | shared code in core module |
| clean layers domain data presentation | depend inward |
| coroutine scopes tied to lifecycle | no GlobalScope |
| sealed interfaces plus exhaustive when for UI state | no illegal screens |

## Pitfalls (mistake - fix)

- double-bang operator -- fix: redesign the nullability
- GlobalScope launches -- fix: scope to lifecycle
- blocking calls in coroutines -- fix: use Dispatchers IO
- platform types from Java -- fix: assert or convert early

## Testing

JUnit 5 plus MockK plus Turbine for flows.

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

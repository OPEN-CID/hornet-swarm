---
name: swift-code
description: Write modern Swift with optionals discipline, value types, and actor-safe concurrency. Use for any Swift code or review.
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: languages
  version: 1.0.0
  author: hornet-swarm
---

## What I do

- Write idiomatic Swift that passes the project's format, lint, and tests
- Review Swift diffs for style, pitfalls, and architecture fit
- Set up or fix the Swift toolchain (format, lint, test) in any repo

## When to use me

Use when:

- writing or reviewing Swift code
- setting up SPM packages or XCTest

Don't use when:

- The task is language-agnostic design (pick the design skill first, implement with me after).
- The repo pins a different toolchain - match the repo, tell me, and I adapt.

## Toolchain

| Step | Command |
|---|---|
| format | `swiftformat .` |
| lint | `xcodebuild build` |
| setup | `swift package resolve` |
| test | `swift test` |

Run format, then lint, then tests - in that order, every time.

## Style rules

1. swift-format clean, zero warnings
2. let over var, access control explicit
3. no force unwrap or try-bang outside tests
4. MARK sections in long files
5. XCTest names test_behavior_condition

## Idioms (write like a native)

- guard let for early exits, map flatMap over force unwrap
- structs for values, classes only for identity
- async await with MainActor for UI updates
- Result for failable domain operations
- extensions for protocol conformance, not dumping grounds

```swift
struct Order: Identifiable {
    let id: String
    var totalCents: Int
}

func total(of orders: [Order]) -> Int {
    orders.reduce(0) { $0 + $1.totalCents }
}
```

## Architecture patterns

| Pattern | When |
|---|---|
| SPM packages by feature | app target stays thin |
| MVVM with SwiftUI state | single source of truth per screen |
| actors for shared mutable state | no locks by hand |
| value-type models with copy-on-write storage | thread-safe by default |

## Pitfalls (mistake - fix)

- force unwrap in prod paths -- fix: bind or throw
- retain cycles in closures -- fix: weak or unowned self
- UI updates off main actor -- fix: annotate MainActor
- AnyObject dictionaries -- fix: model with structs

## Testing

XCTest plus XCUITest for critical flows; test doubles over mocks.

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
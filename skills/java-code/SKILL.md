---
name: java-code
description: Write modern Java with records, sealed types, and java.time. Use for any Java code or review.
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: languages
  version: 1.0.0
  author: hornet-swarm
  language: Java
  triggers: writing or reviewing Java code, setting up Maven or Gradle builds and tests
---

## What I do

- Write idiomatic Java that passes the project's format, lint, and tests
- Review Java diffs for style, pitfalls, and architecture fit
- Set up or fix the Java toolchain (format, lint, test) in any repo

## When to use me

Use when:

- writing or reviewing Java code
- setting up Maven or Gradle builds and tests

Don't use when:

- The task is language-agnostic design (pick the design skill first, implement with me after).
- The repo pins a different toolchain - match the repo, tell me, and I adapt.

## Toolchain

| Step | Command |
|---|---|
| format | `spotless:apply` |
| lint | `checkstyle` |
| setup | `mvn -q -DskipTests package` |
| test | `mvn test` |

Run format, then lint, then tests - in that order, every time.

## Style rules

1. spotless formatted, zero warnings
2. final fields, immutable collection factories
3. no raw types in APIs
4. one top-level type per file matching filename
5. tests named shouldXWhenY

## Idioms (write like a native)

- records for data carriers, sealed hierarchies for states
- streams for transforms, loops for complex control
- Optional as return type, never as field
- try-with-resources for every closeable
- java.time everywhere, never Date

```java
public record Order(String id, long totalCents) {}

public List<String> ids(List<Order> orders) {
    return orders.stream().map(Order::id).toList();
}
```

## Architecture patterns

| Pattern | When |
|---|---|
| layered modules web service repo | dependencies point inward |
| multi-module builds | one module per boundary |
| hexagonal ports for external systems | swap without rewrites |
| records plus sealed plus pattern matching | exhaustiveness checked |

## Pitfalls (mistake - fix)

- null returns -- fix: return Optional or empty collections
- swallowed checked exceptions -- fix: wrap with context
- static mutable state -- fix: inject instead
- parallel streams on IO -- fix: use dedicated pools

## Testing

JUnit 5 plus AssertJ plus Mockito; slice tests over full context.

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
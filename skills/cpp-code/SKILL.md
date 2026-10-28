---
name: cpp-code
description: Write modern C++ (17/20) with RAII, smart pointers, and const-correctness. Use for any C++ code or review.
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: languages
  version: 1.0.0
  author: hornet-swarm
---

## What I do

- Write idiomatic C++ that passes the project's format, lint, and tests
- Review C++ diffs for style, pitfalls, and architecture fit
- Set up or fix the C++ toolchain (format, lint, test) in any repo

## When to use me

Use when:

- writing or reviewing C++ code
- setting up CMake builds, clang-tidy, or sanitizers

Don't use when:

- The task is language-agnostic design (pick the design skill first, implement with me after).
- The repo pins a different toolchain - match the repo, tell me, and I adapt.

## Toolchain

| Step | Command |
|---|---|
| format | `clang-format -i` |
| lint | `clang-tidy` |
| setup | `cmake -S . -B build` |
| test | `ctest --test-dir build` |

Run format, then lint, then tests - in that order, every time.

## Style rules

1. clang-format enforced, clang-tidy in CI
2. const-correct APIs, nodiscard on queries
3. no using namespace in headers
4. braced init, auto only when type is obvious
5. tests per target

## Idioms (write like a native)

- RAII for every resource, smart pointers by default
- const and constexpr aggressively
- string_view and span for non-owning views
- algorithms over raw loops
- noexcept on move operations

```cpp
struct Order {
    std::string id;
    long total_cents = 0;
};

std::optional<Order> find(std::string_view id) {
    if (id.empty()) return std::nullopt;
    return Order{std::string(id)};
}
```

## Architecture patterns

| Pattern | When |
|---|---|
| target-based CMake, one lib per directory | no global includes |
| header-light design for fast compiles |  |
| executable thin over tested libs | logic never lives in main |
| concepts and ranges for generic code | constrain templates early |

## Pitfalls (mistake - fix)

- raw new delete -- fix: use make_unique
- uninitialized members -- fix: brace-init in class
- slicing via value polymorphism -- fix: use references
- exceptions across module boundaries -- fix: document the contract

## Testing

Catch2 or GTest; sanitizers asan plus ubsan in CI.

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
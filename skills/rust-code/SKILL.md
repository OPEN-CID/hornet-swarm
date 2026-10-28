---
name: rust-code
description: Write safe Rust with ownership discipline, Result handling, and clippy-clean code. Use for any Rust code or review.
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: languages
  version: 1.0.0
  author: hornet-swarm
---

## What I do

- Write idiomatic Rust that passes the project's format, lint, and tests
- Review Rust diffs for style, pitfalls, and architecture fit
- Set up or fix the Rust toolchain (format, lint, test) in any repo

## When to use me

Use when:

- writing or reviewing Rust code
- setting up Cargo workspaces, clippy, or tests

Don't use when:

- The task is language-agnostic design (pick the design skill first, implement with me after).
- The repo pins a different toolchain - match the repo, tell me, and I adapt.

## Toolchain

| Step | Command |
|---|---|
| format | `cargo fmt --check` |
| lint | `cargo clippy` |
| setup | `cargo build` |
| test | `cargo test` |

Run format, then lint, then tests - in that order, every time.

## Style rules

1. cargo fmt plus clippy deny-warnings in CI
2. no unwrap or expect outside tests
3. must_use on pure public functions
4. docs on public API with compiling examples
5. small modules, re-export a clean facade

## Idioms (write like a native)

- question-mark operator for propagation, combinators over pyramids
- borrow over clone; clone only at proven boundaries
- newtype pattern for units and ids
- traits for behavior, structs for data
- builder for structs with many options

```rust
pub fn parse(input: &str) -> Result<Config, ParseError> {
    let raw: Raw = toml::from_str(input)?;
    Config::try_from(raw)
}
```

## Architecture patterns

| Pattern | When |
|---|---|
| workspace crates by boundary | one responsibility per crate |
| lib plus thin bin split | logic testable without main |
| error enums | callers match, not parse strings |
| tasks with shutdown token | no orphaned work |

## Pitfalls (mistake - fix)

- unwrap in prod paths -- fix: return Result
- cloning large data in loops -- fix: borrow or restructure
- blocking calls inside async -- fix: use spawn_blocking
- over-generic lifetimes -- fix: elide first, annotate later

## Testing

unit tests in-module, integration in tests/, doc-tests as examples.

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

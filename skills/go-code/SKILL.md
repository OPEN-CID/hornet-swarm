---
name: go-code
description: Write idiomatic Go with wrapped errors, table tests, and race-clean concurrency. Use for any Go code or review.
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: languages
  version: 1.0.0
  author: hornet-swarm
---

## What I do

- Write idiomatic Go that passes the project's format, lint, and tests
- Review Go diffs for style, pitfalls, and architecture fit
- Set up or fix the Go toolchain (format, lint, test) in any repo

## When to use me

Use when:

- writing or reviewing Go code
- setting up Go modules, vet, or tests

Don't use when:

- The task is language-agnostic design (pick the design skill first, implement with me after).
- The repo pins a different toolchain - match the repo, tell me, and I adapt.

## Toolchain

| Step | Command |
|---|---|
| format | `gofmt -l .` |
| lint | `go vet ./...` |
| setup | `go mod tidy` |
| test | `go test -race ./...` |

Run format, then lint, then tests - in that order, every time.

## Style rules

1. gofmt clean, go vet zero findings
2. exported identifiers need doc comments
3. errors as values, panics only for programmer bugs
4. short names only in tiny scopes
5. go test -race in CI

## Idioms (write like a native)

- wrap errors with percent-w verb, check every error
- table-driven tests for branches
- small interfaces defined by consumers
- context as first arg for IO
- defer for cleanup in LIFO order

```go
func Get(ctx context.Context, id string) (User, error) {
  u, err := store.Find(ctx, id)
  if err != nil {
    return User{}, err
  }
  return u, nil
}
```

## Architecture patterns

| Pattern | When |
|---|---|
| standard layout cmd internal pkg | binaries vs libraries |
| handler-service-store | HTTP without framework lock-in |
| graceful shutdown with signal context | clean deploys |
| bounded worker pool | backpressure by default |

## Pitfalls (mistake - fix)

- goroutine leaks -- fix: every go statement needs an exit path
- swallowed errors with blank identifier -- fix: handle or justify
- nil map writes panic -- fix: initialize maps
- time without location -- fix: keep zone info

## Testing

table tests plus httptest plus -race; benchmarks for hot paths.

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
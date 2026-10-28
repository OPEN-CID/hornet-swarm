---
name: csharp-code
description: Write modern C# with records, pattern matching, and async discipline. Use for any C# or .NET code and reviews.
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: languages
  version: 1.0.0
  author: hornet-swarm
---

## What I do

- Write idiomatic C# that passes the project's format, lint, and tests
- Review C# diffs for style, pitfalls, and architecture fit
- Set up or fix the C# toolchain (format, lint, test) in any repo

## When to use me

Use when:

- writing or reviewing C# code
- setting up .NET builds, analyzers, or tests

Don't use when:

- The task is language-agnostic design (pick the design skill first, implement with me after).
- The repo pins a different toolchain - match the repo, tell me, and I adapt.

## Toolchain

| Step | Command |
|---|---|
| format | `dotnet format` |
| lint | `dotnet build -warnaserror` |
| setup | `dotnet restore` |
| test | `dotnet test` |

Run format, then lint, then tests - in that order, every time.

## Style rules

1. editorconfig plus analyzers, warnings as errors in CI
2. nullable reference types enabled, zero warnings
3. file-scoped namespaces
4. primary constructors where they clarify
5. xUnit facts named by behavior

## Idioms (write like a native)

- records for DTOs, required members for invariants
- pattern matching over type-code switches
- async all the way, Async-suffixed Task methods
- LINQ for queries, materialize before multiple passes
- using declarations for disposables

```csharp
public record Order(string Id, decimal Total);

public async Task<Order?> GetAsync(string id, CancellationToken ct) {
    var e = await _db.Orders.FindAsync(new[] { id }, ct);
    return e is null ? null : new Order(e.Id, e.Total);
}
```

## Architecture patterns

| Pattern | When |
|---|---|
| solution with src and tests per project | one deployable per project |
| minimal APIs plus layers | grow to MVC as needed |
| options pattern for config | validated at startup |
| vertical slice folders per feature | scale without layer sprawl |

## Pitfalls (mistake - fix)

- async void outside handlers -- fix: always Task
- null-forgiving operator hiding real nulls -- fix: fix the flow
- enumerating deferred queries twice -- fix: ToList once
- blocking on async with Result -- fix: await instead

## Testing

xUnit plus FluentAssertions; test through public API.

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
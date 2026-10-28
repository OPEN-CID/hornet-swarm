---
name: typescript-code
description: Write strict TypeScript with no-explicit-any, discriminated unions, and vitest proof. Use for any TypeScript code or review.
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: languages
  version: 1.0.0
  author: hornet-swarm
---

## What I do

- Write idiomatic TypeScript that passes the project's format, lint, and tests
- Review TypeScript diffs for style, pitfalls, and architecture fit
- Set up or fix the TypeScript toolchain (format, lint, test) in any repo

## When to use me

Use when:

- writing or reviewing TypeScript code
- setting up TypeScript builds, lint, or tests

Don't use when:

- The task is language-agnostic design (pick the design skill first, implement with me after).
- The repo pins a different toolchain - match the repo, tell me, and I adapt.

## Toolchain

| Step | Command |
|---|---|
| format | `prettier --write .` |
| lint | `eslint .` |
| setup | `npm ci (node pinned via .nvmrc)` |
| test | `vitest run` |

Run format, then lint, then tests - in that order, every time.

## Style rules

1. strict mode, no explicit any in new code
2. unknown plus narrowing instead of any
3. prettier formatting, eslint recommended-type-checked
4. named exports over default except entry points
5. noUncheckedIndexedAccess where affordable

## Idioms (write like a native)

- strict true, narrow with type guards never blind casts
- discriminated unions plus exhaustive switch for states
- branded types for ids
- async await with explicit error boundaries
- readonly data by default, as const for literals

```ts
type State =
  | { kind: 'loading' }
  | { kind: 'ready'; ids: string[] };

function count(s: State): number {
  switch (s.kind) {
    case 'loading': return 0;
    case 'ready': return s.ids.length;
  }
}
```

## Architecture patterns

| Pattern | When |
|---|---|
| feature folders (feature/api,ui,model) | apps over type folders |
| barrel files only at feature roots | avoid export spaghetti |
| API client layer with typed errors | no raw fetch in components |
| monorepo workspaces for shared code | version together |

## Pitfalls (mistake - fix)

- any leaking through boundaries -- fix: type at IO edges
- non-null assertion chains -- fix: guard or handle
- floating promises -- fix: await or handle explicitly
- enums for data -- fix: prefer union literals

## Testing

vitest for units, testing-library for UI; test behavior, not implementation.

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

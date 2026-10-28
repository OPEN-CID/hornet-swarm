---
name: javascript-code
description: Write modern JavaScript (ESM, async await) with eslint-clean style. Use for Node or browser JS code and reviews.
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: languages
  version: 1.0.0
  author: hornet-swarm
---

## What I do

- Write idiomatic JavaScript that passes the project's format, lint, and tests
- Review JavaScript diffs for style, pitfalls, and architecture fit
- Set up or fix the JavaScript toolchain (format, lint, test) in any repo

## When to use me

Use when:

- writing or reviewing JavaScript code
- setting up Node builds, lint, or tests

Don't use when:

- The task is language-agnostic design (pick the design skill first, implement with me after).
- The repo pins a different toolchain - match the repo, tell me, and I adapt.

## Toolchain

| Step | Command |
|---|---|
| format | `prettier --write .` |
| lint | `npx eslint .` |
| setup | `npm ci (node pinned via .nvmrc)` |
| test | `npm test` |

Run format, then lint, then tests - in that order, every time.

## Style rules

1. ESM only in new code, type module or .mjs
2. triple-equals always; no with, no var
3. eslint recommended plus prettier, zero warnings
4. JSDoc on exported functions when no types
5. top-level await only in scripts, not libraries

## Idioms (write like a native)

- const by default, ESM import export everywhere
- async await over nested callbacks
- optional chaining and nullish coalescing for safe access
- URL and Intl APIs over hand-rolled parsing
- structuredClone for deep copies

```js
export async function loadUsers(url) {
  const res = await fetch(url);
  if (!res.ok) throw new Error('load failed: ' + res.status);
  const data = await res.json();
  return data.users ?? [];
}
```

## Architecture patterns

| Pattern | When |
|---|---|
| small modules with one job | keep the require graph shallow |
| dependency injection via function args | test without mocks |
| event emitters for cross-cutting flows | avoid god objects |
| pure core with adapters at edges | test without mocks |

## Pitfalls (mistake - fix)

- double-equals coercion bugs -- fix: always triple-equals
- unhandled promise rejections -- fix: handle every chain
- mutating shared state -- fix: copy on write
- hand-rolled date math -- fix: use a library

## Testing

vitest or node:test; fake timers for time; no real network in units.

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

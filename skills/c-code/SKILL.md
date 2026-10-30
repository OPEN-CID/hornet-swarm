---
name: c-code
description: Write defensive C with -Werror warnings, explicit sizes, and checked errors. Use for any C code or review.
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: languages
  version: 1.0.0
  author: hornet-swarm
  language: C
  triggers: writing or reviewing C code, setting up C builds with warnings and tests
---

## What I do

- Write idiomatic C that passes the project's format, lint, and tests
- Review C diffs for style, pitfalls, and architecture fit
- Set up or fix the C toolchain (format, lint, test) in any repo

## When to use me

Use when:

- writing or reviewing C code
- setting up C builds with warnings and tests

Don't use when:

- The task is language-agnostic design (pick the design skill first, implement with me after).
- The repo pins a different toolchain - match the repo, tell me, and I adapt.

## Toolchain

| Step | Command |
|---|---|
| format | `clang-format -i` |
| lint | `gcc -Wall -Wextra -Werror -fanalyzer` |
| setup | `cmake or make` |
| test | `ctest or make test` |

Run format, then lint, then tests - in that order, every time.

## Style rules

1. -Wall -Wextra -Werror, C11 or later
2. headers self-contained with include guards
3. no missing prototypes
4. one statement per line, early returns
5. module tests with Unity or cmocka

## Idioms (write like a native)

- fixed-width ints at boundaries
- error codes or out-params, never silent failure
- const pointers for read-only data
- single cleanup label for multi-resource functions
- sizeof on objects, not types

```c
int read_all(FILE *f, char *buf, size_t cap, size_t *out) {
    size_t n = fread(buf, 1, cap - 1, f);
    if (ferror(f)) return -1;
    buf[n] = 0;
    *out = n;
    return 0;
}
```

## Architecture patterns

| Pattern | When |
|---|---|
| module per c/h pair | header is the contract |
| opaque structs for encapsulation | heap via create destroy |
| single-owner memory with documented transfer |  |
| arenas and ring buffers for hot paths | no malloc in loops |

## Pitfalls (mistake - fix)

- buffer overflows -- fix: bounded functions plus length checks
- use-after-free -- fix: null after free in debug
- unchecked string functions -- fix: prefer snprintf
- signed unsigned mixups -- fix: mind the warnings

## Testing

Unity or cmocka per module; fuzz parsers.

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
---
name: r-code
description: Write vectorized R with renv reproducibility and testthat proof. Use for any R analysis or package code.
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: languages
  version: 1.0.0
  author: hornet-swarm
  language: R
  triggers: writing or reviewing R code, setting up renv or testthat
---

## What I do

- Write idiomatic R that passes the project's format, lint, and tests
- Review R diffs for style, pitfalls, and architecture fit
- Set up or fix the R toolchain (format, lint, test) in any repo

## When to use me

Use when:

- writing or reviewing R code
- setting up renv or testthat

Don't use when:

- The task is language-agnostic design (pick the design skill first, implement with me after).
- The repo pins a different toolchain - match the repo, tell me, and I adapt.

## Toolchain

| Step | Command |
|---|---|
| format | `styler:::style_dir` |
| lint | `lintr::lint_package` |
| setup | `renv::restore()` |
| test | `testthat::test_local()` |

Run format, then lint, then tests - in that order, every time.

## Style rules

1. styler formatted, lintr clean
2. snake_case functions, dots avoided
3. explicit namespaces pkg::fun in packages
4. roxygen2 docs on exported functions
5. no T/F abbreviations

## Idioms (write like a native)

- vectorize first - loops are the last resort
- tibbles and pipes for readable wrangling
- functions for repeated blocks over 3 lines
- set.seed before any randomness
- here paths, never absolute setwd

```r
summarise_orders <- function(df) {
  df |>
    dplyr::group_by(region) |>
    dplyr::summarise(total = sum(total_cents))
}
```

## Architecture patterns

| Pattern | When |
|---|---|
| R package layout with R tests vignettes | even for analysis |
| targets pipelines for reproducibility | rerun cheap |
| parameterized Rmd reports | one source, many outputs |
| functional pipelines with explicit returns | debug by slicing stages |

## Pitfalls (mistake - fix)

- growing vectors in loops -- fix: preallocate
- attach masking variables -- fix: use with or data pronouns
- factors silently reordering -- fix: set levels explicitly
- unpinned package versions -- fix: use renv

## Testing

testthat 3e; snapshot tests for outputs.

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
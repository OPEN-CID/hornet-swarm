---
name: ruby-code
description: Write idiomatic Ruby with RuboCop-clean style and RSpec proof. Use for Ruby or Rails code and reviews.
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: languages
  version: 1.0.0
  author: hornet-swarm
---

## What I do

- Write idiomatic Ruby that passes the project's format, lint, and tests
- Review Ruby diffs for style, pitfalls, and architecture fit
- Set up or fix the Ruby toolchain (format, lint, test) in any repo

## When to use me

Use when:

- writing or reviewing Ruby code
- setting up RuboCop or RSpec

Don't use when:

- The task is language-agnostic design (pick the design skill first, implement with me after).
- The repo pins a different toolchain - match the repo, tell me, and I adapt.

## Toolchain

| Step | Command |
|---|---|
| format | `rubocop -a` |
| lint | `rubocop` |
| setup | `bundle install` |
| test | `bundle exec rspec` |

Run format, then lint, then tests - in that order, every time.

## Style rules

1. RuboCop clean, double quotes for strings
2. predicate methods end with question mark
3. two-space indent, frozen string literals
4. bang methods only when paired with safe version
5. RSpec one expectation per example

## Idioms (write like a native)

- blocks and enumerables over for loops
- symbols for labels, safe navigation for chains
- keyword arguments for boolean parameters
- fail fast with guard clauses
- time with zone in Rails apps

```ruby
def active_names(users)
  users.select(&:active?)
       .map(&:name)
       .compact
end
```

## Architecture patterns

| Pattern | When |
|---|---|
| MVC by convention | keep models rich via service objects |
| gems for shared behavior | extract at third use |
| background jobs for anything slow | request cycle stays thin |
| value objects for money and ids | primitives rarely |

## Pitfalls (mistake - fix)

- monkey patching core classes -- fix: refine or wrap
- N+1 queries -- fix: eager load associations
- unpinned gems -- fix: commit the lockfile
- logic in views -- fix: helpers or presenters

## Testing

RSpec plus FactoryBot; system specs for critical paths.

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

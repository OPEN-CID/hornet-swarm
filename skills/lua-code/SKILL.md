---
name: lua-code
description: Write clean Lua with locals discipline, 1-index awareness, and busted proof. Use for Lua, Neovim plugins, or game scripting.
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: languages
  version: 1.0.0
  author: hornet-swarm
  language: Lua
  triggers: writing or reviewing Lua code, setting up stylua, luacheck, or busted
---

## What I do

- Write idiomatic Lua that passes the project's format, lint, and tests
- Review Lua diffs for style, pitfalls, and architecture fit
- Set up or fix the Lua toolchain (format, lint, test) in any repo

## When to use me

Use when:

- writing or reviewing Lua code
- setting up stylua, luacheck, or busted

Don't use when:

- The task is language-agnostic design (pick the design skill first, implement with me after).
- The repo pins a different toolchain - match the repo, tell me, and I adapt.

## Toolchain

| Step | Command |
|---|---|
| format | `stylua .` |
| lint | `luacheck .` |
| setup | `luarocks install --only-deps (if rockspec)` |
| test | `busted` |

Run format, then lint, then tests - in that order, every time.

## Style rules

1. stylua formatted, luacheck clean
2. local by default, UPPER for constants
3. short modules, one purpose per file
4. annotations on public functions
5. busted specs by behavior

## Idioms (write like a native)

- local everything - globals only via _G explicitly
- tables for modules, return them at file end
- pairs vs ipairs chosen deliberately
- pcall for risky calls at boundaries
- string.format over concatenation in loops

```lua
local M = {}

function M.total(orders)
  local sum = 0
  for _, o in ipairs(orders) do
    sum = sum + o.cents
  end
  return sum
end

return M
```

## Architecture patterns

| Pattern | When |
|---|---|
| module returns a table | require without globals |
| config tables over long arg lists | defaults merged |
| plugin layout per host | lazy-load friendly |
| sandboxed configs with load and environments | user code cannot escape |

## Pitfalls (mistake - fix)

- accidental globals -- fix: luacheck will catch
- nil indexing -- fix: guard nested access
- zero-index habits -- fix: Lua arrays start at 1
- float loop counters -- fix: use integers

## Testing

busted; specs colocated in spec/.

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
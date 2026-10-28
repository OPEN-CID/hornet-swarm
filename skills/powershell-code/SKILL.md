---
name: powershell-code
description: Write pipeline-friendly PowerShell with approved verbs, Pester tests, and analyzer-clean code. Use for any PowerShell code or review.
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: languages
  version: 1.0.0
  author: hornet-swarm
---

## What I do

- Write idiomatic PowerShell that passes the project's format, lint, and tests
- Review PowerShell diffs for style, pitfalls, and architecture fit
- Set up or fix the PowerShell toolchain (format, lint, test) in any repo

## When to use me

Use when:

- writing or reviewing PowerShell code
- setting up PSScriptAnalyzer or Pester

Don't use when:

- The task is language-agnostic design (pick the design skill first, implement with me after).
- The repo pins a different toolchain - match the repo, tell me, and I adapt.

## Toolchain

| Step | Command |
|---|---|
| format | `Invoke-Formatter` |
| lint | `Invoke-ScriptAnalyzer` |
| setup | `Import-Module ./Module.psd1` |
| test | `Invoke-Pester` |

Run format, then lint, then tests - in that order, every time.

## Style rules

1. PSScriptAnalyzer zero findings
2. full cmdlet and parameter names in scripts
3. comment-based help on exported functions
4. PascalCase functions, camelCase locals
5. Pester tests per exported function

## Idioms (write like a native)

- approved verbs for function names
- pipeline objects over formatted text
- splatting for long parameter sets
- Should-Process support for destructive cmdlets
- strict mode plus ErrorAction Stop in scripts

```powershell
function Get-StaleService {
    [CmdletBinding()]
    param([int]$OlderThanDays = 30)
    Get-Service | Where-Object { $_.Status -eq 'Stopped' }
}
```

## Architecture patterns

| Pattern | When |
|---|---|
| module with manifest | functions-to-export explicit |
| advanced functions with CmdletBinding | pipeline in, objects out |
| begin process end blocks | stream, do not accumulate |
| declarative wrappers for repeatable config | converge not script |

## Pitfalls (mistake - fix)

- Write-Host for data -- fix: output objects instead
- uninitialized variables -- fix: use Set-StrictMode latest
- double-equals is case-insensitive -- fix: use -ceq when it matters
- aliases in saved scripts -- fix: full cmdlet names

## Testing

Pester 5; test pipeline input and -WhatIf paths.

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

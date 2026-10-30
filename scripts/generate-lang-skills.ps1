<#
.SYNOPSIS
  Generate language skills from catalog/languages*.json (rich per-language data).
  Literal token replacement so code samples render exactly.
.EXAMPLE
  powershell scripts/generate-lang-skills.ps1
#>

$ErrorActionPreference = "Stop"
$RepoRoot = Split-Path -Parent $PSScriptRoot
$CatalogDir = Join-Path $RepoRoot "catalog"
$UTF8NoBom = New-Object System.Text.UTF8Encoding $false
function Read-UTF8([string]$p) { return [System.IO.File]::ReadAllText($p, [System.Text.Encoding]::UTF8) }
function Write-UTF8([string]$p, [string]$c) { [System.IO.File]::WriteAllText($p, $c, $UTF8NoBom) }

$Template = @'
__FM__

## What I do

- Write idiomatic __LANG__ that passes the project's format, lint, and tests
- Review __LANG__ diffs for style, pitfalls, and architecture fit
- Set up or fix the __LANG__ toolchain (format, lint, test) in any repo

## When to use me

Use when:

__TRIGS__

Don't use when:

- The task is language-agnostic design (pick the design skill first, implement with me after).
- The repo pins a different toolchain - match the repo, tell me, and I adapt.

## Toolchain

| Step | Command |
|---|---|
__TOOLCHAIN__

Run format, then lint, then tests - in that order, every time.

## Style rules

__STYLE__

## Idioms (write like a native)

__IDIOMS__

```__SAMPLE_TAG__
__SAMPLE_CODE__
```

## Architecture patterns

| Pattern | When |
|---|---|
__ARCH__

## Pitfalls (mistake - fix)

__PIT__

## Testing

__TESTING__

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
'@

$entries = @()
$LangDir = Join-Path $CatalogDir "languages"
foreach ($f in Get-ChildItem -Path $LangDir -Filter *.json) {
  $s = Read-UTF8 $f.FullName | ConvertFrom-Json
  $entries += $s
}

$made = 0
foreach ($s in $entries) {
  $dir = Join-Path $RepoRoot ("skills/" + $s.name)
  $file = Join-Path $dir "SKILL.md"
  New-Item -ItemType Directory -Force -Path $dir | Out-Null
  $chain = @()
  foreach ($p in $s.toolchain.PSObject.Properties) { $chain += "| $($p.Name) | ``$($p.Value)`` |" }
  $trigLine = (($s.triggers | ForEach-Object { "$_" }) -join ", ")
  $fm = "---`nname: $($s.name)`ndescription: $($s.description)`nlicense: MIT`ncompatibility: opencode, claude-code, cursor, copilot, generic`nmetadata:`n  category: $($s.category)`n  version: 1.0.0`n  author: hornet-swarm`n  language: $($s.language)`n  triggers: $trigLine`n---"
  $body = $Template.Replace('__FM__', $fm)
  $body = $body.Replace('__LANG__', $s.language)
  $body = $body.Replace('__TRIGS__', (($s.triggers | ForEach-Object { "- $_" }) -join "`n"))
  $body = $body.Replace('__TOOLCHAIN__', ($chain -join "`n"))
  $styleLines = @()
  $i = 0
  foreach ($t in $s.style) { $i++; $styleLines += "$i. $t" }
  $body = $body.Replace('__STYLE__', ($styleLines -join "`n"))
  $body = $body.Replace('__IDIOMS__', ((($s.idioms | ForEach-Object { "- $_" }) -join "`n")))
  $archLines = @()
  foreach ($a in $s.arch) {
    $parts = $a -split ' - ', 2
    $archLines += "| $($parts[0]) | $($parts[1]) |"
  }
  $body = $body.Replace('__ARCH__', ($archLines -join "`n"))
  $pitLines = @()
  foreach ($p in $s.pitfalls) {
    $parts = $p -split ' - ', 2
    $pitLines += "- $($parts[0]) -- fix: $($parts[1])"
  }
  $body = $body.Replace('__PIT__', ($pitLines -join "`n"))
  $body = $body.Replace('__TESTING__', $s.testing)
  $body = $body.Replace('__SAMPLE_TAG__', $s.sample.tag)
  $body = $body.Replace('__SAMPLE_CODE__', $s.sample.code)
  Write-UTF8 $file $body
  $made++
}
Write-Output "language skills generated: $made"

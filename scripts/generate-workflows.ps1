<#
.SYNOPSIS
  Generate workflow skills from catalog/workflows.json (plays that run skills in order).
  A workflow IS a skill: same SKILL.md spec, stored under workflows/<name>/.
  Steps reference existing skills by name; their descriptions are inlined.
#>

$ErrorActionPreference = "Stop"
$RepoRoot = Split-Path -Parent $PSScriptRoot
$CatalogDir = Join-Path $RepoRoot "catalog"
$UTF8NoBom = New-Object System.Text.UTF8Encoding $false
function Read-UTF8([string]$p) { return [System.IO.File]::ReadAllText($p, [System.Text.Encoding]::UTF8) }
function Write-UTF8([string]$p, [string]$c) { [System.IO.File]::WriteAllText($p, $c, $UTF8NoBom) }

function Yq([string]$v) {
  return '"' + (($v -replace '\\', '\\') -replace '"', '\"') + '"'
}
function Unq([string]$v) {
  $t = $v.Trim()
  if ($t.Length -ge 2 -and $t.StartsWith('"') -and $t.EndsWith('"')) {
    $t = $t.Substring(1, $t.Length - 2) -replace '\\"','"' -replace '\\\\','\'
  }
  return $t
}
function Get-SkillDesc([string]$name) {
  foreach ($d in @("skills", "workflows")) {
    $f = Join-Path $RepoRoot "$d/$name/SKILL.md"
    if (Test-Path -LiteralPath $f) {
      $raw = Read-UTF8 $f
      $m = [regex]::Match($raw, '(?s)^---\s*\r?\n(.*?)\r?\n---')
      if ($m.Success) {
        $dm = [regex]::Match($m.Groups[1].Value, '^\s*description:\s*(.+?)\s*$', 'Multiline')
        if ($dm.Success) { return Unq $dm.Groups[1].Value.Trim() }
      }
    }
  }
  return "see skills/$name/SKILL.md"
}

$Template = @'
__FM__

## What I do

__OUTS__

This is a workflow: I play __N__ skills in order, carrying each step's output into the next. Do not skip steps; each gate exists for a reason.

## When to use me

Use when:

__TRIGS__

Don't use when:

- You only need one of the steps below - load that skill directly instead.
- The situation changed mid-play - stop, restate, and re-plan rather than forcing the sequence.

## Workflow

The play, in order:

| # | Skill | Job | Handoff |
|---|---|---|---|
__ROWS__

How to run me:
1. Start at step 1. Load that skill fully (read its SKILL.md) and complete it.
2. Carry its artifact into the next step as input - never redo completed work.
3. If a step returns a NO-GO / FIX-FIRST / fail verdict, stop the play and fix it before continuing.
4. Review-type steps are gates: nothing moves past them red.

## Rules / Constraints

- MUST: run steps in order; each step's output is the next step's input.
- MUST: load the full SKILL.md of each step - summaries are not enough.
- MUST NOT: skip verification or review steps to go faster.
- MUST NOT: invent outputs for a step you did not run.

## Output format

```text
__ARTIFACT__
- Steps run: <names in order>
- Step artifacts: <one line each>
- Confidence: <high/medium/low + what would raise it>
```

## References

- Steps live in skills/<name>/SKILL.md (loaded on demand, never pasted here).
- If the play grows new branches, split it: propose a new workflow, don't bloat this one.
'@

$entries = @()
foreach ($f in Get-ChildItem -Path $CatalogDir -Filter workflows*.json) {
  $wf = Read-UTF8 $f.FullName | ConvertFrom-Json
  foreach ($s in $wf.workflows) { $entries += $s }
}
$made = 0
foreach ($s in $entries) {
  $dir = Join-Path $RepoRoot ("workflows/" + $s.name)
  $file = Join-Path $dir "SKILL.md"
  New-Item -ItemType Directory -Force -Path $dir | Out-Null
  $trigLine = (($s.triggers | ForEach-Object { "$_" }) -join ", ")
  $stepLine = (($s.steps | ForEach-Object { "$_" }) -join ", ")
  $fm = "---`nname: $($s.name)`ndescription: $(Yq $s.description)`nlicense: MIT`ncompatibility: opencode, claude-code, cursor, copilot, generic`nmetadata:`n  category: $($s.category)`n  version: 1.0.0`n  author: hornet-swarm`n  kind: workflow`n  triggers: $(Yq $trigLine)`n  steps: $(Yq $stepLine)`n---"
  $rows = @()
  $i = 0
  foreach ($st in $s.steps) {
    $i++
    $desc = Get-SkillDesc $st
    $rows += "| $i | ``$st`` | $desc | artifact feeds step $($i + 1) |"
  }
  $body = $Template.Replace('__FM__', $fm)
  $body = $body.Replace('__OUTS__', ((($s.outcomes | ForEach-Object { "- $_" }) -join "`n")))
  $body = $body.Replace('__N__', "$($s.steps.Count)")
  $body = $body.Replace('__TRIGS__', ((($s.triggers | ForEach-Object { "- $_" }) -join "`n")))
  $body = $body.Replace('__ROWS__', (($rows -join "`n")))
  $body = $body.Replace('__ARTIFACT__', $s.artifact)
  Write-UTF8 $file $body
  $made++
}
Write-Output "workflows generated: $made"

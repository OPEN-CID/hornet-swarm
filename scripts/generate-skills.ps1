<#
.SYNOPSIS
  Generate detailed SKILL.md files from catalog/*.json (the skill factory).
  Skips skills that already have a hand-written SKILL.md unless -Force.
  Uses literal token replacement so backticks and $ in data render exactly.
.EXAMPLE
  powershell scripts/generate-skills.ps1
  powershell scripts/generate-skills.ps1 -Force
#>
param([switch]$Force)

$ErrorActionPreference = "Stop"
$RepoRoot = Split-Path -Parent $PSScriptRoot
$CatalogDir = Join-Path $RepoRoot "catalog"
$UTF8NoBom = New-Object System.Text.UTF8Encoding $false
function Read-UTF8([string]$p) { return [System.IO.File]::ReadAllText($p, [System.Text.Encoding]::UTF8) }
function Write-UTF8([string]$p, [string]$c) { [System.IO.File]::WriteAllText($p, $c, $UTF8NoBom) }

$KindWorkflow = @{
  parse = @(
    "Collect: ask the user to paste text or attach the file/image; if only part is available, work with that part and say so.",
    "Extract: pull every required field into a table (Field | Value quoted | Source location). Mark illegible or missing fields as UNKNOWN, never guess.",
    "Normalize: convert units, dates, and names to one consistent format; keep the original value beside each conversion.",
    "Cross-check: flag conflicts between sections (totals vs line items, dates vs versions); list each conflict with both quotes.",
    "Deliver: produce the artifact below plus a trace table so anyone can verify each value in seconds."
  )
  review = @(
    "Scope: confirm what is under review and what good looks like; list what you will NOT judge.",
    "Evidence pass: read the whole artifact, collecting findings with exact quotes or file:line for each.",
    "Rank: sort into blocker (must fix), major (should fix), minor/nit. Cut anything beyond the top 10.",
    "Fix proposals: give a concrete correction for every blocker and major; show before/after where it helps.",
    "Verdict: GO, FIX-FIRST (list blockers), or NO-GO, plus what to re-check after fixes."
  )
  playbook = @(
    "Principles: state the 3-5 rules experts follow and why each one pays off.",
    "Starter routine: give the smallest weekly/daily loop a beginner can run from today.",
    "Do / Don't: concrete behaviors with examples, not slogans.",
    "Anti-patterns: the 3 common failure modes, how to spot each, and the escape move.",
    "Adopt: first-30-days plan with one measurable check per week."
  )
  translate = @(
    "Audience: ask who it is for (age, background); match vocabulary and sentence length to them.",
    "Plain version: rewrite the meaning with zero jargon, keeping every number and name exact.",
    "Rebuild layers: add one layer of precision back (student, practitioner) so nothing is lost.",
    "Glossary: term table with original, plain meaning, and why it matters.",
    "Next questions: 3 questions the reader should now ask the expert, in their own words."
  )
  task = @(
    "Inspect: gather the real inputs first (files, numbers, constraints); restate what you found.",
    "Plan: propose the approach and the definition of done; ask clarifying questions when ambiguous.",
    "Execute: do the work in smallest verifiable steps, cheapest test first.",
    "Verify: check the result against the definition of done; show evidence, not claims."
  )
}

$KindRules = @{
  parse = @(
    "MUST: quote exact source values; mark UNKNOWN instead of guessing.",
    "MUST: keep a source-to-field trace so every value is verifiable.",
    "MUST NOT: invent missing pages, values, or signatures."
  )
  review = @(
    "MUST: every finding has evidence (quote or file:line).",
    "MUST: rank by severity; max 10 findings, blockers first.",
    "MUST NOT: rewrite the whole artifact; propose minimal fixes."
  )
  playbook = @(
    "MUST: every principle has a concrete example.",
    "MUST: include a starter routine runnable this week.",
    "MUST NOT: generic motivation with no actionable steps."
  )
  translate = @(
    "MUST: keep all numbers, names, and doses character-identical.",
    "MUST: match reading level to the stated audience.",
    "MUST NOT: drop warnings, risks, or side effects while simplifying."
  )
  task = @(
    "MUST: verify inputs before acting; smallest steps first.",
    "MUST: show evidence for the result.",
    "MUST NOT: invent sources, URLs, or data."
  )
}

function Get-Kind([string]$name) {
  if ($name -match '-parse$') { return 'parse' }
  if ($name -match '-review$') { return 'review' }
  if ($name -match '-playbook$') { return 'playbook' }
  if ($name -match '(-translate|-explain)$') { return 'translate' }
  return 'task'
}

$SafetyNote = @{
  'medical-health' = "> Information only: never a diagnosis, dose change, or treatment decision. Confirm anything medical with a qualified clinician or pharmacist."
  'legal-finance'  = "> General information only: not legal, tax, or financial advice. Confirm consequential decisions with a licensed professional."
  'parenting'      = "> Family information only: for health or developmental concerns, consult your pediatrician or a qualified professional."
  'fitness'        = "> General fitness information: for injuries, pregnancy, or medical conditions, consult a qualified professional first."
  'safety'         = "> Emergency information only: call local emergency services first. Get certified training for first aid, CPR, and rescue skills."
  'wealth'         = "> General educational information only: not financial or investment advice."
  'law-life'       = "> General information only: not legal advice. Confirm consequential matters with a licensed professional."
  'outdoors'       = "> Outdoor activities carry real risk: check local conditions, carry essentials, and get qualified instruction for technical skills."
  'vehicles'       = "> Safety first: protective gear, licensed training, and professional mechanics for anything beyond basic maintenance."
  'pets'           = "> General care information: for illness or emergencies, consult your veterinarian."
  'cooking'        = "> Cook to safe temperatures, respect allergies, and when in doubt throw it out."
}

$Template = @'
__FM__

## What I do

__OUTS__

__SAFETY__
## When to use me

Use when:

__TRIGS__

Don't use when:

- The request is outside this skill's job. Say so and point to the right skill if you know it.
- You lack the source material this task needs. Ask for it first instead of guessing.

## Workflow

__WF__

## Rules / Constraints

__RULES__

## Output format

```text
__ARTIFACT__
- Sources checked: <what you read>
- Confidence: <high/medium/low + what would raise it>
```

## References

- No extra files by default. If the task grows complex, split it: parse first, then review, then act.
'@

$entries = @()
foreach ($f in Get-ChildItem -Path $CatalogDir -Filter *.json) {
  $rawJson = Read-UTF8 $f.FullName
  $json = $rawJson | ConvertFrom-Json
  foreach ($s in $json.skills) { $entries += $s }
}

$made = 0; $skipped = 0
foreach ($s in $entries) {
  if ($s.category -eq 'languages') { continue }
  $dir = Join-Path $RepoRoot ("skills/" + $s.name)
  $file = Join-Path $dir "SKILL.md"
  if ((Test-Path -LiteralPath $file) -and -not $Force) { $skipped++; continue }
  New-Item -ItemType Directory -Force -Path $dir | Out-Null
  $kind = Get-Kind $s.name
  $steps = @()
  $i = 0
  foreach ($w in $KindWorkflow[$kind]) { $i++; $steps += "$i. $w" }
  $safety = $SafetyNote[$s.category]
  if ($null -eq $safety) { $safety = "" } else { $safety = $safety + "`n`n" }
  $trigLine = (($s.triggers | ForEach-Object { "$_" }) -join ", ")
  $fm = "---`nname: $($s.name)`ndescription: $($s.description)`nlicense: MIT`ncompatibility: opencode, claude-code, cursor, copilot, generic`nmetadata:`n  category: $($s.category)`n  version: 1.0.0`n  author: hornet-swarm`n  triggers: $trigLine`n---"
  $body = $Template.Replace('__FM__', $fm)
  $body = $body.Replace('__OUTS__', (($s.outcomes | ForEach-Object { "- $_" }) -join "`n"))
  $body = $body.Replace('__SAFETY__', $safety)
  $body = $body.Replace('__TRIGS__', (($s.triggers | ForEach-Object { "- $_" }) -join "`n"))
  $body = $body.Replace('__WF__', ($steps -join "`n"))
  $body = $body.Replace('__RULES__', ($KindRules[$kind] -join "`n"))
  $body = $body.Replace('__ARTIFACT__', $s.artifact)
  Write-UTF8 $file $body
  $made++
}
Write-Output "generated: $made, skipped (hand-written): $skipped"

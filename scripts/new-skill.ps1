<#
.SYNOPSIS
  Scaffold one new skill: answer 6 prompts, append to catalog/custom.json, generate it.
.EXAMPLE
  powershell scripts/new-skill.ps1
#>
$ErrorActionPreference = "Stop"
$RepoRoot = Split-Path -Parent $PSScriptRoot
$name = (Read-Host "skill name (kebab-case)").Trim().ToLower()
if ($name -cnotmatch '^[a-z0-9]+(-[a-z0-9]+)*$') { throw "bad name: $name" }
$category = (Read-Host "category key (e.g. home-life)").Trim()
$desc = (Read-Host "description = WHAT + WHEN (1 sentence each)").Trim()
$o1 = (Read-Host "outcome 1"); $o2 = (Read-Host "outcome 2"); $o3 = (Read-Host "outcome 3")
$trig = (Read-Host "trigger (when to use)")
$art = (Read-Host "output artifact (first line)")
$entry = [ordered]@{ name=$name; category=$category; description=$desc; outcomes=@($o1,$o2,$o3); triggers=@($trig); artifact=$art }
$customPath = Join-Path $RepoRoot "catalog/custom.json"
if (Test-Path -LiteralPath $customPath) {
  $c = Get-Content -LiteralPath $customPath -Raw | ConvertFrom-Json
  $c.skills += $entry
  $out = [ordered]@{ '$schema'=$c.'$schema'; generator="scripts/generate-skills.ps1"; version=$c.version; skills=$c.skills }
} else {
  $out = [ordered]@{ '$schema'="https://json-schema.org/draft/2020-12/schema"; generator="scripts/generate-skills.ps1"; version="1.0.0"; skills=@($entry) }
}
$out | ConvertTo-Json -Depth 5 | Set-Content -LiteralPath $customPath -Encoding UTF8
& (Join-Path $RepoRoot "scripts/generate-skills.ps1")
& (Join-Path $RepoRoot "scripts/rebuild-registry.ps1")
Write-Output "created skills/$name - now run validate: powershell scripts/validate.ps1 -Skill $name"

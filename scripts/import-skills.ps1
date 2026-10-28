<#
.SYNOPSIS
  Import skills from a CSV file (spreadsheet-friendly intake, no JSON needed).
  Columns: name,category,description,outcomes,triggers,artifact
  Use | to separate multiple outcomes/triggers inside one cell.
.EXAMPLE
  powershell scripts/import-skills.ps1 -Csv templates/skills.csv
  powershell scripts/import-skills.ps1 -Csv my-skills.csv -Out catalog/imports.json
#>
param(
  [string]$Csv = "templates/skills.csv",
  [string]$Out = "catalog/imports.json"
)

$ErrorActionPreference = "Stop"
$RepoRoot = Split-Path -Parent $PSScriptRoot
$UTF8NoBom = New-Object System.Text.UTF8Encoding $false
$csvPath = Join-Path $RepoRoot $Csv
$outPath = Join-Path $RepoRoot $Out
if (-not (Test-Path -LiteralPath $csvPath)) { throw "CSV not found: $csvPath" }

$rows = Import-Csv -LiteralPath $csvPath -Encoding UTF8
$skills = @()
foreach ($r in $rows) {
  $nm = $r.name.Trim().ToLower()
  if ($nm -cnotmatch '^[a-z0-9]+(-[a-z0-9]+)*$') { Write-Warning "skip bad name: $($r.name)"; continue }
  if ([string]::IsNullOrWhiteSpace($r.description)) { Write-Warning "skip empty description: $nm"; continue }
  $skills += [ordered]@{
    name = $nm
    category = $r.category.Trim()
    description = $r.description.Trim()
    outcomes = @($r.outcomes -split '\|' | ForEach-Object { $_.Trim() } | Where-Object { $_ })
    triggers = @($r.triggers -split '\|' | ForEach-Object { $_.Trim() } | Where-Object { $_ })
    artifact = $r.artifact.Trim()
  }
}
if ($skills.Count -eq 0) { throw "no valid rows in $Csv" }

$existing = @()
if (Test-Path -LiteralPath $outPath) {
  $cur = [System.IO.File]::ReadAllText($outPath, [System.Text.Encoding]::UTF8) | ConvertFrom-Json
  $existing = @($cur.skills)
}
$merged = @($existing) + @($skills)
$doc = [ordered]@{
  '$schema' = "https://json-schema.org/draft/2020-12/schema"
  generator = "scripts/generate-skills.ps1"
  version = "1.0.0"
  skills = $merged
}
[System.IO.File]::WriteAllText($outPath, ($doc | ConvertTo-Json -Depth 5), $UTF8NoBom)
Write-Output "imported $($skills.Count) rows into $Out"
& (Join-Path $RepoRoot "scripts/generate-skills.ps1")
& (Join-Path $RepoRoot "scripts/rebuild-registry.ps1")
Write-Output "next: run generate-wiki.ps1 and validate.ps1"

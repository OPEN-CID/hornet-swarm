<#
.SYNOPSIS
  Export registry.json to site/skills.json (compact catalog for the website).
#>

$ErrorActionPreference = "Stop"
$RepoRoot = Split-Path -Parent $PSScriptRoot
$UTF8NoBom = New-Object System.Text.UTF8Encoding $false
$reg = [System.IO.File]::ReadAllText((Join-Path $RepoRoot "registry.json"), [System.Text.Encoding]::UTF8) | ConvertFrom-Json
$items = foreach ($s in ($reg.skills | Sort-Object name)) {
  [ordered]@{
    n = $s.name
    d = $s.description
    c = $s.category
    k = if ($s.kind -eq "workflow") { "workflow" } else { "skill" }
    t = @($s.triggers)
    p = $s.path
  }
}
$json = $items | ConvertTo-Json -Depth 4 -Compress
[System.IO.File]::WriteAllText((Join-Path $RepoRoot "site/skills.json"), $json, $UTF8NoBom)
Write-Output "site data exported: $($items.Count) entries"

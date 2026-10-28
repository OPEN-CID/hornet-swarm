<#
.SYNOPSIS
  Rebuild registry.json from all skills/*/SKILL.md frontmatter (sorted by name).
#>
$ErrorActionPreference = "Stop"
$RepoRoot = Split-Path -Parent $PSScriptRoot
$items = @()
foreach ($d in Get-ChildItem -Directory (Join-Path $RepoRoot "skills")) {
  $file = Join-Path $d.FullName "SKILL.md"
  if (-not (Test-Path -LiteralPath $file)) { continue }
  $raw = Get-Content -LiteralPath $file -Raw
  if ($raw -notmatch '(?s)^---\s*\r?\n(.*?)\r?\n---') { Write-Warning "no frontmatter: $($d.Name)"; continue }
  $fm = $Matches[1]
  $n = [regex]::Match($fm, '^\s*name:\s*(.+?)\s*$', 'Multiline')
  $ds = [regex]::Match($fm, '^\s*description:\s*(.+?)\s*$', 'Multiline')
  $c = [regex]::Match($fm, '^\s*category:\s*(.+?)\s*$', 'Multiline')
  $v = [regex]::Match($fm, '^\s*version:\s*(.+?)\s*$', 'Multiline')
  $items += [ordered]@{
    name = if ($n.Success) { $n.Groups[1].Value.Trim() } else { $d.Name }
    description = if ($ds.Success) { $ds.Groups[1].Value.Trim() } else { "" }
    category = if ($c.Success) { $c.Groups[1].Value.Trim() } else { "uncategorized" }
    path = "skills/$($d.Name)/SKILL.md"
    version = if ($v.Success) { $v.Groups[1].Value.Trim() } else { "0.1.0" }
  }
}
$items = $items | Sort-Object { $_['name'] }
$reg = [ordered]@{
  '$schema' = "https://json-schema.org/draft/2020-12/schema"
  name = "hornet-swarm-registry"
  version = "1.0.0"
  spec = "anthropic-agent-skills"
  count = $items.Count
  skills = $items
}
$reg | ConvertTo-Json -Depth 5 | Set-Content -LiteralPath (Join-Path $RepoRoot "registry.json") -Encoding UTF8
Write-Output "registry rebuilt: $($items.Count) skills"

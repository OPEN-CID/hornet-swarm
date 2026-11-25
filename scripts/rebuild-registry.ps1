<#
.SYNOPSIS
  Rebuild registry.json from all skills/*/SKILL.md frontmatter (sorted by name).
#>
$ErrorActionPreference = "Stop"
$RepoRoot = Split-Path -Parent $PSScriptRoot
$UTF8NoBom = New-Object System.Text.UTF8Encoding $false
function Read-UTF8([string]$p) { return [System.IO.File]::ReadAllText($p, [System.Text.Encoding]::UTF8) }
function Write-UTF8([string]$p, [string]$c) { [System.IO.File]::WriteAllText($p, $c, $UTF8NoBom) }
function Unquote([string]$v) {
  $t = $v.Trim()
  if ($t.Length -ge 2 -and $t.StartsWith('"') -and $t.EndsWith('"')) {
    $t = $t.Substring(1, $t.Length - 2) -replace '\\"','"' -replace '\\\\','\'
  }
  return $t
}
$items = @()
foreach ($root in @("skills", "workflows")) {
  $kind = if ($root -eq "workflows") { "workflow" } else { "skill" }
  $rp = Join-Path $RepoRoot $root
  if (-not (Test-Path -LiteralPath $rp)) { continue }
  foreach ($d in Get-ChildItem -Directory $rp) {
  $file = Join-Path $d.FullName "SKILL.md"
  if (-not (Test-Path -LiteralPath $file)) { continue }
  $raw = Read-UTF8 $file
  if ($raw -notmatch '(?s)^---\s*\r?\n(.*?)\r?\n---') { Write-Warning "no frontmatter: $($d.Name)"; continue }
  $fm = $Matches[1]
  $n = [regex]::Match($fm, '^\s*name:\s*(.+?)\s*$', 'Multiline')
  $ds = [regex]::Match($fm, '^\s*description:\s*(.+?)\s*$', 'Multiline')
  $c = [regex]::Match($fm, '^\s*category:\s*(.+?)\s*$', 'Multiline')
  $v = [regex]::Match($fm, '^\s*version:\s*(.+?)\s*$', 'Multiline')
  $t = [regex]::Match($fm, '^\s*triggers:\s*(.+?)\s*$', 'Multiline')
  $trigs = @()
  if ($t.Success) { $trigs = @(Unquote $t.Groups[1].Value -split '\s*,\s*' | ForEach-Object { $_.Trim().Trim('"') } | Where-Object { $_ -ne '' }) }
  $st = [regex]::Match($fm, '^\s*steps:\s*(.+?)\s*$', 'Multiline')
  $steps = @()
  if ($st.Success) { $steps = @(Unquote $st.Groups[1].Value -split '\s*,\s*' | ForEach-Object { $_.Trim() } | Where-Object { $_ -ne '' }) }
  $items += [ordered]@{
    name = if ($n.Success) { $n.Groups[1].Value.Trim() } else { $d.Name }
    description = if ($ds.Success) { Unquote $ds.Groups[1].Value.Trim() } else { "" }
    category = if ($c.Success) { $c.Groups[1].Value.Trim() } else { "uncategorized" }
    kind = $kind
    path = "$root/$($d.Name)/SKILL.md"
    version = if ($v.Success) { $v.Groups[1].Value.Trim() } else { "0.1.0" }
    triggers = $trigs
    steps = $steps
  }
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
Write-UTF8 (Join-Path $RepoRoot "registry.json") ($reg | ConvertTo-Json -Depth 5)
Write-Output "registry rebuilt: $($items.Count) skills"

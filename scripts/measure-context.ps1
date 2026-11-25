<#
.SYNOPSIS
  Measure context economics: per-skill size, totals, and what each
  discovery layer costs. Evidence for docs/DISCOVERY.md budgets.
#>

$ErrorActionPreference = "Stop"
$RepoRoot = Split-Path -Parent $PSScriptRoot

function Est-Tokens([string]$text) { return [int]($text.Length / 4) }

$rows = @()
foreach ($root in @("skills", "workflows")) {
  $rp = Join-Path $RepoRoot $root
  if (-not (Test-Path -LiteralPath $rp)) { continue }
  foreach ($d in Get-ChildItem -Directory $rp) {
    $f = Join-Path $d.FullName "SKILL.md"
    if (-not (Test-Path -LiteralPath $f)) { continue }
    $t = [System.IO.File]::ReadAllText($f, [System.Text.Encoding]::UTF8)
    $tok = Est-Tokens $t
    $rows += [pscustomobject]@{ Name = $d.Name; Kind = $root.TrimEnd('s'); Lines = ($t -split "`n").Count; Tokens = $tok }
  }
}
$all = $rows | Sort-Object Tokens -Descending
$total = ($rows | Measure-Object -Property Tokens -Sum).Sum
$avg = [int](($rows | Measure-Object -Property Tokens -Average).Average)
$p99 = ($all | Select-Object -ExpandProperty Tokens) | Sort-Object | Select-Object -Skip ([int]($all.Count * 0.99)) -First 1
Write-Output "skills: $($rows.Count) | total if ALL preloaded: ~$total tokens | avg: ~$avg | p99: ~$p99"
Write-Output "top 10 heaviest:"
$all | Select-Object -First 10 | Format-Table Name, Lines, Tokens
$reg = Get-Content -LiteralPath (Join-Path $RepoRoot "registry.json") -Raw | ConvertFrom-Json
$idxChars = (($reg.skills | ForEach-Object { $_.name.Length + $_.description.Length + 12 }) | Measure-Object -Sum).Sum
Write-Output "registry index if preloaded: ~$([int]($idxChars/4)) tokens (vs $total full-load)"
foreach ($f in @("SKILLS.md")) {
  $p = Join-Path $RepoRoot $f
  if (Test-Path -LiteralPath $p) {
    $t = [System.IO.File]::ReadAllText($p, [System.Text.Encoding]::UTF8)
    Write-Output "$f : $([int]($t.Length/4)) tokens (trigger-first routing)"
  }
}

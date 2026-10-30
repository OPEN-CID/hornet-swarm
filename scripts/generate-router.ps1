<#
.SYNOPSIS
  Build SKILLS.md trigger-first router from registry.json (repo root).
  Paste it (or one section) into any agent context: AGENTS.md, CLAUDE.md,
  GEMINI.md, system prompt, or chat. Safe for every tool, present or future.
#>

$ErrorActionPreference = "Stop"
$RepoRoot = Split-Path -Parent $PSScriptRoot
$UTF8NoBom = New-Object System.Text.UTF8Encoding $false
function Read-UTF8([string]$p) { return [System.IO.File]::ReadAllText($p, [System.Text.Encoding]::UTF8) }
function Write-UTF8([string]$p, [string]$c) { [System.IO.File]::WriteAllText($p, $c, $UTF8NoBom) }

$reg = Read-UTF8 (Join-Path $RepoRoot "registry.json") | ConvertFrom-Json
$lines = @()
$lines += "# Skills index - hornet-swarm ($($reg.count) skills)"
$lines += ""
$lines += "> Paste this file (or one section) into any agent context (AGENTS.md, CLAUDE.md, GEMINI.md, system prompt, chat) to make every skill visible. Full instructions live in each linked SKILL.md. Generated from registry.json - do not hand-edit."
$lines += ""
$groups = $reg.skills | Group-Object -Property category | Sort-Object Name
foreach ($g in $groups) {
  $lines += "## $($g.Name) ($($g.Count))"
  $lines += ""
  foreach ($s in ($g.Group | Sort-Object name)) {
    $trig = $s.description
    if ($s.triggers -and $s.triggers.Count -gt 0) { $trig = ($s.triggers -join ", ") }
    $lines += "- **$($s.name)**: $trig -> ``$($s.path)``"
  }
  $lines += ""
}
$lines += "_Regenerate: powershell scripts/generate-router.ps1. Per-project subset: installer --router._"
Write-UTF8 (Join-Path $RepoRoot "SKILLS.md") (($lines -join "`n") + "`n")
Write-Output "router written: SKILLS.md ($($reg.count) skills)"

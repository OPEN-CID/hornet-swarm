<#
.SYNOPSIS
  Install hornet-swarm skills into agent skill dirs (copy-only, lightweight).
.EXAMPLE
  powershell scripts/install.ps1 -Target .agents/skills
  powershell scripts/install.ps1 -Target .claude/skills -Skills git-commit,code-review
  powershell scripts/install.ps1 -Scope global
#>
param(
  [string]$Target = ".agents/skills",
  [string]$Scope = "project",
  [string[]]$Skills = @()
)

$ErrorActionPreference = "Stop"
$RepoRoot = Split-Path -Parent $PSScriptRoot

if ($Scope -eq "global") {
  $Target = Join-Path $HOME ".agents/skills"
}

if ($Skills.Count -eq 0) {
  $Skills = Get-ChildItem -Directory (Join-Path $RepoRoot "skills") | Select-Object -ExpandProperty Name
}

New-Item -ItemType Directory -Force -Path $Target | Out-Null
foreach ($s in $Skills) {
  $src = Join-Path $RepoRoot "skills/$s"
  if (-not (Test-Path -LiteralPath (Join-Path $src "SKILL.md"))) { Write-Warning "skip ${s}: no SKILL.md"; continue }
  $dst = Join-Path $Target $s
  if (Test-Path -LiteralPath $dst) { Write-Warning "overwrite $dst" }
  Copy-Item -Recurse -Force -LiteralPath $src -Destination $dst
  Write-Output "installed $s -> $dst"
}
Write-Output "Done. Also supported targets: .claude/skills, .opencode/skills, ~/.config/opencode/skills"

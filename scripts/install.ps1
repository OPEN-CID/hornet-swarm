<#
.SYNOPSIS
  Install hornet-swarm skills into any agent's skill dir (copy-only, lightweight).
  Pick a tool preset or pass -Target explicitly. -Target always wins.
  Tools: claude opencode cursor copilot codex gemini windsurf junie roo trae kiro universal.
  For 75+ more agents, use: npx -y skills add OPEN-CID/hornet-swarm --skill <name> -a <agent>
.EXAMPLE
  powershell scripts/install.ps1 -Tool cursor
  powershell scripts/install.ps1 -Tool copilot -Skills git-commit,code-review
  powershell scripts/install.ps1 -Tool claude -Scope global
  powershell scripts/install.ps1 -Tool windsurf -Skills meal-plan -Router
  powershell scripts/install.ps1 -Target my-project/.agents/skills
#>
param(
  [string]$Tool = "",
  [string]$Target = "",
  [string]$Scope = "project",
  [string[]]$Skills = @(),
  [switch]$Router,
  [string]$RouterPath = ""
)

$ErrorActionPreference = "Stop"
$RepoRoot = Split-Path -Parent $PSScriptRoot
$UTF8NoBom = New-Object System.Text.UTF8Encoding $false

$ToolTargets = @{
  claude    = ".claude/skills"
  opencode  = ".opencode/skills"
  cursor    = ".agents/skills"
  copilot   = ".github/skills"
  codex     = ".agents/skills"
  gemini    = ".agents/skills"
  windsurf  = ".windsurf/skills"
  junie     = ".junie/skills"
  roo       = ".roo/skills"
  trae      = ".trae/skills"
  kiro      = ".kiro/skills"
  universal = ".agents/skills"
}
$ToolGlobals = @{
  claude    = (Join-Path $HOME ".claude/skills")
  opencode  = (Join-Path $HOME ".config/opencode/skills")
  cursor    = (Join-Path $HOME ".cursor/skills")
  copilot   = (Join-Path $HOME ".copilot/skills")
  codex     = (Join-Path $HOME ".agents/skills")
  gemini    = (Join-Path $HOME ".gemini/skills")
  windsurf  = (Join-Path $HOME ".codeium/windsurf/skills")
  junie     = (Join-Path $HOME ".junie/skills")
  roo       = (Join-Path $HOME ".roo/skills")
  trae      = (Join-Path $HOME ".trae/skills")
  kiro      = (Join-Path $HOME ".kiro/skills")
  universal = (Join-Path $HOME ".agents/skills")
}

if ($Target -eq "") {
  if ($Scope -eq "global") {
    if ($Tool -ne "" -and $ToolGlobals.ContainsKey($Tool)) { $Target = $ToolGlobals[$Tool] }
    else { $Target = $ToolGlobals["universal"] }
  } elseif ($Tool -ne "" -and $ToolTargets.ContainsKey($Tool)) {
    $Target = $ToolTargets[$Tool]
  } else {
    $Target = ".agents/skills"
  }
}

function Find-SkillDir([string]$n) {
  foreach ($r in @("skills", "workflows")) {
    $p = Join-Path $RepoRoot "$r/$n"
    if (Test-Path -LiteralPath (Join-Path $p "SKILL.md")) { return $p }
  }
  return $null
}

if ($Skills.Count -eq 0) {
  $Skills = @()
  foreach ($r in @("skills", "workflows")) {
    $rp = Join-Path $RepoRoot $r
    if (Test-Path -LiteralPath $rp) { $Skills += Get-ChildItem -Directory $rp | Select-Object -ExpandProperty Name }
  }
} else {
  # Accept both -Skills a,b and -Skills "a,b" (single comma-separated string).
  $Skills = @($Skills | ForEach-Object { $_ -split '\s*,\s*' } | ForEach-Object { $_.Trim() } | Where-Object { $_ -ne "" })
}

New-Item -ItemType Directory -Force -Path $Target | Out-Null
foreach ($s in $Skills) {
  $src = Find-SkillDir $s
  if ($null -eq $src) { Write-Warning "skip ${s}: no SKILL.md in skills/ or workflows/"; continue }
  Copy-Item -Recurse -Force -LiteralPath $src -Destination (Join-Path $Target $s)
  Write-Output "installed $s -> $Target/$s"
}
if ($RouterPath -ne "" -or $Router) {
  $routerFile = if ($RouterPath -ne "") { $RouterPath } else { Join-Path (Split-Path -Parent $Target) "SKILLS.md" }
  $rlines = @("# Installed skills router - hornet-swarm", "", "> Paste into any agent context (AGENTS.md, CLAUDE.md, GEMINI.md, chat). Full text in each SKILL.md. Regenerate: re-run installer with -Router.", "")
  foreach ($s in $Skills) {
    $f = Join-Path $Target "$s/SKILL.md"
    if (Test-Path -LiteralPath $f) {
      $raw = [System.IO.File]::ReadAllText($f, [System.Text.Encoding]::UTF8)
      $mn = [regex]::Match($raw, '(?s)^---\s*\r?\n(.*?)\r?\n---')
      $nm = $s; $ds = ""
      if ($mn.Success) {
        $fm2 = $mn.Groups[1].Value
        $a = [regex]::Match($fm2, '^\s*name:\s*(.+?)\s*$', 'Multiline')
        $b = [regex]::Match($fm2, '^\s*description:\s*(.+?)\s*$', 'Multiline')
        if ($a.Success) { $nm = $a.Groups[1].Value.Trim() }
        if ($b.Success) { $ds = $b.Groups[1].Value.Trim() }
      }
      $rlines += "- **${nm}**: ${ds} -> ``${f}``"
    }
  }
  [System.IO.File]::WriteAllText($routerFile, (($rlines -join "`n") + "`n"), $UTF8NoBom)
  Write-Output "router written: $routerFile"
}
Write-Output "Done. Verify: open a fresh session in your tool and ask it to list available skills."

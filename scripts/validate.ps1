<#
.SYNOPSIS
  Validate SKILL.md files against the universal spec (no dependencies).
.EXAMPLE
  powershell scripts/validate.ps1
  powershell scripts/validate.ps1 -Skill git-commit
#>
param([string]$Skill = "")

$ErrorActionPreference = "Stop"
$RepoRoot = Split-Path -Parent $PSScriptRoot
$fail = 0

function Test-Skill($dir) {
  $name = Split-Path -Leaf $dir
  $file = Join-Path $dir "SKILL.md"
  if (-not (Test-Path -LiteralPath $file)) { Write-Host "FAIL ${name}: missing SKILL.md"; return 1 }
  $raw = Get-Content -LiteralPath $file -Raw
  if ($raw -notmatch '(?s)^---\s*\r?\n(.*?)\r?\n---\s*\r?\n') { Write-Host "FAIL ${name}: missing frontmatter"; return 1 }
  $fm = $Matches[1]
  $mName = [regex]::Match($fm, '^\s*name:\s*(.+?)\s*$', 'Multiline')
  $mDesc = [regex]::Match($fm, '^\s*description:\s*(.+?)\s*$', 'Multiline')
  if (-not $mName.Success) { Write-Host "FAIL ${name}: frontmatter.name missing"; return 1 }
  if (-not $mDesc.Success) { Write-Host "FAIL ${name}: frontmatter.description missing"; return 1 }
  $fName = $mName.Groups[1].Value.Trim()
  $fDesc = $mDesc.Groups[1].Value.Trim()
  if ($fName -cnotmatch '^[a-z0-9]+(-[a-z0-9]+)*$') { Write-Host "FAIL ${name}: bad name '$fName'"; return 1 }
  if ($fName -match '--') { Write-Host "FAIL ${name}: consecutive hyphens"; return 1 }
  if ($fName.StartsWith('-') -or $fName.EndsWith('-')) { Write-Host "FAIL ${name}: edge hyphen"; return 1 }
  if ($fName.Length -gt 64) { Write-Host "FAIL ${name}: name >64 chars"; return 1 }
  if ($fName -ne $name -and $name -ne "skill-template") { Write-Host "FAIL ${name}: folder != frontmatter name ($fName)"; return 1 }
  if ($fDesc.Length -lt 1 -or $fDesc.Length -gt 1024) { Write-Host "FAIL ${name}: description length $($fDesc.Length)"; return 1 }
  foreach ($h in @("## What I do", "## When to use me", "## Workflow", "## Output format")) {
    if ($raw -notmatch [regex]::Escape($h)) { Write-Host "FAIL ${name}: missing section $h"; return 1 }
  }
  Write-Host "PASS $name"
  return 0
}

$dirs = if ($Skill) { @(Join-Path $RepoRoot "skills/$Skill") } else { Get-ChildItem -Directory (Join-Path $RepoRoot "skills") | Select-Object -ExpandProperty FullName }
foreach ($d in $dirs) { $fail += (Test-Skill $d) }

# registry cross-check
try {
  $reg = Get-Content -LiteralPath (Join-Path $RepoRoot "registry.json") -Raw | ConvertFrom-Json
  foreach ($s in $reg.skills) {
    if (-not (Test-Path -LiteralPath (Join-Path $RepoRoot $s.path))) { Write-Output "FAIL registry: missing $($s.path)"; $fail += 1 }
  }
} catch { Write-Output "FAIL registry.json parse: $_"; $fail += 1 }

if ($fail -gt 0) { Write-Output "$fail failure(s)"; exit 1 } else { Write-Output "All skills valid." }

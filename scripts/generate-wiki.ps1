<#
.SYNOPSIS
  Generate the browsable wiki from registry.json: wiki/README.md index + wiki/<category>.md pages.
#>
$ErrorActionPreference = "Stop"
$RepoRoot = Split-Path -Parent $PSScriptRoot
$WikiDir = Join-Path $RepoRoot "wiki"
New-Item -ItemType Directory -Force -Path $WikiDir | Out-Null
$reg = Get-Content -LiteralPath (Join-Path $RepoRoot "registry.json") -Raw | ConvertFrom-Json

$CatBlurb = @{
  'software-build'   = "Design, write, fix, and reshape code."
  'quality-testing'  = "Prove it works: tests, reviews, QA, performance, security."
  'git-release'      = "Clean history, reviewable PRs, safe releases."
  'docs-research'    = "Understand systems and explain them well."
  'devops-infra'     = "Ship and run software reliably."
  'data-ai'          = "Query, clean, prompt, retrieve, evaluate."
  'productivity'     = "Plan work and run better meetings."
  'meta'             = "Skills about skills: create and onboard."
  'medical-health'   = "Organize health information. Info only - always consult a professional."
  'legal-finance'    = "Organize money and paperwork. General info - confirm big decisions professionally."
  'languages'        = "Idiomatic code in 20 languages: toolchain, style, idioms, arch patterns, pitfalls."
  'education'        = "Learn anything with tutoring and study systems."
  'science-lab'      = "Run trustworthy experiments and read papers well."
  'home-life'        = "Meals, cleaning, maintenance, moves, pets, safety."
  'diy-maker'        = "Build and fix things safely with real plans."
  'business-ops'     = "Validate, sell, hire, and operate."
  'company-arch'     = "Architecture by company function: frontend, backend, data, ML, security, platform."
  'data-pipeline'    = "Move, check, and present data."
  'creative-media'   = "Write, film, record, and publish."
  'career'           = "Apply, interview, negotiate, grow."
}

$groups = $reg.skills | Group-Object -Property category | Sort-Object Name
$index = @()
$index += "# Hornet Swarm Wiki"
$index += ""
$index += "Universal agent skills: one folder per skill, every domain covered."
$index += ""
$index += "## Start here"
$index += ""
$index += "- New? Read docs/PLAN.md (vision), docs/WORLD-TAXONOMY.md (all domains), docs/SKILL-FAMILIES.md (the 5 kinds)."
$index += "- Use a skill: copy skills/<name> into .agents/skills/ (or .claude/skills/, .opencode/skills/)."
$index += "- Add a skill: 6 lines of JSON in catalog/ plus scripts/generate-skills.ps1 (see docs/SKILL-FACTORY.md)."
$index += ""
$index += "## Domains ($($groups.Count)) - $($reg.skills.Count) skills"
$index += ""
foreach ($g in $groups) {
  $blurb = $CatBlurb[$g.Name]
  if ($null -eq $blurb) { $blurb = "" }
  $index += "- [$($g.Name)]($($g.Name).md) ($($g.Count)) - $blurb"
}
$index += ""
$index += "## Family pattern"
$index += ""
$index += "Every domain follows Translate, Parse, Do, Review, Playbook. Details: docs/SKILL-FAMILIES.md."
Set-Content -LiteralPath (Join-Path $WikiDir "README.md") -Value ($index -join "`n") -Encoding UTF8

foreach ($g in $groups) {
  $lines = @()
  $lines += "# $($g.Name)"
  $lines += ""
  $lines += $CatBlurb[$g.Name]
  $lines += ""
  $lines += "| Skill | Use it when |"
  $lines += "|---|---|"
  foreach ($s in ($g.Group | Sort-Object name)) {
    $lines += "| ``$($s.name)`` | $($s.description) |"
  }
  $lines += ""
  $lines += "Install: Copy-Item -Recurse skills/<name> .agents/skills/ - full file: skills/<name>/SKILL.md"
  Set-Content -LiteralPath (Join-Path $WikiDir ($g.Name + ".md")) -Value ($lines -join "`n") -Encoding UTF8
}
Write-Output "wiki rebuilt: $($groups.Count) categories, $($reg.skills.Count) skills"

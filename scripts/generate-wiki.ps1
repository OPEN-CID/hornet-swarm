<#
.SYNOPSIS
  Generate the browsable wiki from registry.json: wiki/README.md index + wiki/<category>.md pages.
#>
$ErrorActionPreference = "Stop"
$RepoRoot = Split-Path -Parent $PSScriptRoot
$WikiDir = Join-Path $RepoRoot "wiki"
$UTF8NoBom = New-Object System.Text.UTF8Encoding $false
function Read-UTF8([string]$p) { return [System.IO.File]::ReadAllText($p, [System.Text.Encoding]::UTF8) }
function Write-UTF8([string]$p, [string]$c) { [System.IO.File]::WriteAllText($p, $c, $UTF8NoBom) }
New-Item -ItemType Directory -Force -Path $WikiDir | Out-Null
$reg = Read-UTF8 (Join-Path $RepoRoot "registry.json") | ConvertFrom-Json

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
  'travel'           = "Trips, packing, visas, itineraries, and safety."
  'cooking'          = "Bake, grill, ferment, brew, and season with confidence."
  'parenting'        = "Newborns to teens plus elder care. Info only - consult professionals."
  'relationships'    = "Communicate, repair, befriend, and network."
  'mind'             = "Habits, focus, memory, calm, and clear thinking."
  'fitness'          = "Run, lift, stretch, and coach. Info only - pros for injuries."
  'outdoors'         = "Hike, camp, paddle, and read the wild safely."
  'housing'          = "Rent, buy, inspect, renovate, and decorate."
  'vehicles'         = "Buy, inspect, ride, charge, and fix transport."
  'wealth'           = "Invest, insure, retire, and review. Education only - not advice."
  'law-life'         = "Tenants, claims, wills, and scam defense. Info only - not advice."
  'leadership'       = "Manage, give feedback, speak, and facilitate."
  'knowledge'        = "Notes, inbox, calendar, reports, and research."
  'everyday-tech'    = "CLI, passwords, backups, wifi, and AI tools."
  'cloud'            = "Kubernetes, Terraform, AWS, DNS, TLS, and costs."
  'science-big'      = "Stars, weather, genes, minds, and markets."
  'play'             = "Chess, poker, game nights, and game design."
  'craft'            = "Draw, paint, shoot, knit, sew, and make."
  'music'            = "Guitar, piano, voice, theory, and recording."
  'writing'          = "Fiction, poetry, scripts, grants, and publishing."
  'events'           = "Weddings, parties, budgets, and toasts."
  'civic'            = "Volunteer, fundraise, organize, and vote."
  'safety'           = "First aid, fire, storms, and scams. Call emergency first."
  'eco'              = "Recycle, compost, save water, and cut carbon."
  'pets'             = "Dogs, cats, tanks, birds, hens, and bees."
  'culture'          = "Roots, media literacy, debate, and museums."
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
Write-UTF8 (Join-Path $WikiDir "README.md") ($index -join "`n")

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
  Write-UTF8 (Join-Path $WikiDir ($g.Name + ".md")) ($lines -join "`n")
}
Write-Output "wiki rebuilt: $($groups.Count) categories, $($reg.skills.Count) skills"

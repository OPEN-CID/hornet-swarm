# All 6 ways to add a skill (ranked by effort)

| # | Path | Effort | Best for | Output |
|---|---|---|---|---|
| 1 | **Issue proposal** | 5 min, no tools | anyone | Maintainer runs the factory |
| 2 | **AI proposer prompt** | 10 min, any chatbot | non-coders with an idea | JSON for an issue or PR |
| 3 | **CSV import** | 15 min, spreadsheet | bulk lists (clubs, teams, classes) | `catalog/imports.json` + skills |
| 4 | **Interactive** | 10 min, PowerShell | guided single skill | `catalog/custom.json` + skill |
| 5 | **Catalog JSON** | 10 min, editor | devs, bulk reviewable diffs | entry + generated skill |
| 6 | **Hand-write** | 30+ min | judgment-heavy expert skills | `skills/<name>/SKILL.md` directly |

## Details

**1. Issue proposal.** Open a *Skill proposal* issue (template has the 6
fields). Done. A maintainer pastes it into `catalog/custom.json` and runs:
`generate-skills.ps1` → `rebuild-registry.ps1` → `generate-wiki.ps1` →
`validate.ps1`.

**2. AI proposer prompt.** Open `templates/PROPOSER-PROMPT.md`, fill in your
idea, paste into any chatbot, and submit the returned JSON as an issue or PR.
Best way to draft 3-10 skills for a new domain at once.

**3. CSV import.** Copy `templates/skills.csv`, add rows
(`|` separates multiple outcomes/triggers), then:

```powershell
powershell scripts/import-skills.ps1 -Csv my-skills.csv
powershell scripts/generate-wiki.ps1
powershell scripts/validate.ps1
```

**4. Interactive.** `powershell scripts/new-skill.ps1` asks 6 questions and
appends to `catalog/custom.json`, then generates.

**5. Catalog JSON.** Add entries to `catalog/world.json` (core domains),
`catalog/families.json` (translate/parse/review/playbook), or
`catalog/custom.json` (community). Then run the four scripts from path 1.

**6. Hand-write.** Copy `templates/SKILL.md` to `skills/<name>/SKILL.md`.
Required for expert-judgment skills; the generator never overwrites
hand-written files unless passed `-Force`.

## Which file does what (structure)

```text
catalog/
  README.md       # schema + which file to use
  world.json      # core task skills (curated)
  families.json   # translate/parse/review/playbook skills (curated)
  languages1.json # language skills part 1: python, ts, js, go, rust, java, c#, cpp, c, ruby
  languages2.json # language skills part 2: php, swift, kotlin, dart, r, scala, elixir, bash, powershell, lua
  custom.json     # community entries (created by new-skill.ps1)
  imports.json    # created by import-skills.ps1 (git-ignored if noisy)
templates/
  SKILL.md            # hand-write starting point
  skills.csv          # CSV starting point
  PROPOSER-PROMPT.md  # chatbot starting point
scripts/
  generate-skills.ps1      # catalog -> SKILL.md (kind-aware detail)
  generate-lang-skills.ps1 # languages*.json -> 20 language SKILL.md (toolchain/style/idioms/arch/pitfalls)
  rebuild-registry.ps1 # skills -> registry.json
  generate-wiki.ps1    # registry -> wiki/
  import-skills.ps1    # csv -> catalog + skills
  new-skill.ps1        # interactive -> catalog + skill
  validate.ps1         # spec check (CI gate)
  install.ps1/.sh      # copy skills into an agent
```

Quality bar for all paths: `CONTRIBUTING.md`. Design pattern: `SKILL-FAMILIES.md`.

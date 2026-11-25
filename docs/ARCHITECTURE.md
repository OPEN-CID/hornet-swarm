# Architecture — how hornet-swarm fits together

One repo, one rule: **facts live in small catalog JSON; everything else is
generated.** Humans edit catalog entries and hand-written skills. Machines
expand, index, verify, and publish. CI proves the two never drift apart.

## The factory pipeline (how a skill is born)

```mermaid
flowchart LR
    A["catalog/*.json\n6 fields per skill"] --> B["generate-skills.ps1\ngenerate-workflows.ps1\ngenerate-lang-skills.ps1"]
    B --> C["skills/& + workflows/\nSKILL.md (+ metadata)"]
    C --> D["rebuild-registry.ps1\nregistry.json"]
    D --> E["generate-wiki.ps1\nwiki/"]
    D --> F["generate-router.ps1\nSKILLS.md"]
    D --> G["export-site.ps1\nsite/skills.json"]
    C --> H["validate.ps1 + check_frontmatter.py\nspec + strict YAML"]
    H --> I["CI gate\n6 jobs, win+ubuntu"]
    I --> J["merge to main"]
    J --> K["Pages + release"]
    style H fill:#3a2,stroke:#333,color:#fff
    style I fill:#36c,stroke:#333,color:#fff
```

The dotted arrow that matters: **nothing downstream is hand-edited.**
`registry.json`, `wiki/`, `SKILLS.md`, and `site/skills.json` are build
artifacts. Edit the catalog, run the scripts, commit the result. CI fails the
PR if you forget a step (`git diff --exit-code`).

## Runtime discovery (how any agent finds the right skill)

```mermaid
flowchart TD
    T["user task"] --> A["agent startup"]
    A --> L0["L0 · SKILL.md dirs\nname + description preloaded\n(~100 tokens each)"]
    A --> L1["L1 · indexes\nregistry.json (machines)\nwiki/ (humans)"]
    Q["task matches?"] --> L2["L2 · SKILLS.md router\npaste into any context\n(trigger-first, ~40KB)"]
    Q --> L3["L3 · MCP server\nlist / search / get\n(works in any MCP tool)"]
    L0 --> Q
    L1 --> Q
    L2 --> S["load full SKILL.md\n+ references on demand"]
    L3 --> S
    S --> V["verify output\nagainst Output format"]
```

Layers are independent and stackable: install 5–15 skills (L0), paste the
router so the agent knows the other ~560 exist (L2), expose MCP where the tool
supports it (L3). Any future tool works on day one if it does **any** of:
scan skill dirs, read pasted text, or speak MCP. Details: `DISCOVERY.md`.

## PR lifecycle (how changes land)

```mermaid
flowchart LR
    B["branch from main"] --> E["edit catalog/\nor hand-write skills/"]
    E --> G["run generators +\nvalidate locally"]
    G --> P["open PR\n(template below)"]
    P --> C["6 CI gates:\nvalidate · frontmatter\ninstall-smoke x2\nmcp-smoke x2"]
    C -->|green| R["review"]
    C -->|red| F["fix + push"]
    F --> C
    R --> M["merge (squash or merge)\nmain must stay green"]
    M --> T["tag + release\n(optional)"]
```

Branch protection enforces it: `main` requires all 6 checks green on an
up-to-date branch; force-pushes and deletions are blocked. No human approval
is required (solo-maintainer repo) — the gates *are* the review bar, plus a
human skim of the diff.

## What goes where (repo map)

```text
catalog/            facts: world.json, families.json, languages/*.json,
                    workflows.json, *_more.json, custom.json, imports.json
templates/          hand-write starting points (SKILL.md, skills.csv, PROPOSER-PROMPT.md)
skills/<name>/     generated + hand-written atomic capabilities
workflows/<name>/   generated plays (ordered skill chains)
registry.json       machine index (generated — do not hand-edit)
wiki/               human index, 50+ pages (generated)
SKILLS.md           trigger-first router for any agent (generated)
mcp-server/         zero-dep stdio MCP server + tests (hand-written)
site/               GitHub Pages one-pager (index.html + generated skills.json)
scripts/            factory + validators + installers (all ASCII, UTF-8 safe)
docs/               this file, PLAN, TAXONOMY, FAMILIES, FACTORY, INTAKE,
                    USAGE, DISCOVERY, RELEASE (+ root CONTRIBUTING.md)
.github/            CI (validate.yml), issue forms, PR template
```

## Design rules (the ones that survive contact with reality)

1. **Flat namespaces, rich metadata.** `skills/<name>/`, never nested by
   category — scanners expect `*/SKILL.md`. Categories live in metadata.
2. **Kinds over folders.** translate/parse/do/review/playbook is a naming
   suffix, not a directory. Workflows are skills whose job is a sequence.
3. **Frontmatter is a contract, not decoration.** Strict YAML, quoted values,
   `name` == folder. Lenient tools forgive; strict tools skip — we satisfy both.
4. **Progressive disclosure or bust.** Core <500 lines, details in `references/`,
   determinism in `scripts/`. Context is the scarcest resource.
5. **Descriptions are routing keys.** Front-load trigger words; Codex-class
   budgets truncate from the end. If a skill never fires, its description is
   wrong — never the agent.
6. **UTF-8 everywhere, ASCII in scripts.** Data files are UTF-8 no-BOM;
   PowerShell scripts stay 7-bit ASCII so PS 5.1 never mojibakes them.
7. **Generated files are never hand-edited.** If CI's sync check fails, you
   edited the wrong layer — move the change to the catalog and regenerate.

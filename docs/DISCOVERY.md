# Discovery architecture — how any agent finds the right skill

Visibility is a routing problem with a budget. Every agent preloads skill
metadata (name + description) and matches it against the task. The budgets
differ and shrink: Codex caps the initial skill list (~2% of context, 8k chars,
descriptions shortened first, skills omitted past budget). With 405 skills,
**no tool can preload everything** — so this repo is designed in layers. Each
layer works alone; together they cover any tool, including ones that don't
exist yet.

## The 4 layers

| Layer | Artifact | Consumer | Cost |
|---|---|---|---|
| L0 spec-perfect skills | `skills/*/SKILL.md` | any spec scanner (all current tools) | ~100 tokens/skill preloaded |
| L1 indexes | `registry.json` (machine), `wiki/` (human) | tooling, search, CI | build-time only |
| L2 router file | `SKILLS.md` (trigger-first index) | ANY agent that reads text (all of them, forever) | paste once, ~25-40KB, or per-category slice |
| L3 MCP server | `mcp-server/server.py` (zero-dep stdio) | ANY MCP-capable agent, present or future | 3 tools, loaded on demand |

Rule of thumb: **install the 5-15 skills a project needs** (L0, full fidelity);
paste or link the **router** so the agent knows the other 390 exist (L2);
expose the **MCP server** when the agent supports tools (L3, cheapest at scale).

## Why a router file (L2) is the universal primitive

Every agent — past, present, future — can read a text file dropped into
context via `AGENTS.md`, `CLAUDE.md`, `GEMINI.md`, `.cursor/rules`, a system
prompt, or a paste. No discovery protocol required. Our router is generated
from the registry, one trigger-first line per skill:

```text
- **meal-plan**: weekly cooking, planning family dinners → skills/meal-plan/SKILL.md
```

Triggers (not full descriptions) keep it dense and match how users actually
ask. Copy the whole file, one category section, or generate a subset router
for exactly the skills you installed (`install --router`).

## Why an MCP server (L3) is the future-proof path

MCP is the one integration every major agent implements (Claude, Cursor,
Copilot, Gemini CLI, Codex). Our server is ~150 lines, zero dependencies,
stdio JSON-RPC, pointed at ANY skills directory (repo or installed subset):

- `list_skills` (+ optional category) — name/description/category
- `search_skills` — keyword-ranked over name, triggers, description, category
- `get_skill` — full `SKILL.md` on demand (progressive disclosure preserved)

A tool released next year that speaks MCP gets all 405 skills with zero changes
on our side. Setup snippets per tool: `mcp-server/README.md`.

## Future-tool contract (what "Day-1 compatible" means)

A new agent works with this repo out of the box if it does ANY of:
1. scans `SKILL.md` directories (spec path — most tools),
2. reads a pasted/included text file (router — all tools),
3. speaks MCP stdio (server — all serious tools).

If it does none of these, it can't consume shared knowledge at all — that's
the tool's gap, not ours. File issues with the tool's docs link; we'll verify
and document (see `docs/USAGE.md` troubleshooting).

## Authoring for visibility (what the research says)

From the Agent Skills spec and Anthropic's engineering notes:
- **Front-load the trigger**: first words of `description` must match how users
  ask (Codex shortens descriptions from the end). Our generator enforces
  WHAT-first descriptions.
- **Keywords, not poetry**: descriptions carry the exact words users type
  (`visa`, `sourdough`, `kubernetes`). Our `triggers` metadata feeds the router
  and MCP search with the same vocabulary.
- **Spec-clean**: `name` (matches folder, no `--`/edge hyphens — CI checks),
  `description` ≤1024, `license`/`compatibility`/`metadata` only. Unknown fields
  break or confuse scanners, so enrichment lives in `metadata` (string map),
  which the spec reserves for tooling.
- **Bodies stay lean** (<500 lines), references split out, scripts deterministic.
- **Evaluate in the wild**: if a skill never triggers, its description is wrong,
  not the agent — watch, rename, reword (`skill-fix` issue template).

## Budgets to respect

- Don't install all 405 into a live tool. Install the working set; keep the
  router for the rest. (Our installer defaults to explicit `-Skills` lists for
  exactly this reason; full install is opt-in.)
- One concern per skill keeps descriptions matchable; mega-skills match nothing.
- Review `SKILLS.md` diff on each release — new skills must earn their trigger words.

---
name: compose-play
description: Compose a custom multi-step play from any skills on demand using the orchestrator pattern. Use when no canned workflow fits the goal.
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: meta
  version: 1.0.0
  author: hornet-swarm
---

## What I do

- Turn any goal into an ordered play: pick skills from the index, define handoffs and stop conditions
- Run the orchestrator loop: one skill at a time, carry outputs forward, verify gates before proceeding
- Know when NOT to compose: single-skill tasks and fixed repeats belong elsewhere

## When to use me

Use when:

- No canned workflow in `workflows/` fits the goal
- The job needs 3+ skills in an order you must decide right now

Don't use when:

- One skill does the job (load it directly — composition is overhead)
- The sequence repeats verbatim every time (propose it as a stored workflow instead)

## Workflow

1. **Inspect** — restate the goal and definition of done. Search the index (`registry.json`, `SKILLS.md`, or MCP `search_skills`) for candidate skills. List what each candidate contributes in one line.
2. **Plan** — order 3-7 steps from the candidates; each step names exactly one skill. Define handoffs (what artifact moves forward) and gates (which steps must pass before continuing). State stop conditions: what makes you halt and re-plan. If the plan needs more than 7 steps, split it into phases with a checkpoint each.
3. **Execute** — run the orchestrator loop: load the current skill fully, complete it, record its artifact in one or two sentences, then move on. Never run two steps in one turn; never skip a gate that failed.
4. **Verify** — confirm every artifact against the definition of done; report the chain and what you would change next time.

## Rules / Constraints

- MUST: compose from the index, never invent skills — if a step has no skill, say so and do that step by hand.
- MUST: keep working memory tiny: per step, carry forward only its artifact summary, never full outputs (context rot is real — see `docs/DISCOVERY.md`).
- MUST: stop on red verdicts (NO-GO, FIX-FIRST, failing gates) and re-plan instead of pushing through.
- MUST NOT: preload every skill "just in case" — load on demand, one at a time.

## Output format

```text
## Play: <goal> — <N> steps
1. <skill> → artifact: <one line> [gate: pass/fail]
...
Verdict: <done | blocked at step N: reason + next move>
```

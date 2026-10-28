---
name: eval-harness
description: Score AI behavior on fixed cases with rubrics and regression gates. Use when shipping or changing any model or prompt.
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: data-ai
  version: 1.0.0
  author: hornet-swarm
---

## What I do

- Build golden sets: inputs, expected outputs, and pass rubrics
- Run deterministic harnesses with per-case diffs and aggregate scores
- Gate releases: no ship on red, review every score drop

## When to use me

Use when:

- Shipping or changing any model, prompt, or agent behavior
- Arguing whether version B is actually better than A

Don't use when:

- Exploring a brand-new capability with no definition of good yet

## Workflow

1. **Inspect** — collect 15-30 real cases covering happy paths, edges, and known failures. Define pass/fail per case.
2. **Plan** — rubric: exact-match vs graded checks; thresholds for ship/no-ship; cost and runtime budget.
3. **Execute** — run the harness, record per-case results with diffs, aggregate by category.
4. **Verify** — compare A/B on the same set; report wins, regressions, and flakes (re-run unstable cases).

## Rules / Constraints

- MUST: same cases, same rubric, every run; version the golden set.
- MUST: separate flakes from real regressions (re-run before concluding).
- MUST NOT: tune to the test set until it stops measuring reality — hold out fresh cases.

## Output format

```markdown
## Eval: <system vA vs vB> — <n> cases
- Score: A x% → B y% | Regressions: <cases> | Flakes: <cases>
- Verdict: <ship | fix-first: ...>
```

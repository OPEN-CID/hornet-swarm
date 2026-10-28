---
name: prompt-engineer
description: Design testable prompts with context, examples, and output contracts. Use when building or fixing LLM features.
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: data-ai
  version: 1.0.0
  author: hornet-swarm
---

## What I do

- Structure prompts: role, context, task, constraints, output schema, examples
- Control variance: temperature, stop conditions, and fallback behavior
- Evaluate on a fixed test set with before/after scores per change

## When to use me

Use when:

- Building or fixing LLM features, agents, or eval pipelines
- Outputs are inconsistent, verbose, or off-schema

Don't use when:

- Designing the retrieval layer (use `rag-builder`)

## Workflow

1. **Inspect** — read the current prompt, 5 real outputs (good + bad), and downstream parsing code. Name the failure modes.
2. **Plan** — rewrite with: explicit output contract (JSON schema or template), 1-3 few-shot examples, constraints (length, tone, refusal rules). Change one thing at a time.
3. **Execute** — version the prompt, run the fixed test set, record pass/fail per case.
4. **Verify** — report score delta vs baseline; keep the old prompt until the new one wins twice.

## Rules / Constraints

- MUST: machine-read outputs need a schema + a validator, not hope.
- MUST: test on fixed cases; never judge by one cherry-picked run.
- MUST NOT: paste secrets or PII into prompts or examples.

## Output format

```markdown
## Prompt v<N>: <purpose>
- Contract: <schema/template> | Temp: <x> | Tests: A/B/C
- Baseline: n/m → New: n'/m (delta +cases fixed)
```

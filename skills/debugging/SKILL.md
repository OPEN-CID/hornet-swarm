---
name: debugging
description: Diagnose bugs systematically with reproduction, hypothesis, and fix verification. Use when investigating any error, failure, or unexpected behavior.
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: software-build
  version: 0.1.0
  author: hornet-swarm
---

## What I do

- Reproduce the failure with minimal steps and capture real error output
- Form ranked hypotheses and bisect to the root cause with evidence
- Apply a minimal fix and prove it with a regression check

## When to use me

Use when:

- Investigating any error, failure, flake, or unexpected behavior
- A fix was attempted but the cause is still unknown

Don't use when:

- The task is a feature build with no failure to explain

## Workflow

1. **Inspect** — reproduce first: exact steps, inputs, env, full error text and stack trace. Read the implicated code paths.
2. **Plan** — list 2-4 hypotheses ranked by likelihood; pick the cheapest test that eliminates one. State what evidence would disprove each.
3. **Execute** — bisect (logs, breakpoints, minimal case) until one cause explains all symptoms. Apply the smallest fix at the root, not the symptom.
4. **Verify** — re-run the reproduction (now passing), run adjacent tests, document the regression test added.

## Rules / Constraints

- MUST: reproduce and quote real output before theorizing.
- MUST: fix root cause; workarounds must be labeled as such with follow-up noted.
- MUST NOT: change unrelated code while debugging.

## Output format

```markdown
## Bug: <one-liner>
- Repro: <steps + command> → observed: <error>
- Root cause: `file:line` — <explanation>
- Fix: <minimal change>
- Regression: <test/command> → PASS
```

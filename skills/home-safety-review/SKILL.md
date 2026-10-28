---
name: home-safety-review
description: Room-by-room home safety audit with priority fixes. Use yearly or with new kids or pets.
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: home-life
  version: 1.0.0
  author: hornet-swarm
---

## What I do

- ranked findings
- fix list
- safety verdict


## When to use me

Use when:

- yearly safety check
- new kids or pets

Don't use when:

- The request is outside this skill's job. Say so and point to the right skill if you know it.
- You lack the source material this task needs. Ask for it first instead of guessing.

## Workflow

1. Scope: confirm what is under review and what good looks like; list what you will NOT judge.
2. Evidence pass: read the whole artifact, collecting findings with exact quotes or file:line for each.
3. Rank: sort into blocker (must fix), major (should fix), minor/nit. Cut anything beyond the top 10.
4. Fix proposals: give a concrete correction for every blocker and major; show before/after where it helps.
5. Verdict: GO, FIX-FIRST (list blockers), or NO-GO, plus what to re-check after fixes.

## Rules / Constraints

MUST: every finding has evidence (quote or file:line).
MUST: rank by severity; max 10 findings, blockers first.
MUST NOT: rewrite the whole artifact; propose minimal fixes.

## Output format

```text
## Safety audit: room findings ranked, fixes, cost, verdict
- Sources checked: <what you read>
- Confidence: <high/medium/low + what would raise it>
```

## References

- No extra files by default. If the task grows complex, split it: parse first, then review, then act.

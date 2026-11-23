---
name: publish-newsletter
description: Publish a newsletter issue from idea to sent. Use for weekly publishing.
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: creative-media
  version: 1.0.0
  author: hornet-swarm
  kind: workflow
  triggers: weekly newsletter, publishing an issue
  steps: newsletter-writer, content-review
---

## What I do

- draft
- reviewed issue
- sent checklist

This is a workflow: I play 2 skills in order, carrying each step's output into the next. Do not skip steps; each gate exists for a reason.

## When to use me

Use when:

- weekly newsletter
- publishing an issue

Don't use when:

- You only need one of the steps below - load that skill directly instead.
- The situation changed mid-play - stop, restate, and re-plan rather than forcing the sequence.

## Workflow

The play, in order:

| # | Skill | Job | Handoff |
|---|---|---|---|
| 1 | `newsletter-writer` | Draft newsletters people open and finish. Use for weekly publishing. | artifact feeds step 2 |
| 2 | `content-review` | Pre-publish review for clarity, claims, rights, and brand fit. Use before anything goes public. | artifact feeds step 3 |

How to run me:
1. Start at step 1. Load that skill fully (read its SKILL.md) and complete it.
2. Carry its artifact into the next step as input - never redo completed work.
3. If a step returns a NO-GO / FIX-FIRST / fail verdict, stop the play and fix it before continuing.
4. Review-type steps are gates: nothing moves past them red.

## Rules / Constraints

- MUST: run steps in order; each step's output is the next step's input.
- MUST: load the full SKILL.md of each step - summaries are not enough.
- MUST NOT: skip verification or review steps to go faster.
- MUST NOT: invent outputs for a step you did not run.

## Output format

```text
## Issue: <topic> — draft, review, send
- Steps run: <names in order>
- Step artifacts: <one line each>
- Confidence: <high/medium/low + what would raise it>
```

## References

- Steps live in skills/<name>/SKILL.md (loaded on demand, never pasted here).
- If the play grows new branches, split it: propose a new workflow, don't bloat this one.
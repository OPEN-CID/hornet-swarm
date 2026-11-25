---
name: job-search
description: "Run a job search from resume to signed offer. Use when hunting for work."
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: career
  version: 1.0.0
  author: hornet-swarm
  kind: workflow
  triggers: "hunting for work, applying for jobs"
  steps: "resume-writer, job-post-parse, application-review, interview-prep, salary-negotiate"
---

## What I do

- tailored applications
- interview wins
- negotiated offer

This is a workflow: I play 5 skills in order, carrying each step's output into the next. Do not skip steps; each gate exists for a reason.

## When to use me

Use when:

- hunting for work
- applying for jobs

Don't use when:

- You only need one of the steps below - load that skill directly instead.
- The situation changed mid-play - stop, restate, and re-plan rather than forcing the sequence.

## Workflow

The play, in order:

| # | Skill | Job | Handoff |
|---|---|---|---|
| 1 | `resume-writer` | Tailor resumes to job posts with measurable impact. Use when applying for jobs. | artifact feeds step 2 |
| 2 | `job-post-parse` | Parse job posts into requirements and match matrix. Use before tailoring an application. | artifact feeds step 3 |
| 3 | `application-review` | Pre-submit review of resume and letter against the post. Use before hitting apply. | artifact feeds step 4 |
| 4 | `interview-prep` | Run mock interviews with STAR feedback. Use before real interviews. | artifact feeds step 5 |
| 5 | `salary-negotiate` | Plan negotiation scripts with ranges and walk-aways. Use with an offer in hand. | artifact feeds step 6 |

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
## Hired: <role> — applications to offer
- Steps run: <names in order>
- Step artifacts: <one line each>
- Confidence: <high/medium/low + what would raise it>
```

## References

- Steps live in skills/<name>/SKILL.md (loaded on demand, never pasted here).
- If the play grows new branches, split it: propose a new workflow, don't bloat this one.
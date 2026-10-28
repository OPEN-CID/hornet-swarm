---
name: med-symptom-triage
description: Organize symptoms into a clear timeline summary for a clinician visit. Use when preparing for a doctor appointment. Information only, never a diagnosis.
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: medical-health
  version: 1.0.0
  author: hornet-swarm
---

## What I do

- symptom timeline summary
- current meds list
- questions for the clinician

> Information only: never a diagnosis, dose change, or treatment decision. Confirm anything medical with a qualified clinician or pharmacist.


## When to use me

Use when:

- preparing for a doctor appointment
- organizing symptoms to report

Don't use when:

- The request is outside this skill's job. Say so and point to the right skill if you know it.
- You lack the source material this task needs. Ask for it first instead of guessing.

## Workflow

1. Inspect: gather the real inputs first (files, numbers, constraints); restate what you found.
2. Plan: propose the approach and the definition of done; ask clarifying questions when ambiguous.
3. Execute: do the work in smallest verifiable steps, cheapest test first.
4. Verify: check the result against the definition of done; show evidence, not claims.

## Rules / Constraints

MUST: verify inputs before acting; smallest steps first.
MUST: show evidence for the result.
MUST NOT: invent sources, URLs, or data.

## Output format

```text
## Visit summary: symptoms timeline, meds, questions for the doctor
- Sources checked: <what you read>
- Confidence: <high/medium/low + what would raise it>
```

## References

- No extra files by default. If the task grows complex, split it: parse first, then review, then act.
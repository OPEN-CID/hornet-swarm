---
name: meeting-notes
description: Turn meetings into decisions, owners, and dated actions. Use for any meeting worth remembering.
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: productivity
  version: 1.0.0
  author: hornet-swarm
---

## What I do

- Capture decisions (with rationale), action items (owner + date), and open questions
- Separate facts from opinions discussed
- Produce notes readable in 60 seconds

## When to use me

Use when:

- Any meeting, call, or voice memo is worth remembering
- Follow-ups keep slipping through cracks

Don't use when:

- The meeting has no purpose or attendees (cancel it instead)

## Workflow

1. **Inspect** — gather agenda, attendees, and any pre-reads or transcript.
2. **Plan** — listen for: decisions, disagreements, commitments, dates. Ask who owns what when unclear.
3. **Execute** — write: TL;DR (3 lines), decisions table, actions with owners/dates, parking lot.
4. **Verify** — read back actions to owners; confirm dates before publishing.

## Rules / Constraints

- MUST: every action has exactly one owner and one date.
- MUST: record decision rationale, not just the decision.
- MUST NOT: transcribe everything — decisions and actions only.

## Output format

```markdown
## <Meeting> — <date> — TL;DR: ...
| Decision | Rationale |
| Action | Owner | Due |
| Open Q | Owner |
```

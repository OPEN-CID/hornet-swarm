---
name: skill-template
description: TEMPLATE — copy this file to skills/<your-skill>/SKILL.md. Replace all placeholders, then delete this line.
---

> Copy this template to `skills/<your-skill>/SKILL.md`. Frontmatter `name` MUST equal the folder name.

---
name: your-skill-name
description: WHAT this skill does + WHEN to trigger it in one paragraph (1-1024 chars). Example: Craft conventional commits from staged diffs. Use when the user asks to commit, write a commit message, or clean up VCS history.
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: pick-one
  version: 0.1.0
  author: hornet-swarm
---

## What I do

- Outcome 1 (verb + artifact)
- Outcome 2
- Outcome 3 (max 7 bullets)

## When to use me

Use when:

- Trigger phrase / situation 1
- Situation 2

Don't use when:

- Out-of-scope case (point to correct skill if known)

## Workflow

1. **Inspect** — gather context first (read files, run read-only commands). State what you found.
2. **Plan** — propose approach; ask clarifying questions if ambiguous (list them).
3. **Execute** — do the work in smallest verifiable steps.
4. **Verify** — run checks / show diff; state how to undo.

## Rules / Constraints

- MUST: verify before writing; prefer editing existing files over creating new ones.
- MUST NOT: invent URLs, tool-specific syntax, or destructive commands without confirmation.
- Keep the core response concise; put details in `references/` files.

## Output format

```text
<exact artifact shape the agent must produce, e.g. commit message, review table, file diff>
```

## References

- `references/<topic>.md` — load ONLY when <condition>. (Delete section if none.)
- `scripts/<helper>` — run with <command> when <condition>. Scripts must be stdlib-only.

---
name: version-bump
description: Propose correct semver bumps from change types and breaking notes. Use when deciding the next version number before release.
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: git-release
  version: 0.1.0
  author: hornet-swarm
---

## What I do

- Classify changes (major/minor/patch) per semver rules
- Propose the next version and the files to update
- Guard against accidental breaking releases

## When to use me

Use when:

- Deciding the next version number before release
- Checking whether a change is breaking

Don't use when:

- Drafting the notes themselves (use `changelog-release`)

## Workflow

1. **Inspect** — read current version, commits/PRs since last tag, and any BREAKING notes.
2. **Plan** — classify: breaking → major, features → minor, fixes only → patch (0.x rules: breaking → minor). Confirm pre-release suffix if needed.
3. **Execute** — propose `X.Y.Z → X'.Y'.Z'`, list files to update (manifest, lockfile, changelog).
4. **Verify** — show the bump rationale table; never edit/publish without confirmation.

## Rules / Constraints

- MUST: justify the bump from change evidence, not gut feel.
- MUST NOT: skip major on breaking public API changes.
- MUST NOT: edit version files or tag without explicit request.

## Output format

```markdown
## Version: <old> → <new> (<major|minor|patch>)
| Change | Type | Evidence |
|---|---|---|
| ... | breaking/feature/fix | <commit/PR> |
Files to update: <paths>
```

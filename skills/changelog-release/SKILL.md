---
name: changelog-release
description: Draft release notes and changelogs from merged PRs and tags. Use when preparing any tagged release or version announcement.
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: git-release
  version: 0.1.0
  author: hornet-swarm
---

## What I do

- Collect merged PRs and commits since the last tag
- Group into features, fixes, breaking changes with migration notes
- Provide copy-pasteable tag and release commands

## When to use me

Use when:

- Preparing any tagged release or version announcement
- Writing a changelog entry for main

Don't use when:

- Choosing the version number itself (use `version-bump`)

## Workflow

1. **Inspect** — find last tag (`git describe --tags --abbrev=0`), list `git log <tag>..HEAD --oneline` and merged PRs.
2. **Plan** — group into Added/Fixed/Breaking; flag migrations; confirm version scheme with user if unclear.
3. **Execute** — draft notes with highlights, full changelog, install/upgrade snippet, rollback note.
4. **Verify** — show `gh release create <tag>` command; never tag/publish without confirmation.

## Rules / Constraints

- MUST: every breaking change has a migration note.
- MUST: verify the tag range covers exactly the release scope.
- MUST NOT: tag, publish, or push releases unasked.

## Output format

```markdown
## Release <vX.Y.Z>
### Highlights / Added / Fixed / Breaking (with migration)
Full log: `<tag>..HEAD`
Command: `gh release create vX.Y.Z --notes "..."`
```

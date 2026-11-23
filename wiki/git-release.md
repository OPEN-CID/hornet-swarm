# git-release

Clean history, reviewable PRs, safe releases.

| Skill | Type | Use it when |
|---|---|---|
| `changelog-release` | skill | Draft release notes and changelogs from merged PRs and tags. Use when preparing any tagged release or version announcement. |
| `git-advanced` | skill | Use advanced Git: interactive rebase, bisect, worktrees, submodules. Use beyond basic commits. |
| `git-branch` | skill | Manage clean focused branches with safe sync and naming. Use when starting work, switching context, or cleaning up branches. |
| `git-commit` | skill | Craft conventional commits from diffs. Use when the user asks to commit, write a commit message, or clean up VCS history. |
| `pr-create` | skill | Open focused reviewable pull requests with context and test proof. Use when the branch is ready for review or merge. |
| `version-bump` | skill | Propose correct semver bumps from change types and breaking notes. Use when deciding the next version number before release. |

Install: Copy-Item -Recurse skills/<name> .agents/skills/ - full file: `skills/<name>/SKILL.md`

Workflows (plays) live on the [workflows](workflows.md) page.

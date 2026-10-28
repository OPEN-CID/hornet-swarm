---
name: dart-code
description: Write null-safe Dart and Flutter with analyzer-clean code and widget tests. Use for any Dart or Flutter work.
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: languages
  version: 1.0.0
  author: hornet-swarm
---

## What I do

- Write idiomatic Dart that passes the project's format, lint, and tests
- Review Dart diffs for style, pitfalls, and architecture fit
- Set up or fix the Dart toolchain (format, lint, test) in any repo

## When to use me

Use when:

- writing or reviewing Dart or Flutter code
- setting up Flutter analyze or widget tests

Don't use when:

- The task is language-agnostic design (pick the design skill first, implement with me after).
- The repo pins a different toolchain - match the repo, tell me, and I adapt.

## Toolchain

| Step | Command |
|---|---|
| format | `dart format .` |
| lint | `dart analyze` |
| setup | `flutter pub get` |
| test | `flutter test` |

Run format, then lint, then tests - in that order, every time.

## Style rules

1. dart format plus analyzer with strict lints
2. public APIs documented
3. prefer final fields
4. keys on stateful widgets in lists
5. widget tests for golden paths

## Idioms (write like a native)

- sound null safety - late only with true init proof
- const constructors for static subtrees
- futures for one-shot, streams for ongoing
- sealed classes for UI states
- extensions for formatting, not business logic

```dart
sealed class UiState {}
final class Loading extends UiState {}
final class Ready extends UiState {
  Ready(this.names);
  final List<String> names;
}
```

## Architecture patterns

| Pattern | When |
|---|---|
| feature-first folders | each feature owns ui logic data |
| state management with riverpod or bloc | no setState spaghetti |
| repositories abstract data sources | widgets stay dumb |
| const widgets and keys in lists | hold 60fps |

## Pitfalls (mistake - fix)

- setState after dispose -- fix: check mounted
- BuildContext across async gaps -- fix: capture what you need
- network calls in build -- fix: hoist to init or future
- ignoring analyzer info lints -- fix: fix them

## Testing

flutter test; widget tests over mocks; integration for checkout flows.

## Workflow

1. Inspect: read the repo layout, toolchain configs, and neighboring code. Restate the conventions you found.
2. Plan: confirm new file vs edit, pattern choice, and test plan. Flag new dependencies before adding them.
3. Execute: implement in the smallest compiling steps; keep diffs reviewable.
4. Verify: run format, lint, and the affected tests; paste the commands and results.

## Rules / Constraints

- MUST: run the toolchain above (or the repo's pinned equivalent) before calling anything done.
- MUST: match surrounding idioms; no drive-by refactors of unrelated code.
- MUST NOT: add dependencies, change versions, or reformat unrelated files without asking.
- MUST NOT: leave TODOs or dead code in the diff.

## Output format

```text
Files: <paths changed>
Checks: format PASS / lint PASS / tests <cmd> PASS (<n> tests)
Notes: <pattern used, follow-ups if any>
```

## References

- Pair with code-review for the audit pass and repo-structure-guide for layout decisions.

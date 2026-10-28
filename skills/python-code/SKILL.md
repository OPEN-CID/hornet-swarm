---
name: python-code
description: Write idiomatic Python with type hints, ruff-clean style, and pytest proof. Use for any Python code, review, or packaging.
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: languages
  version: 1.0.0
  author: hornet-swarm
---

## What I do

- Write idiomatic Python that passes the project's format, lint, and tests
- Review Python diffs for style, pitfalls, and architecture fit
- Set up or fix the Python toolchain (format, lint, test) in any repo

## When to use me

Use when:

- writing or reviewing Python code
- setting up Python packaging, tests, or lint

Don't use when:

- The task is language-agnostic design (pick the design skill first, implement with me after).
- The repo pins a different toolchain - match the repo, tell me, and I adapt.

## Toolchain

| Step | Command |
|---|---|
| format | `ruff format .` |
| lint | `ruff check .` |
| setup | `python -m venv .venv` |
| test | `pytest -q` |

Run format, then lint, then tests - in that order, every time.

## Style rules

1. ruff format plus ruff check clean, line length 100
2. type hints on all public functions
3. docstrings on public modules, classes, functions
4. snake_case everywhere except CapWords classes
5. imports ordered stdlib, third-party, local

## Idioms (write like a native)

- pathlib over os.path, context managers for resources
- comprehensions for transforms, generators for streams
- dataclasses for structured data
- explicit virtualenv plus pinned requirements per project
- log, do not print, in library code

```python
from dataclasses import dataclass
from pathlib import Path

@dataclass(frozen=True)
class Order:
    id: str
    total_cents: int

def load(path: Path) -> list[Order]:
    rows = read_json(path)
    return [Order(**r) for r in rows]
```

## Architecture patterns

| Pattern | When |
|---|---|
| src layout (src, pkg, tests) | libraries and CLIs |
| handler-service-store layers | HTTP services |
| worker pool with context cancellation | background jobs |
| accept interfaces, return structs | testable boundaries |

## Pitfalls (mistake - fix)

- mutable default arguments -- fix: default None and build inside
- bare except pass -- fix: catch specific errors and log
- unpinned dependencies -- fix: pin with a lockfile
- CPU-bound threads under GIL -- fix: use multiprocessing

## Testing

pytest with fixtures and tmp_path; one behavior per test; cover changed code.

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
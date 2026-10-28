---
name: php-code
description: Write strict PHP 8 with types, static analysis, and Pest proof. Use for any PHP code or review.
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: languages
  version: 1.0.0
  author: hornet-swarm
---

## What I do

- Write idiomatic PHP that passes the project's format, lint, and tests
- Review PHP diffs for style, pitfalls, and architecture fit
- Set up or fix the PHP toolchain (format, lint, test) in any repo

## When to use me

Use when:

- writing or reviewing PHP code
- setting up Composer, phpstan, or Pest

Don't use when:

- The task is language-agnostic design (pick the design skill first, implement with me after).
- The repo pins a different toolchain - match the repo, tell me, and I adapt.

## Toolchain

| Step | Command |
|---|---|
| format | `php-cs-fixer fix` |
| lint | `phpstan analyse` |
| setup | `composer install` |
| test | `vendor/bin/pest` |

Run format, then lint, then tests - in that order, every time.

## Style rules

1. php-cs-fixer applied, phpstan max on changed code
2. strict_types and return types everywhere
3. PSR-12 with ordered imports
4. final classes by default
5. no superglobals in domain code

## Idioms (write like a native)

- declare strict_types in every file
- constructor property promotion for DTOs
- match expressions over switch cascades
- PDO prepared statements for all input
- enums for fixed sets, never magic strings

```php
declare(strict_types=1);

final readonly class Order {
    public function __construct(
        public string $id,
        public int $totalCents,
    ) {}
}
```

## Architecture patterns

| Pattern | When |
|---|---|
| framework structure or src with composer PSR-4 | no flat scripts |
| thin handlers, domain in services | framework stays at edges |
| queue for mail and exports | sync only what users wait for |
| readonly DTOs for request data | validate once at edge |

## Pitfalls (mistake - fix)

- loose double-equals comparisons -- fix: always triple-equals
- error suppression with at-sign -- fix: handle errors
- unescaped output -- fix: rely on template escaping
- outdated runtimes -- fix: track supported versions

## Testing

Pest or PHPUnit; feature tests for routes, unit for domain.

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

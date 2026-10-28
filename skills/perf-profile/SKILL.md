---
name: perf-profile
description: Measure first, then optimize hot paths with before-after proof. Use when facing slowness, timeouts, or high resource usage.
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: quality-testing
  version: 0.1.0
  author: hornet-swarm
---

## What I do

- Profile with real measurements (timings, traces, query plans) before changing code
- Fix hot paths: N+1, missing indexes, wasteful allocations, serial work
- Prove gains with before/after numbers on the same workload

## When to use me

Use when:

- Facing slowness, timeouts, or high CPU/memory/IO usage
- Validating a performance claim before release

Don't use when:

- No measured problem exists (don't prematurely optimize)

## Workflow

1. **Inspect** — reproduce with a fixed workload and measure baseline (p50/p95, traces, slow queries). Identify the top hotspot.
2. **Plan** — propose one targeted change (index, batching, caching, parallelism). Predict the gain and state risks.
3. **Execute** — change only the hotspot; keep the workload identical.
4. **Verify** — re-measure same workload; report before/after with the same profiler output.

## Rules / Constraints

- MUST: numbers before and after on identical workloads; no optimization without profiling.
- MUST: keep correctness tests green; caches need invalidation rules.
- MUST NOT: micro-opt without a measured hotspot.

## Output format

```markdown
## Perf: <operation>
- Baseline: p50 <x> p95 <y> (profiler: <output>)
- Change: <one targeted fix>
- After: p50 <x'> p95 <y'> — delta <%>
```

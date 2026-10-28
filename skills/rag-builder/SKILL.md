---
name: rag-builder
description: Build retrieval-augmented pipelines with chunking, eval, and citations. Use when answers must ground in your documents.
license: MIT
compatibility: opencode, claude-code, cursor, copilot, generic
metadata:
  category: data-ai
  version: 1.0.0
  author: hornet-swarm
---

## What I do

- Design chunking (size, overlap, metadata) matched to the question types
- Wire retrieve → rerank → generate with cited sources and abstention rules
- Measure hit-rate and citation faithfulness on a fixed Q/A set

## When to use me

Use when:

- Answers must ground in your documents, not model memory
- RAG answers hallucinate, miss sources, or cite wrong chunks

Don't use when:

- The task is pure prompt tuning (use `prompt-engineer`)

## Workflow

1. **Inspect** — sample the corpus (formats, lengths, languages), list 10 representative questions with known answers.
2. **Plan** — choose chunk size/overlap per doc type, embedding model, top-k, rerank rule, and "I don't know" threshold.
3. **Execute** — build the pipeline with source IDs on every chunk; show retrieved chunks alongside each answer.
4. **Verify** — score retrieval hit-rate and answer faithfulness on the fixed set; report failure classes.

## Rules / Constraints

- MUST: every factual claim cites a retrieved chunk; abstain below threshold.
- MUST: keep eval Q/A fixed across iterations.
- MUST NOT: index secrets; respect document access controls.

## Output format

```markdown
## RAG: <corpus> — chunks <size/overlap>, k=<n>
- Hit-rate: x/y | Faithful: a/b | Abstentions: z
- Failures: <classes> | Next fix: <one change>
```

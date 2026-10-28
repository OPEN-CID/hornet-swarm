# data-ai

Query, clean, prompt, retrieve, evaluate.

| Skill | Use it when |
|---|---|
| `data-clean` | Profile and clean messy datasets with auditable rules. Use when data has nulls, duplicates, or inconsistent formats. |
| `eval-harness` | Score AI behavior on fixed cases with rubrics and regression gates. Use when shipping or changing any model or prompt. |
| `prompt-engineer` | Design testable prompts with context, examples, and output contracts. Use when building or fixing LLM features. |
| `rag-builder` | Build retrieval-augmented pipelines with chunking, eval, and citations. Use when answers must ground in your documents. |
| `sql-query` | Write correct parameterized SQL with joins, aggregates, and EXPLAIN checks. Use when querying or changing relational data. |

Install: Copy-Item -Recurse skills/<name> .agents/skills/ - full file: skills/<name>/SKILL.md
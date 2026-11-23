# data-ai

Query, clean, prompt, retrieve, evaluate.

| Skill | Type | Use it when |
|---|---|---|
| `anthropic-api-guide` | skill | Use the Anthropic API with keys, models, and prompt cache. Use for Claude features. |
| `data-clean` | skill | Profile and clean messy datasets with auditable rules. Use when data has nulls, duplicates, or inconsistent formats. |
| `eval-harness` | skill | Score AI behavior on fixed cases with rubrics and regression gates. Use when shipping or changing any model or prompt. |
| `openai-api-guide` | skill | Use the OpenAI API with keys, models, and cost controls. Use for GPT features. |
| `prompt-engineer` | skill | Design testable prompts with context, examples, and output contracts. Use when building or fixing LLM features. |
| `rag-builder` | skill | Build retrieval-augmented pipelines with chunking, eval, and citations. Use when answers must ground in your documents. |
| `sql-query` | skill | Write correct parameterized SQL with joins, aggregates, and EXPLAIN checks. Use when querying or changing relational data. |

Install: Copy-Item -Recurse skills/<name> .agents/skills/ - full file: `skills/<name>/SKILL.md`

Workflows (plays) live on the [workflows](workflows.md) page.

# data-ai

Query, clean, prompt, retrieve, evaluate.

| Skill | Type | Use it when |
|---|---|---|
| `agent-builder` | skill | Build tool-using AI agents with loops and guardrails. Use for agent features. |
| `anthropic-api-guide` | skill | Use the Anthropic API with keys, models, and prompt cache. Use for Claude features. |
| `data-clean` | skill | Profile and clean messy datasets with auditable rules. Use when data has nulls, duplicates, or inconsistent formats. |
| `eval-harness` | skill | Score AI behavior on fixed cases with rubrics and regression gates. Use when shipping or changing any model or prompt. |
| `huggingface-use` | skill | Use Hugging Face models with pipelines and fine-tuning. Use for NLP and vision. |
| `openai-api-guide` | skill | Use the OpenAI API with keys, models, and cost controls. Use for GPT features. |
| `prompt-engineer` | skill | Design testable prompts with context, examples, and output contracts. Use when building or fixing LLM features. |
| `pytorch-start` | skill | Train PyTorch models with data loaders and eval loops. Use for deep learning. |
| `rag-builder` | skill | Build retrieval-augmented pipelines with chunking, eval, and citations. Use when answers must ground in your documents. |
| `sklearn-basics` | skill | Build scikit-learn baselines with validation and tuning. Use for tabular ML. |
| `sql-query` | skill | Write correct parameterized SQL with joins, aggregates, and EXPLAIN checks. Use when querying or changing relational data. |

Install: Copy-Item -Recurse skills/<name> .agents/skills/ - full file: `skills/<name>/SKILL.md`

Workflows (plays) live on the [workflows](workflows.md) page.

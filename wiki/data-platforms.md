# data-platforms

Snowflake, Databricks, BigQuery, dbt, Kafka, Postgres and more. Watch the bill.

| Skill | Type | Use it when |
|---|---|---|
| `airflow-basics` | skill | Schedule pipelines with Airflow DAGs, retries, and alerts. Use for orchestration. |
| `bigquery-guide` | skill | Query BigQuery with partitioning, slots, and cost controls. Use for GCP analytics. |
| `databricks-guide` | skill | Build on Databricks with jobs, Delta Lake, and Unity Catalog. Use for Databricks lakehouses. |
| `dbt-build` | skill | Model transforms with dbt: staging, marts, tests, docs. Use for SQL pipelines. |
| `kafka-basics` | skill | Stream events with Kafka topics, keys, and consumer groups. Use for event pipelines. |
| `mongodb-basics` | skill | Model MongoDB documents with indexes and aggregation. Use for document apps. |
| `mysql-basics` | skill | Run MySQL with schema design, backups, and replication. Use for MySQL apps. |
| `postgres-tune` | skill | Tune Postgres with indexes, vacuum, and EXPLAIN. Use for slow databases. |
| `redis-basics` | skill | Cache with Redis using TTLs, eviction, and persistence picks. Use for speed layers. |
| `snowflake-guide` | skill | Run Snowflake with warehouses, stages, streams/tasks, and cost guards. Use for Snowflake data work. |

Install: Copy-Item -Recurse skills/<name> .agents/skills/ - full file: `skills/<name>/SKILL.md`

Workflows (plays) live on the [workflows](workflows.md) page.

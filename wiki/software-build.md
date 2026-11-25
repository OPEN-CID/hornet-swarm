# software-build

Design, write, fix, and reshape code.

| Skill | Type | Use it when |
|---|---|---|
| `a11y-basics` | skill | Make web apps accessible with semantics, focus, and testing. Use for inclusive UI. |
| `api-design` | skill | Design clean REST or RPC APIs with resources, schemas, and error contracts. Use when creating or changing any API endpoint or data contract. |
| `api-spec-parse` | skill | Parse OpenAPI specs and docs into client code and test lists. Use when integrating a third-party API. |
| `auth-patterns` | skill | Add auth with OAuth/OIDC, sessions, and safe token storage. Use for login features. |
| `chrome-extension` | skill | Build Chrome extensions with manifest v3 and store publish. Use for browser tools. |
| `code-explain` | skill | Translate code into plain-language explanations with flow maps. Use when onboarding or reviewing unfamiliar code. |
| `db-migration` | skill | Write safe reversible database migrations with backfill plans. Use when changing schema, adding indexes, or backfilling data. |
| `debugging` | skill | Diagnose bugs systematically with reproduction, hypothesis, and fix verification. Use when investigating any error, failure, or unexpected behavior. |
| `desktop-app` | skill | Ship desktop apps with Tauri or Electron and auto-update. Use for desktop tools. |
| `feature-flags` | skill | Ship behind feature flags with rollout and kill switches. Use for safe releases. |
| `fix-hotfix` | flow | Fix bugs with diagnosis, minimal fix, and regression proof. Use for any defect. |
| `flutter-app` | skill | Build Flutter apps with widgets, state, and store release. Use for cross-platform apps. |
| `frontend-component` | skill | Build accessible reusable UI components with props, states, and tests. Use when creating or refactoring any frontend component or page. |
| `graphql-api` | skill | Design GraphQL schemas with pagination and N+1-free resolvers. Use for GraphQL APIs. |
| `mobile-app-plan` | skill | Plan a mobile app with platform choice, screens, and store release. Use for app ideas. |
| `react-native-app` | skill | Build React Native apps with navigation and over-the-air updates. Use for JS mobile apps. |
| `refactoring` | skill | Restructure code safely in small behavior-preserving steps. Use when cleaning duplication, renaming, or extracting modules. |
| `repo-structure-guide` | skill | Design repo layouts that stay navigable at scale: monorepo vs polyrepo, per-language folders, docs and CI placement. Use when scaffolding or reorganizing any repository. |
| `saas-starter` | skill | Launch a SaaS with auth, billing, onboarding, and pricing. Use for product startups. |
| `ship-feature` | flow | Ship a feature from branch to merged PR with tests and review. Use when building anything shippable. |
| `webapp-build` | skill | Plan and build a web app with stack, auth, database, and deploy. Use for new web apps. |

Install: Copy-Item -Recurse skills/<name> .agents/skills/ - full file: `skills/<name>/SKILL.md`

Workflows (plays) live on the [workflows](workflows.md) page.

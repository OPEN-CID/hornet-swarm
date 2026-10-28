# languages

Idiomatic code in 20 languages: toolchain, style, idioms, arch patterns, pitfalls.

| Skill | Use it when |
|---|---|
| `c-code` | Write defensive C with -Werror warnings, explicit sizes, and checked errors. Use for any C code or review. |
| `cpp-code` | Write modern C++ (17/20) with RAII, smart pointers, and const-correctness. Use for any C++ code or review. |
| `csharp-code` | Write modern C# with records, pattern matching, and async discipline. Use for any C# or .NET code and reviews. |
| `dart-code` | Write null-safe Dart and Flutter with analyzer-clean code and widget tests. Use for any Dart or Flutter work. |
| `elixir-code` | Write concurrent Elixir with OTP discipline, changesets, and ExUnit proof. Use for any Elixir code or review. |
| `go-code` | Write idiomatic Go with wrapped errors, table tests, and race-clean concurrency. Use for any Go code or review. |
| `java-code` | Write modern Java with records, sealed types, and java.time. Use for any Java code or review. |
| `javascript-code` | Write modern JavaScript (ESM, async await) with eslint-clean style. Use for Node or browser JS code and reviews. |
| `kotlin-code` | Write null-safe Kotlin with coroutines discipline and detekt-clean code. Use for any Kotlin code or review. |
| `lua-code` | Write clean Lua with locals discipline, 1-index awareness, and busted proof. Use for Lua, Neovim plugins, or game scripting. |
| `php-code` | Write strict PHP 8 with types, static analysis, and Pest proof. Use for any PHP code or review. |
| `powershell-code` | Write pipeline-friendly PowerShell with approved verbs, Pester tests, and analyzer-clean code. Use for any PowerShell code or review. |
| `python-code` | Write idiomatic Python with type hints, ruff-clean style, and pytest proof. Use for any Python code, review, or packaging. |
| `r-code` | Write vectorized R with renv reproducibility and testthat proof. Use for any R analysis or package code. |
| `ruby-code` | Write idiomatic Ruby with RuboCop-clean style and RSpec proof. Use for Ruby or Rails code and reviews. |
| `rust-code` | Write safe Rust with ownership discipline, Result handling, and clippy-clean code. Use for any Rust code or review. |
| `scala-code` | Write immutable Scala 3 with ADTs, for-comprehensions, and munit proof. Use for any Scala code or review. |
| `shell-code` | Write safe Bash with strict mode, quoting discipline, and shellcheck-clean code. Use for any shell scripting or review. |
| `swift-code` | Write modern Swift with optionals discipline, value types, and actor-safe concurrency. Use for any Swift code or review. |
| `typescript-code` | Write strict TypeScript with no-explicit-any, discriminated unions, and vitest proof. Use for any TypeScript code or review. |

Install: Copy-Item -Recurse skills/<name> .agents/skills/ - full file: skills/<name>/SKILL.md
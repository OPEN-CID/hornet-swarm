#!/usr/bin/env bash
# Install hornet-swarm skills (copy-only). Usage:
#   bash scripts/install.sh --target .agents/skills [--skills git-commit,code-review] [--global]
set -euo pipefail
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TARGET=".agents/skills"
SKILLS=""
GLOBAL=0
while [[ $# -gt 0 ]]; do
  case "$1" in
    --target) TARGET="$2"; shift 2;;
    --skills) SKILLS="$2"; shift 2;;
    --global) GLOBAL=1; shift;;
    *) echo "unknown arg $1"; exit 1;;
  esac
done
if [[ "$GLOBAL" == 1 ]]; then TARGET="$HOME/.agents/skills"; fi
mkdir -p "$TARGET"
if [[ -z "$SKILLS" ]]; then
  for d in "$REPO_ROOT"/skills/*/; do
    s="$(basename "$d")"
    [[ -f "$d/SKILL.md" ]] || { echo "skip $s: no SKILL.md"; continue; }
    rm -rf "$TARGET/$s"; cp -r "$d" "$TARGET/$s"
    echo "installed $s -> $TARGET/$s"
  done
else
  IFS=',' read -ra ARR <<< "$SKILLS"
  for s in "${ARR[@]}"; do
    rm -rf "$TARGET/$s"; cp -r "$REPO_ROOT/skills/$s" "$TARGET/$s"
    echo "installed $s -> $TARGET/$s"
  done
fi
echo "Done. Also supported: .claude/skills, .opencode/skills"

#!/usr/bin/env bash
# Install hornet-swarm skills into any agent's skill dir (copy-only).
# Usage:
#   bash scripts/install.sh --tool cursor
#   bash scripts/install.sh --tool copilot --skills git-commit,code-review
#   bash scripts/install.sh --tool claude --global
#   bash scripts/install.sh --target my-project/.agents/skills
set -euo pipefail
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TOOL=""
TARGET=""
SKILLS=""
GLOBAL=0
while [[ $# -gt 0 ]]; do
  case "$1" in
    --tool) TOOL="$2"; shift 2;;
    --target) TARGET="$2"; shift 2;;
    --skills) SKILLS="$2"; shift 2;;
    --global) GLOBAL=1; shift;;
    *) echo "unknown arg $1"; exit 1;;
  esac
done

tool_target() {
  case "$1" in
    claude) echo ".claude/skills";;
    opencode) echo ".opencode/skills";;
    cursor|codex|gemini|universal|"") echo ".agents/skills";;
    copilot) echo ".github/skills";;
    *) echo "unknown tool $1 (try: claude opencode cursor copilot codex gemini universal)"; exit 1;;
  esac
}
tool_global() {
  case "$1" in
    claude) echo "$HOME/.claude/skills";;
    opencode) echo "$HOME/.config/opencode/skills";;
    cursor|codex|gemini|universal|"") echo "$HOME/.agents/skills";;
    copilot) echo "$HOME/.copilot/skills";;
    *) echo "unknown tool $1"; exit 1;;
  esac
}

if [[ -z "$TARGET" ]]; then
  if [[ "$GLOBAL" == 1 ]]; then TARGET="$(tool_global "$TOOL")";
  else TARGET="$(tool_target "$TOOL")"; fi
fi
mkdir -p "$TARGET"
install_one() {
  local s="$1"
  [[ -f "$REPO_ROOT/skills/$s/SKILL.md" ]] || { echo "skip $s: no SKILL.md"; return; }
  rm -rf "$TARGET/$s"; cp -r "$REPO_ROOT/skills/$s" "$TARGET/$s"
  echo "installed $s -> $TARGET/$s"
}
if [[ -z "$SKILLS" ]]; then
  for d in "$REPO_ROOT"/skills/*/; do install_one "$(basename "$d")"; done
else
  IFS=',' read -ra ARR <<< "$SKILLS"
  for s in "${ARR[@]}"; do install_one "$s"; done
fi
if [[ "$TOOL" == "gemini" ]]; then
  echo "NOTE: Gemini CLI has no native SKILL.md discovery. See docs/USAGE.md (Gemini section)."
fi
echo "Done. Verify: open a fresh session in your tool and ask it to list available skills."

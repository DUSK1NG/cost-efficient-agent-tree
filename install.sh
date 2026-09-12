#!/usr/bin/env sh
set -eu

marketplace_source="DUSK1NG/cost-efficient-agent-tree"
marketplace_name="cost-efficient-agent-tree-local"
plugin_selector="cost-efficient-agent-tree@$marketplace_name"

if ! command -v codex >/dev/null 2>&1; then
  echo "codex command not found. Install or update Codex CLI first." >&2
  exit 1
fi

marketplace_list="$(codex plugin marketplace list --json)"
if printf '%s\n' "$marketplace_list" | grep -Eq '"name"[[:space:]]*:[[:space:]]*"cost-efficient-agent-tree-local"'; then
  codex plugin marketplace upgrade "$marketplace_name"
else
  codex plugin marketplace add "$marketplace_source"
fi

codex plugin add "$plugin_selector"
printf '%s\n' 'Installation complete. Restart Codex, start a new conversation, and explicitly invoke $cost-efficient-agent-tree.'

#!/usr/bin/env bash
# One-time import of query files from nvim-treesitter.
# This script is NOT intended for ongoing sync — we maintain queries independently.
#
# Usage: ./scripts/import-from-nvim-treesitter.sh [path-to-nvim-treesitter-clone]
#
# If no path is given, it shallow-clones nvim-treesitter to a temp directory.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(dirname "$SCRIPT_DIR")"

if [[ $# -ge 1 ]]; then
  SRC="$1/runtime/queries"
else
  TMP="$(mktemp -d)"
  trap 'rm -rf "$TMP"' EXIT
  echo "Cloning nvim-treesitter (shallow)..."
  git clone --depth 1 --single-branch --quiet https://github.com/nvim-treesitter/nvim-treesitter.git "$TMP/nvim-treesitter"
  SRC="$TMP/nvim-treesitter/runtime/queries"
fi

if [[ ! -d "$SRC" ]]; then
  echo "Error: queries directory not found at $SRC" >&2
  exit 1
fi

echo "Importing queries from $SRC ..."

# Copy all language query directories
count=0
for lang_dir in "$SRC"/*/; do
  lang="$(basename "$lang_dir")"
  dest="$REPO_ROOT/$lang"
  mkdir -p "$dest"
  cp "$lang_dir"/*.scm "$dest/" 2>/dev/null || true
  count=$((count + 1))
done

echo "Imported queries for $count languages."

#!/usr/bin/env bash

set -euo pipefail

ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
MANIFEST="$ROOT/manifests/files.tsv"
STATE_ROOT="${XDG_STATE_HOME:-$HOME/.local/state}/puzll-dotfiles"

die() { printf 'error: %s\n' "$*" >&2; exit 1; }
info() { printf '%s\n' "$*"; }
require() { command -v "$1" >/dev/null 2>&1 || die "Required command is missing: $1"; }

module_selected() {
  local module="$1" selected="${2:-all}"
  [[ "$selected" == all || ",$selected," == *",$module,"* ]]
}

render_file() {
  local source="$1" destination="$2"
  sed -e "s|__HOME__|$HOME|g" -e "s|__USER__|${USER:-$(id -un)}|g" "$source" > "$destination"
}

backup_path() {
  local target="$1" backup_root="$2" relative
  [[ -e "$target" || -L "$target" ]] || return 0
  relative="${target#/}"
  mkdir -p "$backup_root/$(dirname "$relative")"
  cp -a -- "$target" "$backup_root/$relative"
}

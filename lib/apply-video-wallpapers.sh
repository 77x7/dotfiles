#!/usr/bin/env bash

set -euo pipefail
ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
source "$ROOT/lib/common.sh"

dry_run=0
[[ "${1:-}" == --dry-run ]] && dry_run=1
landscape="$HOME/.local/share/puzll-dotfiles/wallpapers/silent-katana-landscape.mp4"
portrait="$HOME/.local/share/puzll-dotfiles/wallpapers/silent-katana-right-portrait.mp4"
plugin="luisbocanegra.smart.video.wallpaper.reborn"

script="$(sed \
  -e "s|__LANDSCAPE__|${landscape//|/\\|}|g" \
  -e "s|__PORTRAIT__|${portrait//|/\\|}|g" \
  -e "s|__PLUGIN__|$plugin|g" \
  "$ROOT/plasma/apply-video-wallpapers.js")"

if (( dry_run )); then
  printf 'would configure Plasma desktops using:\n  landscape: %s\n  portrait: %s\n' "$landscape" "$portrait"
  exit 0
fi

[[ -r "$landscape" ]] || die "Missing managed landscape video; run: $ROOT/bin/dotfiles apply video-wallpapers"
[[ -r "$portrait" ]] || die "Missing managed portrait video; run: $ROOT/bin/dotfiles apply video-wallpapers"
require busctl
busctl --user status org.kde.plasmashell >/dev/null 2>&1 || die 'Plasma Shell is not running'
busctl --user call org.kde.plasmashell /PlasmaShell org.kde.PlasmaShell evaluateScript s "$script" >/dev/null
info 'Applied orientation-aware video wallpapers to current Plasma desktops.'

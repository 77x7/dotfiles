# Puzll's portable KDE setup

This repository is the declarative inventory and coordinator for the desktop. It tracks portable configuration, selected personal assets, package intent, exact machine references, and the separate repositories containing locally authored software.

It is not a raw home-directory backup. Tokens, wallets, cookies, browser profiles, histories, caches, build products, hardware audio routes, and VPN material are intentionally excluded.

## Commands

```bash
./bin/dotfiles list
./bin/dotfiles capture
./bin/dotfiles capture --machine current-desktop
./bin/dotfiles apply shell,terminal,kde-settings --dry-run
./bin/dotfiles apply shell,terminal,kde-settings
./bin/dotfiles apply video-wallpapers
./bin/dotfiles apply-video-wallpapers
./bin/dotfiles apply-machine current-desktop --dry-run
./bin/dotfiles packages
./bin/dotfiles projects
./bin/dotfiles check
```

`capture` refreshes the repository from the running system. `apply` restores portable modules and creates a timestamped backup in `${XDG_STATE_HOME:-$HOME/.local/state}/puzll-dotfiles/backups`. Exact Plasma layouts and monitor state are opt-in machine profiles and are never part of normal apply.

The video module imports the current files from `Downloads` once, but restores them to `~/.local/share/puzll-dotfiles`. `apply-video-wallpapers` selects the landscape video for landscape outputs and the custom right-hand crop for portrait outputs.

The wallpaper videos are managed with Git LFS and may have redistribution restrictions. Keep the repository private unless the media licenses have been verified.

## Structure

- `payload/home/`: portable files installed relative to `$HOME`.
- `assets/`: user-curated media that must survive independently of `Downloads`.
- `profiles/machines/`: exact, guarded host references.
- `manifests/files.tsv`: the bidirectional capture/apply contract.
- `manifests/packages.json`: package intent and distro mappings.
- `manifests/projects.tsv`: canonical authored and locally modified source repositories.
- `manifests/third-party.json`: provenance for installed themes, widgets, and effects.
- `docs/inventory.md`: discovered customization inventory and ownership boundaries.

## Restore order

1. Run `./bin/dotfiles packages` and install the applicable package groups.
2. Clone the repositories reported by `./bin/dotfiles projects`.
3. Run `./bin/dotfiles apply <modules>` for portable configuration.
4. Use MediaVol for its adaptive Plasma panels, focused-volume stack, and visual asset installer.
5. Apply a machine profile only when its display topology is intentionally being reproduced.
6. Provision Cider, VPN, CLI proxy, SSH/GPG, browser, and application credentials manually.

## Continuous maintenance

Run `./bin/dotfiles capture` after changing tracked settings, inspect `git diff`, then run `./bin/dotfiles check`. The manifest is the allowlist: add a path only after deciding whether it is portable, machine-specific, generated, or secret-bearing.

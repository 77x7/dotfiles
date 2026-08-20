# Puzll's portable KDE setup

This repository is the declarative inventory and coordinator for the desktop. It tracks portable configuration, selected personal assets, package intent, and the separate repositories containing locally authored software.

It is not a raw home-directory backup. Tokens, wallets, cookies, browser profiles, histories, caches, build products, hardware audio routes, and VPN material are intentionally excluded.

## Commands

```bash
./bin/dotfiles list
./bin/dotfiles capture
./bin/dotfiles apply shell,terminal,kde-settings --dry-run
./bin/dotfiles apply shell,terminal,kde-settings
./bin/dotfiles apply video-wallpapers
./bin/dotfiles apply-video-wallpapers
./bin/dotfiles packages
./bin/dotfiles projects
./bin/dotfiles check
```

`capture` refreshes the repository from the running system. `apply` restores portable modules and creates a timestamped backup in `${XDG_STATE_HOME:-$HOME/.local/state}/puzll-dotfiles/backups`.

The video module imports the current files from `Downloads` once, but restores them to `~/.local/share/puzll-dotfiles`. `apply-video-wallpapers` reads current output geometry at runtime: landscape outputs use the full video, while portrait outputs use the left or right crop according to their live position relative to the nearest landscape output.

The wallpaper videos are managed with Git LFS and may have redistribution restrictions. Keep the repository private unless the media licenses have been verified.

## Structure

- `payload/home/`: portable files installed relative to `$HOME`.
- `payload/home/.local/share/puzll-dotfiles/`: user-curated media that must survive independently of `Downloads`.
- `manifests/files.tsv`: the bidirectional capture/apply contract.
- `manifests/packages.json`: package intent and distro mappings.
- `manifests/projects.tsv`: canonical authored and locally modified source repositories.
- `manifests/third-party.json`: provenance for installed themes, widgets, and effects.
- `docs/inventory.md`: discovered customization inventory and ownership boundaries.

## Restore order

1. Run `./bin/dotfiles packages` and install the applicable package groups.
2. Clone the repositories reported by `./bin/dotfiles projects`, including Emoji-cord as the input method.
3. Run `./bin/dotfiles apply <modules>` for portable configuration.
4. Use MediaVol for its adaptive Plasma panels, focused-volume stack, and visual asset installer.
5. Provision Cider, VPN, CLI proxy, SSH/GPG, browser, and application credentials manually.

No monitor topology, EDIDs, connector names, output positions, resolutions, Plasma containment IDs, or activity UUIDs are stored. MediaVol generates panels for the outputs available at apply time, and the video wallpaper script chooses media from each output's current orientation.

## Continuous maintenance

Run `./bin/dotfiles capture` after changing tracked settings, inspect `git diff`, then run `./bin/dotfiles check`. The manifest is the allowlist: add a path only after confirming it is portable and neither generated, hardware-bound, nor secret-bearing.

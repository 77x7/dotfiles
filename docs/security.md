# Secret handling

The repository stores secret requirements, never secret values.

Provision these after restore with mode `0600` where applicable:

- Cider API token in `~/.config/ciderctl/config`.
- WireGuard profile used by the JDownloader VPN launcher.
- CLIProxyAPI keys and OAuth state.
- Codex, Claude, and OpenCode authentication.
- SSH/GPG keys, KWallet, browser logins, and application sessions.

Before every commit, run `./bin/dotfiles check` and inspect `git diff`. If a credential was ever committed, removing it from the current tree is insufficient: rotate it and purge it from repository history before publishing.

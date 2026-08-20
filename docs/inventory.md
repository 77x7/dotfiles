# Customization inventory

## Authored software

- **Emoji-cord**: original KDE Wayland input method in `~/Emoji-cord`; it includes the `emoji-cord-context` KWin script and desktop entries. The repository has substantial uncommitted source changes and no remote.
- **MediaVol**: original restore/automation system in `~/MediaVol`; currently an uncommitted Git repository. It is the canonical source for focused-volume, Cider controls, adaptive Plasma panels, launchers, services, and bundled visual assets.
- **No Vicinae Animation**: tiny authored KWin scripted effect, canonicalized as `~/Documents/Projects/no-vicinae-animation`.
- **Desktop audio automation**: focused application volume, repeat dispatch, Cider controls, and the pavucontrol gamebar overlay are canonically grouped under MediaVol.
- **JDownloader VPN launcher**: authored local scripts exist in `~/.local/bin`; the referenced WireGuard profile is secret and deliberately excluded.

## KDE desktop

- Two custom bottom panels currently exist, one per display, with SCP Menu Reborn, Window Title, Fancy Tasks NG, PlasMusic Toolbar, System Tray, and Digital Clock.
- `~/.config/plasma-org.kde.plasma.desktop-appletsrc` contains exact containment IDs, activity UUIDs, output mappings, tray history, resolutions, and hard-coded source-home paths. It belongs only to the `current-desktop` machine profile.
- MediaVol's `sources/plasma-layout/adaptive-panel.js` is the portable panel source and should remain the normal restore path.
- KWin has custom shortcuts, KZones layouts, remembered window positions, focused-volume and Emoji-cord context scripts, No Vicinae Animation, Kinetic Fading Popups, Better Blur DX, Karousel, Eye on Screen, and Keep Above Outline.
- The local Window Title widget removes a private appmenu import for Plasma compatibility. Preserve this as a patch against upstream, not as original authorship.
- The pavucontrol overlay rule contains portable matching behavior but machine-specific geometry.

## Appearance

- Active stack: Layan global/Plasma theme, Fluent Purple Dark icons, Layan Solid Dark Kvantum, Utterly Round Dark Solid Aurorae decoration, Layan Dark GTK, Bibata Modern Ice Oreo Hands cursor, Cantarell fonts, and a purple accent.
- Third-party assets and inactive alternatives are recorded in `manifests/third-party.json`; they are dependencies with provenance, not authored source.
- The active lock screen uses the static Layan wallpaper.
- SDDM uses the upstream Qylock `sword` video theme. Installed Sword, Enfield, and Wuwa copies match upstream and are not local authored projects.

## Personal media

- The horizontal Silent Katana video and portrait right-monitor crop are active Plasma wallpapers.
- The portrait video is an adapted monitor-specific crop and must be treated as a personal asset even though its source video is third-party media.
- These files currently live in `~/Downloads`, so the dotfiles asset capture relocates them to a stable managed location before portable layout generation references them.

## Non-KDE setup

- Zsh with Oh My Zsh, Powerlevel10k, fzf-tab, zsh-sage, and syntax highlighting.
- Ghostty with transparency, blur, and a cursor-tail shader.
- Fcitx 5, Espanso, and xremap input integrations.
- PipeWire/PulseAudio, EasyEffects, pavucontrol-qt, Cider, and focused-volume audio workflows.
- App preferences for MPV, btop, micro, superfile, MangoHud, vkBasalt, Vicinae, qimgv, and fontget.
- MIME defaults use Helium, qimgv, MPV, CudaText, Ark, Dolphin, qBittorrent, and custom URI handlers.

## Never capture

- `~/.ssh`, `~/.gnupg`, KWallet, browser/Electron profiles, CLIProxyAPI auth, Codex/Claude/OpenCode auth, Cider token, VPN configuration, cookies, histories, sessions, and PulseAudio cookie.
- `.cache`, `.local/state`, Flatpak OSTree data, Steam data, containers, package stores, build directories, `node_modules`, Cargo registries, and generated backups.
- WirePlumber routes/default nodes, KScreen data outside an explicit machine profile, NVIDIA state, device IDs, and runtime databases.

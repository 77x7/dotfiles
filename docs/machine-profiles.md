# Machine profiles

Portable setup and exact restoration are intentionally separate.

`current-desktop` describes the ASUS/Nobara workstation with a 2560x1440 landscape display and a rotated 1920x1080 portrait display. Its exact profile may contain monitor hashes, connector names, Plasma containment IDs, activity UUIDs, panel mappings, and fixed overlay geometry.

Capture it with:

```bash
./bin/dotfiles capture --machine current-desktop
```

Apply it only after confirming the target has the intended topology and compatible Plasma version:

```bash
./bin/dotfiles apply-machine current-desktop --dry-run
./bin/dotfiles apply-machine current-desktop
```

Actual exact-state application is refused while Plasma Shell is running. Use a TTY or logged-out user session. `--force` bypasses both the hostname and live-Plasma safeguards and should be reserved for intentional recovery.

The normal portable route is MediaVol's adaptive layout, which creates managed panels for the displays that actually exist and does not restore EDIDs or containment IDs.

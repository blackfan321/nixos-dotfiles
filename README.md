# NixOS dotfiles

My personal flake for NixOS + Home Manager.

## Structure

- `flake.nix` - main flake-file
- `flake.lock` - pinned versions of flake inputs
- `nixos/` - NixOS configuration
- `home-manager/` - home-manager configuration
- `assets/` - some pictures and other stuff
- `secrets/` - git-crypted files
- `justfile` - some handy commands

## Some Features
- `CachyOS kernel` - desktop-optimized kernel (zen4 + LTO)
- `Lix` - community-driven, more alive Nix fork
- `uutils coreutils` - Rust drop-in replacement for GNU coreutils
- `nh` - modern, convenient and nice-looking NixOS CLI helper
- `run0` - systemd-based `sudo` alternative (no more SUID)
- `networkmanager-amneziawg` - AmneziaVPN right inside NetworkManager (no need for their desktop app)

## Desktop software

- DE: `GNOME`
- Browser: `Zen Browser`
- Editor: `Zed`
- Terminal: `Ptyxis`
- Password manager: `KeePassXC`
- Gaming: `Steam`, `PrismLauncher`, `Hytale`
- Media player: `VLC`
- Messaging: `Telegram`, `eXpress`, `Loop`
- Office suite: `OnlyOffice`
- Remote desktop: `Remmina`
- Torrent client: `qBittorrent`
- Learning: `Anki`
- API client: `Yaak`

And some other stuff.

## CLI software

TBD.

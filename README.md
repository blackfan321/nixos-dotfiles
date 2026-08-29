# NixOS dotfiles

My personal flake for NixOS + Home Manager.

## Structure

- `flake.nix` - main flake-file
- `flake.lock` - pinned versions of flake inputs
- `justfile` - some handy commands
- `nixos/` - NixOS configuration
- `home-manager/` - home-manager configuration
- `assets/` - some pictures and other stuff
- `secrets/` - git-crypted files

## Some Features
- `CachyOS kernel` - desktop-optimized kernel (zen4 + LTO)
- `Lix` - community-driven, more alive Nix fork
- `uutils coreutils` - Rust drop-in replacement for GNU coreutils
- `nh` - modern, convenient and nice-looking NixOS CLI helper
- `run0` - systemd-based `sudo` alternative (no more SUID)
- `ncro` - local binary cache proxy to pick the fastest substituter
- `nix-gen` - human-readable labels for NixOS generations in the boot menu
- `scx` - sched-ext CPU scheduler for smoother desktop latency
- `networkmanager-amneziawg` - AmneziaVPN right inside NetworkManager (no need for their desktop app)
- `steam-config-nix` - declarative steam games configuration

# ❄️ NixOS dotfiles

My personal flake for NixOS + Home Manager.

## 📂 Structure

- `flake.nix` - main flake-file
- `flake.lock` - pinned versions of flake inputs
- `justfile` - some handy commands
- `flake/` - flake output modules
- `nixos/` - NixOS configuration
- `home-manager/` - home-manager configuration
- `assets/` - some pictures I use
- `secrets/` - git-crypted files

## 🧩 Infra Flakes
- [`flake-parts`](https://github.com/hercules-ci/flake-parts) - modular flake outputs
- [`import-tree`](https://github.com/denful/import-tree) - manual imports are no more
- [`DetSys nix`](https://github.com/DeterminateSystems/determinate) - they have lazy-trees!
- [`ncro`](https://github.com/manic-systems/ncro) - local binary cache proxy to pick the fastest substituter
- [`nix-gen`](https://github.com/htelsiz/nix-gen) - human-readable naming for NixOS generations
- [`nixpkgs-patcher`](https://github.com/gepbird/nixpkgs-patcher) - apply nixpkgs patches with zero hassle
- [`git-hooks.nix`](https://github.com/cachix/git-hooks.nix) - declarative pre-commit-hooks
- [`nix-update-git`](https://github.com/yuxqiu/nix-update-git) - check for newer release tags on flake inputs

## 🖥️ Userspace Stuff
- [`CachyOS kernel`](https://github.com/xddxdd/nix-cachyos-kernel) - desktop-optimized kernel
- [`Limine`](https://github.com/limine-bootloader/limine) - cool modern bootloader
- [`GNOME`](https://www.gnome.org/) - the best DE ever, fully declarative using dconf
- [`Zen Browser`](https://github.com/0xc000022070/zen-browser-flake) - Firefox-based browser with vertical tabs, workspaces and a clean, customizable UI
- [`nh`](https://github.com/nix-community/nh) - modern, convenient and nice-looking NixOS CLI helper
- [`uutils coreutils`](https://github.com/uutils/coreutils) - Rust drop-in replacement for GNU coreutils
- [`run0`](https://www.freedesktop.org/software/systemd/man/latest/run0.html) - systemd-based sudo alternative (no more SUID)
- [`scx`](https://github.com/sched-ext/scx) - sched-ext CPU scheduler for smoother desktop latency
- [`steam-config-nix`](https://github.com/different-name/steam-config-nix) - declarative Steam games configuration
- [`prismnix`](https://github.com/qacow37/prismnix) - declarative Minecraft

## 🛠️ My Flakes
- [`express-messenger-nix`](https://github.com/blackfan321/express-messenger-nix) - nix-packaging for [eXpress Messenger](https://express.ms/) 
- [`loop-messenger-nix`](https://github.com/blackfan321/loop-messenger-nix) - nix-packaging for [Loop Messenger](https://loop.ru/)
- [`ktalk-nix`](https://github.com/blackfan321/ktalk-nix) - nix-packaging for [Kontur.Talk](https://kontur.ru/talk/)
- [`steam-platform-stats`](https://github.com/blackfan321/steam-platform-stats) - my own fzf-powered CLI for browsing a Steam library with per-platform playtime stats
- [`text-extractor-ocr-nix`](https://github.com/blackfan321/text-extractor-ocr-nix) - tesseract wrapper for [Text Extractor](https://github.com/Aditya190803/TextExtractor)
- [`nautilus-open-in-zed`](https://github.com/blackfan321/nautilus-open-in-zed) - open files in Zed from Nautilus

---

<div align="center">

<a href="https://никспобеда.рф"><img src="https://img.shields.io/badge/никспобеда.рф-❄️_НИКС_ПОБЕДА-1793D1?style=for-the-badge&logo=nixos&logoColor=white" alt="никспобеда.рф"/></a>

</div>

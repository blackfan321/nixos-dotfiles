# NixOS dotfiles

My flake for NixOS + Home Manager.

## Structure

- `flake.nix` - main flake-file
- `flake.lock` - pinned versions of flake inputs
- `nixos/` - NixOS configuration
- `home-manager/` - user configuration
- `justfile` - some handy commands

## Quick start

1) Clone the repo:

```sh
git clone https://github.com/blackfan321/nixos-dotfiles
cd nixos-dotfiles
```

2) Replace my username everywhere with your own (e.g., change `blackfan321` to `alice`). If you want a quick bulk replace:

```sh
rg -l "blackfan321" | xargs sed -i 's/blackfan321/alice/g'
```

3) The default hostname is `nixos` (change it if you want to).

4) Edit the configs as you like, especially `nixos/modules/hardware.nix` and `nixos/modules/boot.nix`.

5) Build and apply the flake (you can do it as a non-root user):

```sh
nixos-rebuild switch --sudo --flake .
```

## Desktop software

- DE: `GNOME`
- Browser: `Firefox`
- Editor: `Zed`
- Terminal: `Ptyxis`
- Password manager: `KeePassXC`
- Gaming: `Steam`, `PrismLauncher`, `osu!lazer`, `Hytale`
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

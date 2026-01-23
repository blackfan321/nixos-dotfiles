# NixOS dotfiles

My flake for NixOS + Home Manager.

## Structure

- `flake.nix` - main flake-file (system + home-manager)
- `flake.lock` - locked inputs (pins nixpkgs and home-manager)
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

4) Edit the configs as you like, and you should really use your own files like `nixos/hardware.nix` and `nixos/boot.nix`.

5) Build the flake (you can do it as a non-root user):

```sh
nixos-rebuild switch --flake .#nixos
```

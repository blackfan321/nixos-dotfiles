set shell := ["zsh", "-cu"]

flake_sources := "flake.nix flake.lock nixos home-manager assets"

nixos-sync:
    git add nixos

home-manager-sync:
    git add home-manager

flake-sync:
    git add {{ flake_sources }}

flake-sync-commit:
    git add {{ flake_sources }}
    git diff --cached --quiet || git commit -m "chore: flake sync"

flake-check:
    nix flake check

flake-update:
    nix flake update

flake-update-switch:
    nix flake update
    nh os switch .

flake-switch:
    nh os switch .

prek-install:
    nix develop -c prek install

prek:
    nix develop -c prek run --all-files

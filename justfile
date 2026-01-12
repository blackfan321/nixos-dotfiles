set shell := ["zsh", "-cu"]

flake_sources := "flake.nix flake.lock nixos home-manager"

nixos-sync:
    git add nixos

home-manager-sync:
    git add home-manager

flake-sync:
    git add {{ flake_sources }}

flake-check:
    nix flake check

flake-sync-commit:
    git add {{ flake_sources }}
    git diff --cached --quiet || git commit -m "chore: flake sync"

flake-update:
    nix flake update

flake-switch:
    nixos-rebuild switch --sudo --flake .

flake-update-switch:
    nix flake update
    nixos-rebuild switch --sudo --flake .

set shell := ["zsh", "-cu"]

check:
    nix flake check --accept-flake-config

update:
    nix flake update --accept-flake-config

switch:
    nh os switch --accept-flake-config

switch-update:
    nh os switch --update --accept-flake-config

boot:
    nh os boot --accept-flake-config

boot-update:
    nh os boot --update --accept-flake-config

prek-install:
    nix develop --accept-flake-config -c prek install

prek:
    nix develop --accept-flake-config -c prek run --all-files

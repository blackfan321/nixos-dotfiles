set shell := ["zsh", "-cu"]

check:
    nix flake check

update:
    nix flake update

switch:
    nh os switch --accept-flake-config

switch-update:
    nh os switch --update --accept-flake-config

boot:
    nh os boot --accept-flake-config

boot-update:
    nh os boot --update --accept-flake-config

prek-install:
    nix develop  -c prek install

prek:
    nix develop -c prek run --all-files

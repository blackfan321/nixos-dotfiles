set shell := ["zsh", "-cu"]

check:
    nix flake check

update:
    nix flake update

switch:
    nh os switch

switch-update:
    nh os switch --update

boot:
    nh os boot

boot-update:
    nh os boot --update

prek-install:
    nix develop -c prek install

prek:
    nix develop -c prek run --all-files

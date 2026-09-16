set shell := ["zsh", "-cu"]

[private]
default:
    @just --choose

[private]
_add-label:
    vim \
      -c 'inoremap <buffer> <Space> -' \
      -c 'autocmd BufWritePre <buffer> silent! %s/ /-/ge | silent! %s/[^a-zA-Z0-9:_.-]//ge' \
      .nixos-label
    git add .nixos-label

[group('flake')]
check:
    nix flake check

[group('flake')]
update:
    nix flake update

[group('nh')]
switch: _add-label
    nh os switch

[group('nh')]
switch-update: _add-label
    nh os switch --update

[group('nh')]
boot: _add-label
    nh os boot

[group('nh')]
boot-update: _add-label
    nh os boot --update

[group('prek')]
prek-install:
    nix develop -c prek install

[group('prek')]
prek:
    nix develop -c prek run --all-files

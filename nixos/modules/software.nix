{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    vim
    uutils-coreutils-noprefix
    doggo
    wget
    killall
    htop
    file
    unzip
    unixtools.netstat
    inetutils
    pciutils
    mtr
    git-crypt
  ];

  programs = {
    zsh.enable = true;
    nano.enable = false; # nano sucks
    nix-ld.enable = true; # fix for uv
  };
}

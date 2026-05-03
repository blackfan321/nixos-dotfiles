{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    git
    vim
    uutils-coreutils-noprefix
    doas-sudo-shim
    nh
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
    nautilus-python
  ];

  programs = {
    zsh.enable = true;
    nano.enable = false; # nano sucks
    nix-ld.enable = true;
    gamemode.enable = true;
    amnezia-vpn.enable = true;
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    protontricks.enable = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };

  programs.nautilus-open-any-terminal = {
    enable = true;
    terminal = "ptyxis";
  };
}

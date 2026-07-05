{ pkgs, inputs, ... }:

{
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      "pnpm-10.29.2"
    ];
  };

  nixpkgs.overlays = [
    inputs.networkmanager-amneziawg.overlays.default
  ];

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
    nautilus-python
    amneziawg-tools
  ];

  programs = {
    zsh.enable = true;
    nano.enable = false; # nano sucks
    nix-ld.enable = true;
    gamemode.enable = true;
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    protontricks.enable = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin # for cool games
      dwproton-bin # for chinese casino games
    ];
  };

  programs.nautilus-open-any-terminal = {
    enable = true;
    terminal = "ptyxis";
  };
}

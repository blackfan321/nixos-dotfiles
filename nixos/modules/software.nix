{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    git
    zsh
    vim
    fastfetch
    fzf
    uv
    uutils-coreutils-noprefix
    doggo

    wget
    file
    htop
    unixtools.netstat
  ];

  programs.zsh.enable = true;
  programs.nano.enable = false;
  programs.nix-ld.enable = true;
  programs.gamemode.enable = true;
  programs.amnezia-vpn.enable = true;

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

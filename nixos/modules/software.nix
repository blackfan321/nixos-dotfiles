{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    zsh
    vim
    wget
    htop
    file
    fastfetch
    kitty
    fzf
    ulauncher
    hyprpanel
    amnezia-vpn
    hyprshot
    yazi
    networkmanagerapplet
    uv
    uutils-coreutils-noprefix
    doggo
  ];

  programs.zsh.enable = true;
  programs.nano.enable = false;
  programs.gamemode.enable = true;

  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    protontricks.enable = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };
}

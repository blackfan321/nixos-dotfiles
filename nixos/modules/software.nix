{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    zsh
    vim
    fastfetch
    kitty
    fzf
    ulauncher
    networkmanagerapplet
    uv
    uutils-coreutils-noprefix
    doggo
    nautilus

    wget
    file
    htop
    unixtools.netstat
    file
  ];

  programs.zsh.enable = true;
  programs.nano.enable = false;
  programs.gamemode.enable = true;
  programs.amnezia-vpn.enable = true;

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

  programs.nautilus-open-any-terminal = {
    enable = true;
    terminal = "kitty";
  };
}

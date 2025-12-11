{ pkgs, ... }: {

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # Desktop apps
    keepassxc
    telegram-desktop
    jetbrains.pycharm-community-bin
    remmina
    anki
    cider-2
    qbittorrent
    vlc
    hyprlock
    hyprcursor

    # CLI utils
    bc
    fzf
    htop
    unzip
    wget
    dysk
    bat

    # Coding stuff
    uv

    # WM stuff
    xdg-desktop-portal-hyprland

    # Games
    prismlauncher

    # Fonts
    inter
  ];

}

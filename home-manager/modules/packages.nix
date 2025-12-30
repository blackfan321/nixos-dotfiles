{ pkgs, ... }: {

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # Desktop apps
    keepassxc
    telegram-desktop
    remmina
    anki
    cider-2
    qbittorrent
    vlc
    hyprcursor
    yaak
    onlyoffice-desktopeditors
    hyprpanel
    loupe

    # CLI utils
    bc
    fzf
    htop
    unzip
    wget
    dysk
    bat
    onefetch
    killall
    just

    # Coding stuff
    uv

    # WM stuff
    xdg-desktop-portal-hyprland

    # Games
    prismlauncher
    sgdboop

    # Fonts
    rubik
  ];

}

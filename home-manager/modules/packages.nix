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
    yaak
    onlyoffice-desktopeditors
    ptyxis

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
    libnotify
    asciinema
    kdotool

    # Coding stuff
    uv

    # Games
    prismlauncher
    sgdboop

    # Fonts
    rubik

    adwaita-qt

    # Gnome Extensions
    gnomeExtensions.appindicator
    gnomeExtensions.caffeine
    gnomeExtensions.tiling-assistant
    gnomeExtensions.xwayland-indicator
  ];

}

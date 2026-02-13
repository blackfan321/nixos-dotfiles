{ pkgs, inputs, ... }:

{
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
    dysk
    bat
    just
    libnotify
    asciinema
    dive
    caligula
    sshuttle
    tldr
    fd
    sd
    ripgrep
    tokei
    bandwhich
    broot
    jq
    btop
    kubernetes-helm

    # Fetch utilities
    onefetch
    fastfetch

    # Coding stuff
    uv

    # Gaming staff
    prismlauncher
    sgdboop
    osu-lazer-bin
    protonplus

    # GNOME extensions
    gnomeExtensions.appindicator
    gnomeExtensions.caffeine
    gnomeExtensions.tiling-assistant
    gnomeExtensions.xwayland-indicator
    gnomeExtensions.notification-timeout

    # Hytale
    inputs.hytale-launcher.packages.${pkgs.system}.hytale-launcher
  ];
}

{ pkgs, inputs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # Desktop apps
    keepassxc
    telegram-desktop
    remmina
    anki
    qbittorrent
    vlc
    yaak
    onlyoffice-desktopeditors
    ptyxis
    pinta

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
    tree

    # Fetch utilities
    onefetch

    # Coding stuff
    uv

    # Gaming staff
    prismlauncher
    sgdboop
    protonplus

    # GNOME extensions
    gnomeExtensions.appindicator
    gnomeExtensions.caffeine
    gnomeExtensions.tiling-assistant
    gnomeExtensions.xwayland-indicator
    gnomeExtensions.notification-timeout
    gnomeExtensions.pip-on-top

    # Theming
    morewaita-icon-theme

    # Hytale
    inputs.hytale-launcher.packages.${pkgs.system}.hytale-launcher

    # eXpress
    inputs.express-messenger.packages.${pkgs.system}.express

    # Loop
    inputs.loop-messenger.packages.${pkgs.system}.loop-desktop

    # KTalk
    inputs.ktalk.packages.${pkgs.system}.ktalk

    # steam-platform-stats
    inputs.steam-platform-stats.packages.${pkgs.system}.steam-platform-stats
  ];
}

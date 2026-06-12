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
    amberol

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
    tree
    hwinfo

    # K8S utils
    kubectl
    kubelogin-oidc
    kubectx # kubens, kubectx
    kubeconform
    kubernetes-helm

    # Fetch utilities
    onefetch

    # Coding stuff
    uv

    # Gaming staff
    prismlauncher
    sgdboop

    # Theming
    morewaita-icon-theme

    # GNOME extensions
    gnomeExtensions.appindicator
    gnomeExtensions.caffeine
    gnomeExtensions.tiling-assistant
    gnomeExtensions.xwayland-indicator
    gnomeExtensions.notification-timeout
    gnomeExtensions.pip-on-top
    gnomeExtensions.copyous
    gnomeExtensions.text-extractor
    gnomeExtensions.quick-settings-audio-panel

    # text-extractor-ocr: OCR helper (not bundled in gnomeExtensions.text-extractor)
    # also contains tesseract package
    inputs.text-extractor-ocr.packages.${pkgs.system}.text-extractor-ocr

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

{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bc
    dysk
    just
    libnotify
    asciinema
    dive
    fd
    sd
    ripgrep
    sqlite
    tokei
    broot
    jq
    yq
    btop
    tree
    prek
    onefetch
    appimage-run
  ];
}

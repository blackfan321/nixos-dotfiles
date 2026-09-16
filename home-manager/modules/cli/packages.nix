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
    yq
    btop
    tree
    prek
    onefetch
    appimage-run
  ];
}

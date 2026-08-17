{ pkgs, inputs, system, ... }:

{
  home.packages = with pkgs; [
    bc
    dysk
    just
    libnotify
    asciinema
    dive
    tldr
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
  ]
  ++
  [
    inputs.steam-platform-stats.packages.${system}.steam-platform-stats
  ];
}

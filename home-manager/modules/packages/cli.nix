{ pkgs, inputs, ... }:

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
  ]
  ++
  [
    inputs.steam-platform-stats.packages.${pkgs.system}.steam-platform-stats
  ];
}

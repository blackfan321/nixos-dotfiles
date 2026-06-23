{ pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    bc
    dysk
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
    yq
    btop
    tree
    hwinfo
    prek
    onefetch
  ]
  ++
  [
    inputs.steam-platform-stats.packages.${pkgs.system}.steam-platform-stats
  ];
}

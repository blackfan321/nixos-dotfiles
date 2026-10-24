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
    # mcp-nixos disabled: fastmcp-slim 3.4.7 is broken against nixpkgs mcp 2.2.0,
    # re-enable after upstream fixes fastmcp/mcp version pairing
    betterleaks
  ];
}

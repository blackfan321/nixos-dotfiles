{ pkgs, inputs, system, ... }:

{
  home.packages = with pkgs; [
    telegram-desktop
    qbittorrent
    vlc
    yaak
    pinta
  ]
  ++
  [
    inputs.express-messenger.packages.${system}.express
    inputs.loop-messenger.packages.${system}.loop-desktop
    inputs.ktalk.packages.${system}.ktalk
  ];
}

{ pkgs, inputs, system, ... }:

{
  home.packages = with pkgs; [
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
  ]
  ++
  [
    inputs.express-messenger.packages.${system}.express
    inputs.loop-messenger.packages.${system}.loop-desktop
    inputs.ktalk.packages.${system}.ktalk
  ];
}

{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    amberol
    apostrophe
    authenticator
    collision
    commit
    dialect
    errands
    fragments
    gnome-podcasts
    gnome-secrets
    gnome-solanum
    gradia
    impression
    iotas
    keypunch
    komikku
    mousai
    newsflash
    pika-backup
    resources
    shortwave
    valuta
    warp
    wike
    wordbook
  ];
}

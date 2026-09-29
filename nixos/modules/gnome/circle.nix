{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    amberol
    apostrophe
    collision
    commit
    errands
    gradia
    impression
    iotas
    keypunch
    komikku
    pika-backup
    resources
    shortwave
    warp
  ];
}

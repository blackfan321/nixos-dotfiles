{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # amberol
    apostrophe
    collision
    commit
    gradia
    impression
    keypunch
    komikku
    resources
    shortwave
    warp
  ];
}

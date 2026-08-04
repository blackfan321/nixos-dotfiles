{ pkgs, ... }:

{
  virtualisation.podman = {
    enable = true;
    package = pkgs.podman;

    # docker alias
    dockerCompat = true;

    # allow containers talk to each other
    defaultNetwork.settings.dns_enabled = true;

    autoPrune = {
      enable = true;
      dates = "*-*-1/3 23:00";
    };
  };

  environment.systemPackages = [ pkgs.podman-compose ];
}

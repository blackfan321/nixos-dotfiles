{ username, pkgs, ... }:

{
  virtualisation.docker = {
    enable = true;
    package = pkgs.docker;

    autoPrune = {
      enable = true;
      dates = "*-*-1/3 23:00";
    };
  };

  users.extraGroups.docker.members = [ username ];
}

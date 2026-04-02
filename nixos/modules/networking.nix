{ pkgs, ... }:

{
  networking = {
    hostName = "nixos";
    networkmanager = {
      enable = true;
      plugins = with pkgs; [
        networkmanager-openvpn
      ];
    };
    hosts = {
      "10.221.2.30" = [ "confluence.ugsk.ru" ];
      "10.221.6.13" = [ "jira.ugsk.ru" ];
      "10.221.19.4" = [ "code.ugsk.ru" ];
      "45.134.124.57" = [ "express.ugsk.ru" ];
      "10.221.19.5" = [ "artifacts.ugsk.ru" ];
      "10.221.16.73" = [ "prod-code.ugsk.ru" ];
    };
  };
}

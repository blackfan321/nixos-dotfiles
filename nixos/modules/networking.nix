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
      "10.222.254.10" = [ "express-test.ugsk.ru" ];
    };
  };
}

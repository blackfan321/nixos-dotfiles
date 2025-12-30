{ pkgs, ... }:

{
  networking.hostName = "nixos";
  networking.networkmanager = {
    enable = true;
    plugins = with pkgs; [
      networkmanager-openvpn
    ];
  };
  networking.hosts = {
    "10.221.2.30" = [ "confluence.ugsk.ru" ];
    "10.221.6.13" = [ "jira.ugsk.ru" ];
    "10.222.254.10" = [ "express-test.ugsk.ru" ];
  };
}



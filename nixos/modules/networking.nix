{ pkgs, username, config, ... }:

{
  networking = {
    hostName = "nixos";
    firewall.enable = false;
    networkmanager = {
      enable = true;
      package = pkgs.networkmanager;
      plugins = with pkgs; [
        networkmanager-openvpn
        networkmanager-amneziawg
      ];
    };
  };

  users.extraGroups.networkmanager.members = [ username ];

  boot = {
    kernelModules = [ "amneziawg" ];
    extraModulePackages = [ config.boot.kernelPackages.amneziawg ];
  };
}

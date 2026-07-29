{ pkgs, username, inputs, config, lib, ... }:

{
  nixpkgs.overlays = lib.mkAfter [
    inputs.networkmanager-amneziawg.overlays.default
  ];

  networking = {
    hostName = "nixos";
    firewall.enable = false;
    networkmanager = {
      enable = true;
      plugins = with pkgs; [
        networkmanager-openvpn
        networkmanager-amneziawg
      ];
    };
    # encrypted using git-crypt
    hosts = import ../../secrets/networking-hosts.nix;
  };

  users.extraGroups.networkmanager.members = [ username ];

  boot = {
    kernelModules = [ "amneziawg" ];
    extraModulePackages = [ config.boot.kernelPackages.amneziawg ];
  };
}

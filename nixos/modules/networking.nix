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
    # Encrypted using git-crypt; see ../../secrets/networking-hosts.nix
    hosts = import ../../secrets/networking-hosts.nix;
  };
}

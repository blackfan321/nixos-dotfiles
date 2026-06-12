{ pkgs, ... }:

{
  networking = {
    hostName = "nixos";
    networkmanager = {
      enable = true;
      plugins = with pkgs; [
        networkmanager-openvpn
        networkmanager-amneziawg
      ];
    };
    # Encrypted using git-crypt; see ../../secrets/networking-hosts.nix
    hosts = import ../../secrets/networking-hosts.nix;
  };

  systemd.services.NetworkManager.path = [ pkgs.amneziawg-tools ];
  systemd.services.NetworkManager.serviceConfig.Environment = [
    "NM_FORCE_AWG_QUICK=1"
  ];
}

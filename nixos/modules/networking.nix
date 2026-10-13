{ pkgs, username, self, ... }:

{
  networking = {
    hostName = "nixos";
    firewall.enable = false;
    modemmanager.enable = false;
    networkmanager = {
      enable = true;
      package = pkgs.networkmanager;
      plugins = with pkgs; [
        networkmanager-openvpn
      ];
    };
    # encrypted using git-crypt
    hosts = import "${self}/secrets/networking-hosts.nix";
  };

  users.extraGroups.networkmanager.members = [ username ];

  boot = {
    kernelModules = [
      "tcp_bbr3"
    ];
    kernel.sysctl = {
      "net.core.default_qdisc" = "fq";
      "net.ipv4.tcp_congestion_control" = "bbr3";
    };
  };
}

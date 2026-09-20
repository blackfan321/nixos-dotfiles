{ pkgs, username, config, ... }:

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
        networkmanager-amneziawg
      ];
    };
  };

  users.extraGroups.networkmanager.members = [ username ];

  boot = {
    kernelModules = [
      "amneziawg"
      "tcp_bbr3"
    ];
    extraModulePackages = [ config.boot.kernelPackages.amneziawg ];
    kernel.sysctl = {
      "net.core.default_qdisc" = "fq";
      "net.ipv4.tcp_congestion_control" = "bbr3";
    };
  };
}

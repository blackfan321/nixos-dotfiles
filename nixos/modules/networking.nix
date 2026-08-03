{ pkgs, username, config, ... }:

{
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
    # NM plugin 0.9.10 is GENL v2; new kernel module moved H1-H4 to u64 / GENL v3
    extraModulePackages = [
      (config.boot.kernelPackages.amneziawg.overrideAttrs (old: {
        version = "1.0.20260725";
        src = pkgs.fetchFromGitHub {
          owner = "amnezia-vpn";
          repo = "amneziawg-linux-kernel-module";
          tag = "v1.0.20260725";
          hash = "sha256-7tfiZa5K80fmE27rwXtfMvbjUqd3+Q1w2ItAU4YrpFw=";
        };
      }))
    ];
  };
}

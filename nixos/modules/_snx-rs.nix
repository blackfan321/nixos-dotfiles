{ pkgs, ... }:

{
  environment.systemPackages = [ pkgs.snx-rs ];

  networking.firewall.checkReversePath = "loose";

  systemd.services.snx-rs = {
    description = "SNX-RS VPN client";
    after = [ "network-online.target" ];
    wants = [ "network-online.target" ];
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.snx-rs}/bin/snx-rs -m command";
      Type = "simple";
      Restart = "on-failure";
    };
  };
}

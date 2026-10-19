{ inputs, pkgs, ... }:

{
  imports = [ inputs.proton-ge.nixosModules.default ];

  programs.steam = {
    enable = true;
    package = pkgs.steam;

    extraCompatPackages = with pkgs; [
      GE-Proton11-11
    ];

    protontricks = {
      enable = true;
      package = pkgs.protontricks;
    };
  };

  # don't forget to enable ntsync in proton as well
  # enabled by default in Proton-GE
  boot.kernelModules = [ "ntsync" ];
  boot.kernel.sysctl."vm.max_map_count" = 262144;
}

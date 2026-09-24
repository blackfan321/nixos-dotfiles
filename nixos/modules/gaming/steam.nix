{ pkgs, ... }:

{
  programs.steam = {
    enable = true;
    package = pkgs.steam;

    extraCompatPackages = with pkgs; [
      proton-ge-bin # for cool games
      # dwproton-bin # for chinese casino games
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

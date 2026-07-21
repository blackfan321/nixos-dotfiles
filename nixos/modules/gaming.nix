{ pkgs, username, ... }:

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

  # not really sure if this thing is actually useful
  programs.gamemode = {
    enable = true;
    package = pkgs.gamemode;
    enableRenice = true;
    # TODO: add settings
  };

  users.extraGroups.gamemode.members = [ username ];

  # fix gamepad disconnecting after hibernation issue
  hardware.xone.enable = true;
}

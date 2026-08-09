{ pkgs, ... }:

let
  inherit (import ./_wrappers.nix { inherit pkgs; }) hdrHook;
in
{
  programs.steam.config.apps = {
    "The Forest" = {
      id = 242760;
      compatTool = "GE-Proton";
      env.WINE_CPU_TOPOLOGY = "8:0,1,2,3,4,5,6,7";
      wrappers = [ "gamemoderun" ];
    };

    "Dragon's Dogma 2" = {
      id = 2054970;
      compatTool = "GE-Proton";
      language = "russian";
      env = {
        PROTON_FSR4_UPGRADE = "1";
        PROTON_ENABLE_WAYLAND = "1";
        PROTON_ENABLE_HDR = "1";
      };
      wrappers = [
        hdrHook
        "gamemoderun"
      ];
    };

    "Phoenix Wright: Ace Attorney Trilogy" = {
      id = 787480;
      compatTool = "GE-Proton";
      language = "english";
      env.PROTON_ENABLE_WAYLAND = "1";
      wrappers = [ "gamemoderun" ];
    };

    "PEAK" = {
      id = 3527290;
      compatTool = "GE-Proton";
      env.PROTON_ENABLE_WAYLAND = "1";
      wrappers = [ "gamemoderun" ];
    };
  };
}

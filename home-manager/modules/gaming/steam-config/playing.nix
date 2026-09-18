{ pkgs, ... }:

let
  inherit (import ./_wrappers.nix { inherit pkgs; }) hdrHook;
in
{
  programs.steam.config.apps = {
    "The Forest" = {
      id = 242760;
      compatTool = "GE-Proton11-7-x86_64";
      env.WINE_CPU_TOPOLOGY = "8:0,1,2,3,4,5,6,7";
      wrappers = [ "gamemoderun" ];
    };

    "Dragon's Dogma 2" = {
      id = 2054970;
      compatTool = "GE-Proton11-7-x86_64";
      language = "russian";
      env = {
        PROTON_FSR4_UPGRADE = "1";
        PROTON_ENABLE_WAYLAND = "1";
        PROTON_ENABLE_HDR = "1";
      };
      wrappers = [ hdrHook "gamemoderun" ];
    };

    "Phoenix Wright: Ace Attorney Trilogy" = {
      id = 787480;
      compatTool = "GE-Proton11-7-x86_64";
      language = "english";
      env.PROTON_ENABLE_WAYLAND = "1";
      wrappers = [ "gamemoderun" ];
    };

    "PEAK" = {
      id = 3527290;
      compatTool = "GE-Proton11-7-x86_64";
      env.PROTON_ENABLE_WAYLAND = "1";
      wrappers = [ "gamemoderun" ];
    };

    "Darkest Dungeon" = {
      id = 262060;
      compatTool = "GE-Proton11-7-x86_64";
      betaBranch = "coming_in_hot";
      language = "russian";
      args = [ "-skipfeflowintro" ];
    };

    "Slay the Spire 2" = {
      id = 2868840;
      compatTool = "GE-Proton11-7-x86_64";
      betaBranch = "public-beta";
      env.PROTON_ENABLE_WAYLAND = "1";
      args = [ "--rendering-driver" "vulkan" ];
      wrappers = [ "mangohud" "gamemoderun" ];
    };

    "Trails in the Sky 1st Chapter" = {
      id = 3375780;
      compatTool = "GE-Proton11-7-x86_64";
      env = {
        PROTON_ENABLE_WAYLAND = "1";
        PROTON_ENABLE_HDR = "1";
        DXVK_FRAME_RATE = "170";
        WINEDLLOVERRIDES = "xinput1_4=n,b";
      };
      wrappers = [ hdrHook "gamemoderun" ];
    };
  };
}

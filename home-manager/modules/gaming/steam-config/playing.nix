{ pkgs, ... }:

let
  defaultProton = "GE-Proton11-11";
  inherit (import ./_wrappers.nix { inherit pkgs; }) hdrHook;
in
{
  programs.steam.config.apps = {
    "The Forest" = {
      id = 242760;
      compatTool = defaultProton;
      env.WINE_CPU_TOPOLOGY = "8:0,1,2,3,4,5,6,7";
      wrappers = [ "gamemoderun" ];
    };

    "Dragon's Dogma 2" = {
      id = 2054970;
      compatTool = defaultProton;
      language = "russian";
      env = {
        PROTON_FSR4_UPGRADE = "1";
        PROTON_ENABLE_WAYLAND = "1";
      };
      wrappers = [ hdrHook "gamemoderun" ];
    };

    "PEAK" = {
      id = 3527290;
      compatTool = defaultProton;
      env.PROTON_ENABLE_WAYLAND = "1";
      wrappers = [ "gamemoderun" ];
    };

    "Darkest Dungeon" = {
      id = 262060;
      compatTool = defaultProton;
      betaBranch = "coming_in_hot";
      language = "russian";
      args = [ "-skipfeflowintro" ];
    };

    "Slay the Spire 2" = {
      id = 2868840;
      compatTool = defaultProton;
      betaBranch = "public-beta";
      env.PROTON_ENABLE_WAYLAND = "1";
      args = [ "--rendering-driver" "vulkan" ];
      wrappers = [ "mangohud" "gamemoderun" ];
    };

    "Trails in the Sky 1st Chapter" = {
      id = 3375780;
      compatTool = defaultProton;
      env = {
        PROTON_ENABLE_WAYLAND = "1";
        DXVK_FRAME_RATE = "170";
        WINEDLLOVERRIDES = "xinput1_4=n,b";
      };
      wrappers = [ hdrHook "gamemoderun" ];
    };

    "CHAOS;HEAD NOAH" = {
      id = 1961950;
      compatTool = defaultProton;
      language = "english";
      env = {
        PROTON_ENABLE_WAYLAND = "1";
        DXVK_FRAME_RATE = "60";
      };
      wrappers = [ "gamemoderun" ];
    };

    "Valheim" = {
      id = 892970;
      compatTool = defaultProton;
      env = {
        PROTON_ENABLE_WAYLAND = "1";
        DXVK_FRAME_RATE = "120";
      };
      wrappers = [ "gamemoderun" ];
    };
  };
}

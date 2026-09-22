{ ... }:

{
  programs.steam.config.apps = {
    "Mafia: Definitive Edition" = {
      id = 1030840;
      compatTool = "GE-Proton";
      language = "russian";
      env = {
        PROTON_FSR4_UPGRADE = "1";
        PROTON_ENABLE_WAYLAND = "1";
      };
      wrappers = [ "gamemoderun" ];
    };

    "Phoenix Wright: Ace Attorney Trilogy" = {
      id = 787480;
      compatTool = "GE-Proton11-7-x86_64";
      language = "english";
      env.PROTON_ENABLE_WAYLAND = "1";
      wrappers = [ "gamemoderun" ];
    };
  };
}

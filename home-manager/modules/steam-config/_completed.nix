{
  programs.steam.config.apps = {
    "Mafia: Definitive Edition" = {
      id = 1030840;
      compatTool = "GE-Proton";
      language = "russian";
      launchOptions = {
        env = {
          PROTON_FSR4_UPGRADE = "1";
          PROTON_ENABLE_WAYLAND = "1";
        };
        wrappers = [ "gamemoderun" ];
      };
    };
  };
}

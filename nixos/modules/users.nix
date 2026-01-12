{ pkgs, ... }:

{
  users = {
    defaultUserShell = pkgs.zsh;
    users = {
      blackfan321 = {
        isNormalUser = true;
        description = "Ivan";
        extraGroups = [
          "networkmanager"
          "wheel"
          "gamemode"
          "docker"
        ];
      };
    };
  };
}

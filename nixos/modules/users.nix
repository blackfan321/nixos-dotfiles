{ pkgs, ... }:

{
  users = {
    defaultUserShell = pkgs.zsh;
    users = {
      blackfan321 = {
        isNormalUser = true;
        description = "Ivan Batrakov";
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

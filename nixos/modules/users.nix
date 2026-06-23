{ pkgs, username, ... }:

{
  users = {
    defaultUserShell = pkgs.zsh;
    users.${username} = {
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
}

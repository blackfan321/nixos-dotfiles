{ pkgs, ... }:

{
  users.defaultUserShell = pkgs.zsh;
  users.users.blackfan321 = {
    isNormalUser = true;
    description = "Ivan";
    extraGroups = [
      "networkmanager"
      "wheel"
      "gamemode"
      "docker"
    ];
  };
}

{ ... }:

{
  imports = [
    ./modules
  ];

  home = {
    username = "blackfan321";
    homeDirectory = "/home/blackfan321";
    stateVersion = "26.05";
  };

  xdg.userDirs.enable = true;
  xdg.userDirs.createDirectories = true;

  programs.home-manager.enable = true;
}

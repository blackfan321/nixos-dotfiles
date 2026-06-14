{ ... }:

{
  imports = [
    ./modules
  ];

  home = {
    username = "blackfan321";
    homeDirectory = "/home/blackfan321";
    stateVersion = "26.05";
    file = {
      ".face".source = ./assets/face.png;
    };
  };

  xdg.userDirs.enable = true;
  xdg.userDirs.createDirectories = true;

  programs.home-manager.enable = true;
}

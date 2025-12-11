{ ... }:
{

  imports = [
    ./modules
  ];

  home = {
    username = "blackfan321";
    homeDirectory = "/home/blackfan321";
    stateVersion = "25.11";
  };

  programs.home-manager.enable = true;

}

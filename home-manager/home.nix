{ inputs, username, ... }:

{
  imports = [
    (inputs.import-tree ./modules)
  ];

  home = {
    inherit username;
    homeDirectory = "/home/${username}";
    file = {
      ".face".source = ../assets/face.png;
    };

    stateVersion = "26.05";
  };

  xdg.userDirs.enable = true;
  xdg.userDirs.createDirectories = true;
}

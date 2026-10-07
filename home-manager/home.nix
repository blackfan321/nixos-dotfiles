{ inputs, username, ... }:

{
  imports = [
    (inputs.import-tree ./modules)
  ];

  home = {
    inherit username;
    homeDirectory = "/home/${username}";

    stateVersion = "26.05";
  };
}

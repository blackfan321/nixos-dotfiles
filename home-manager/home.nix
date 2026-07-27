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

    # force Telegram to use GTK4 file-picker
    sessionVariables.QT_QPA_PLATFORMTHEME = "xdgdesktopportal";

    stateVersion = "26.05";
  };
}

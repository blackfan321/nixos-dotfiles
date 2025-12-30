{ config, pkgs, ... }:

{
  gtk = {
    enable = true;
    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };
    gtk3 = {
      bookmarks = [
        "file://${config.home.homeDirectory}/Documents"
        "file://${config.home.homeDirectory}/Music"
        "file:///${config.home.homeDirectory}/Pictures"
        "file://${config.home.homeDirectory}/Videos"
        "file://${config.home.homeDirectory}/Downloads"
      ];
    };
  };
}

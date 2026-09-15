{ pkgs, config, ... }:

{
  programs.onlyoffice = {
    enable = true;
    package = pkgs.onlyoffice-desktopeditors;

    settings = {
      locale = "en-US";
      UITheme = "theme-white";
      titlebar = "custom";
      editorWindowMode = false;
      savePath = "${config.home.homeDirectory}/Documents";
    };
  };
}

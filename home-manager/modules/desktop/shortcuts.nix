{ config, ... }:

{
  xdg.desktopEntries = {
    yandex-browser = {
      name = "Yandex Browser";
      exec = "appimage-run ${config.home.homeDirectory}/AppImages/yandex-browser.AppImage";
      icon = ../../../assets/appimages/yandex-browser.png;
      categories = [ "Network" ];
      startupNotify = true;
      terminal = false;
    };
  };
}

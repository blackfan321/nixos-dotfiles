{ config, ... }:

{
  xdg.desktopEntries = {
    yandex-browser = {
      name = "Yandex Browser";
      exec = "appimage-run ${config.home.homeDirectory}/AppImages/Yandex-Browser-stable-26.8.1.1111-1-x86_64.AppImage";
      icon = ../../../assets/appimages/yandex-browser.png;
      categories = [ "Network" ];
      startupNotify = true;
      terminal = false;
    };
  };
}

{ pkgs, ... }:

let
  extensions = with pkgs.gnomeExtensions; [
    appindicator
    caffeine
    tiling-assistant
    xwayland-indicator
    notification-timeout
    pip-on-top
    text-extractor
    quick-settings-audio-panel
    wireless-hid
  ];
in
{
  home.packages = extensions;

  dconf.settings = {
    "org/gnome/shell" = {
      enabled-extensions = map (e: e.extensionUuid) extensions;
    };

    "org/gnome/shell/extensions/notification-timeout" = {
      timeout = 60000;
    };

    "org/gnome/shell/extensions/text-extractor" = {
      shortcut = [ "<Super>Print" ];
      save-screenshots = false;
    };

    "org/gnome/shell/extensions/quick-settings-audio-panel" = {
      always-show-input-volume-slider = true;
    };

    "org/gnome/shell/extensions/pip-on-top" = {
      stick = true;
    };
  };
}

{ pkgs, ... }:

{
  dconf.settings = {
    "org/gnome/shell" = {
      enabled-extensions = with pkgs.gnomeExtensions; [
        appindicator.extensionUuid
        caffeine.extensionUuid
        tiling-assistant.extensionUuid
        xwayland-indicator.extensionUuid
        notification-timeout.extensionUuid
        pip-on-top.extensionUuid
        text-extractor.extensionUuid
        quick-settings-audio-panel.extensionUuid
        vicinae.extensionUuid
      ];
      disable-extension-version-validation = true;
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

    "org/gnome/shell/extensions/vicinae" = {
      show-status-indicator = false;
    };
  };
}

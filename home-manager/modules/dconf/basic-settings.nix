{ lib, ... }:

{
  dconf.settings = {
    "org/gnome/mutter" = {
      experimental-features = [
        "variable-refresh-rate"
      ];
      dynamic-workspaces = false;
    };

    "org/gnome/desktop/wm/preferences" = {
      num-workspaces = 4;
    };

    "org/gnome/desktop/interface" = {
      clock-show-seconds = true;
      icon-theme = "MoreWaita";
      font-name = "Adwaita Sans 11";
      document-font-name = "Adwaita Sans 12";
      monospace-font-name = "Adwaita Mono 11";
    };

    "org/gnome/settings-daemon/plugins/color" = {
      night-light-enabled = true;
      night-light-schedule-automatic = false;
      night-light-schedule-from = 23.0;
      night-light-schedule-to = 6.0;
      night-light-temperature = lib.gvariant.mkUint32 3112;
    };
  };
}

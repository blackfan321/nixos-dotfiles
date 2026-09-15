{ lib, ... }:

{
  dconf.settings = {
    "org/gnome/settings-daemon/plugins/color" = {
      night-light-enabled = true;
      night-light-schedule-automatic = false;
      night-light-schedule-from = 23.0;
      night-light-schedule-to = 6.0;
      night-light-temperature = lib.gvariant.mkUint32 3112;
    };
  };
}

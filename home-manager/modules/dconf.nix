{ pkgs, lib, ... }:

{
  dconf = {
    enable = true;
    settings = {
      "org/gnome/Weather" =
        let
          gv = lib.gvariant;
          belgorodLocation = gv.mkVariant (
            gv.mkTuple [
              (gv.mkUint32 2)
              (gv.mkVariant (
                gv.mkTuple [
                  "Belgorod"
                  ""
                  false
                  (gv.mkArray [
                    (gv.mkTuple [
                      0.8830565625
                      0.638568455
                    ])
                  ])
                  (gv.mkEmptyArray (
                    gv.type.tupleOf [
                      gv.type.double
                      gv.type.double
                    ]
                  ))
                ]
              ))
            ]
          );
          weatherLocations = gv.mkArray [ belgorodLocation ];
        in
        {
          locations = weatherLocations;
        };
      "org/gnome/shell" = {
        enabled-extensions = with pkgs.gnomeExtensions; [
          appindicator.extensionUuid
          caffeine.extensionUuid
          tiling-assistant.extensionUuid
          xwayland-indicator.extensionUuid
          notification-timeout.extensionUuid
        ];
      };
      "org/gnome/shell/weather" =
        let
          gv = lib.gvariant;
          belgorodLocation = gv.mkVariant (
            gv.mkTuple [
              (gv.mkUint32 2)
              (gv.mkVariant (
                gv.mkTuple [
                  "Belgorod"
                  ""
                  false
                  (gv.mkArray [
                    (gv.mkTuple [
                      0.8830565625
                      0.638568455
                    ])
                  ])
                  (gv.mkEmptyArray (
                    gv.type.tupleOf [
                      gv.type.double
                      gv.type.double
                    ]
                  ))
                ]
              ))
            ]
          );
          weatherLocations = gv.mkArray [ belgorodLocation ];
        in
        {
          automatic-location = false;
          locations = weatherLocations;
        };
      "org/gnome/shell/extensions/notification-timeout" = {
        timeout = 60000;
      };
      "org/gnome/mutter" = {
        experimental-features = [
          "variable-refresh-rate"
        ];
      };
      "org/gnome/desktop/wm/keybindings" = {
        close = [ "<Super>q" ];
        move-to-workspace-1 = [ "<Shift><Super>1" ];
        move-to-workspace-2 = [ "<Shift><Super>2" ];
        move-to-workspace-3 = [ "<Shift><Super>3" ];
        move-to-workspace-4 = [ "<Shift><Super>4" ];
        switch-to-workspace-1 = [ "<Super>1" ];
        switch-to-workspace-2 = [ "<Super>2" ];
        switch-to-workspace-3 = [ "<Super>3" ];
        switch-to-workspace-4 = [ "<Super>4" ];
      };
      "org/gnome/desktop/interface" = {
        clock-show-seconds = true;
      };
      "org/gnome/settings-daemon/plugins/media-keys" = {
        custom-keybindings = [
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/"
        ];
      };
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
        name = "Open Terminal";
        command = "ptyxis";
        binding = "<Control><Alt>t";
      };
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
        name = "Open Nautilus";
        command = "nautilus";
        binding = "<Super>e";
      };
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2" = {
        name = "Open Firefox";
        command = "firefox";
        binding = "<Super>w";
      };
    };
  };
}

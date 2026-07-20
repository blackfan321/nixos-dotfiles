{ ... }:

{
  den.aspects.gnome = { ... }: {
    nixos = { pkgs, ... }: {
      services = {
        displayManager.gdm.enable = true;
        desktopManager.gnome.enable = true;
        gnome = {
          core-apps.enable = true;
          core-developer-tools.enable = false;
          games.enable = false;
        };
      };

      environment = {
        gnome.excludePackages = with pkgs; [
          epiphany
          decibels
          gnome-connections
          gnome-console
          gnome-maps
          gnome-text-editor
          gnome-contacts
          gnome-user-docs
          gnome-music
          showtime
          snapshot
          yelp
        ];
        systemPackages = [ pkgs.nautilus-python ];
      };

      programs.nautilus-open-any-terminal = {
        enable = true;
        terminal = "ptyxis";
      };
    };

    homeManager =
      {
        pkgs,
        inputs,
        lib,
        ...
      }:
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
        home = {
          packages =
            with pkgs;
            [
              morewaita-icon-theme
              gnomeExtensions.appindicator
              gnomeExtensions.caffeine
              gnomeExtensions.tiling-assistant
              gnomeExtensions.xwayland-indicator
              gnomeExtensions.notification-timeout
              gnomeExtensions.pip-on-top
              gnomeExtensions.text-extractor
              gnomeExtensions.quick-settings-audio-panel
              gnomeExtensions.vicinae
            ]
            ++ [
              inputs.text-extractor-ocr.packages.${pkgs.system}.text-extractor-ocr
            ];
        };
        dconf = {
          enable = true;
          settings = {
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

            "org/gnome/settings-daemon/plugins/media-keys".custom-keybindings = [
              "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
              "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
              "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/"
              "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/"
              "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/"
            ];

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
              name = "Open Zen Browser";
              command = "zen-beta";
              binding = "<Super>w";
            };

            "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3" = {
              name = "Toggle Vicinae";
              command = "vicinae toggle";
              binding = "<Super>Return";
            };

            "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4" = {
              name = "Vicinae Clipboard";
              command = "vicinae deeplink 'vicinae://launch/clipboard/history?toggle=true'";
              binding = "<Super>backslash";
            };

            "org/gnome/Weather".locations = weatherLocations;

            "org/gnome/shell/weather" = {
              automatic-location = false;
              locations = weatherLocations;
            };
          };
        };
      };
  };
}

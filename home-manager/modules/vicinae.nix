{ inputs, pkgs, ... }:

let
  zed-recents =
    inputs.vicinae-extensions.packages.${pkgs.system}.zed-recents.overrideAttrs (_: {
      npmFlags = [ "--legacy-peer-deps" ];
    });
in
{
  imports = [
    inputs.vicinae.homeManagerModules.default
  ];

  programs.vicinae = {
    enable = true;

    package = inputs.vicinae.packages.${pkgs.system}.default;

    systemd = {
      enable = true;
      autoStart = true;
      target = "gnome-session-initialized.target";
    };

    extensions = [
      zed-recents
      inputs.vicinae-extensions.packages.${pkgs.system}.clean-keyboard
    ];

    settings = {
      close_on_focus_loss = true;
      pop_to_root_on_close = true;

      telemetry = {
        system_info = true;
      };

      font = {
        normal = {
          size = 12;
          family = "JetBrainsMono Nerd Font";
        };
      };

      theme = {
        light = {
          name = "libadwaita-light";
          icon_theme = "MoreWaita";
        };
        dark = {
          name = "libadwaita-dark";
          icon_theme = "MoreWaita";
        };
      };

      launcher_window = {
        opacity = 0.98;
      };

      providers = {
        core = {
          entrypoints = {
            sponsor = {
              enabled = false;
            };
          };
        };
      };
    };
  };
}

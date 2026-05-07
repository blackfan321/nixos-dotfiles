{ ... }:

{
  programs.fastfetch = {
    enable = true;

    settings = {
      "$schema" =
        "https://github.com/fastfetch-cli/fastfetch/raw/master/doc/json_schema.json";

      logo = {
        padding = {
          top = 0;
          right = 4;
        };
      };

      display = {
        separator = " → ";
        color = {
          keys = "blue";
          separator = "cyan";
          output = "white";
        };
      };

      modules = [

        # no title / no top gaps

        {
          type = "custom";
          format = "┌──────────────────── Hardware ──────────────────────┐";
          outputColor = "blue";
        }

        {
          type = "cpu";
          key = "  ";
          format = "{name} ({cores-logical}) @ {freq-max}";
        }

        {
          type = "gpu";
          key = "  󰢮";
          hideType = "integrated";
          format = "{name}";
        }

        {
          type = "memory";
          key = "  󰑭";
          format = "{used} / {total} ({percentage})";
        }

        {
          type = "disk";
          key = "  󰋊";
          folders = "/";
          format = "{size-used} / {size-total} ({size-percentage}) - {filesystem}";
        }

        {
          type = "custom";
          key = "  󰍺";
          format = "TCL 34R83Q (34″ UltraWide)";
        }

        {
          type = "display";
          key = "  󰍹";
          format = "{width}x{height} @ {refresh-rate}Hz";
        }

        {
          type = "custom";
          format = "└────────────────────────────────────────────────────┘";
          outputColor = "blue";
        }

        {
          type = "custom";
          format = "┌──────────────────── Software ──────────────────────┐";
          outputColor = "blue";
        }

        {
          type = "os";
          key = "  󱄅";
          format = "NixOS Unstable";
        }

        {
          type = "kernel";
          key = "  ";
          format = "{release}";
        }

        {
          type = "de";
          key = "  󰧨";
          format = "{pretty-name} {version}";
        }

        {
          type = "shell";
          key = "  󰆍";
          format = "Ptyxis ({exe-name} {version})";
        }

        {
          type = "packages";
          key = "  󰏖";
          format = "{nix-system} (nixos), {nix-user} (home-manager)";
        }

        {
          type = "uptime";
          key = "  󰔛";
        }

        {
          type = "custom";
          format = "└────────────────────────────────────────────────────┘";
          outputColor = "blue";
        }

        {
          type = "colors";
          symbol = "circle";
          keyColor = "blue";
        }
      ];
    };
  };
}

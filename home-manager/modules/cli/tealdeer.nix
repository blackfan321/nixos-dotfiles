{ pkgs, ... }:

let
  color = r: g: b: {
    rgb = {
      inherit r g b;
    };
  };

  fg = color 222 221 218; # #DEDDDA
  fgBright = color 255 255 255; # #FFFFFF
  secondary = color 192 191 188; # #C0BFBC
  blue = color 53 132 228; # #3584E4
  green = color 38 162 105; # #26A269
in
{
  programs.tealdeer = {
    enable = true;
    package = pkgs.tealdeer;

    settings = {
      style = {
        description = {
          foreground = fgBright;
        };
        command_name = {
          foreground = blue;
          bold = true;
        };
        example_text = {
          foreground = secondary;
        };
        example_code = {
          foreground = fg;
        };
        example_variable = {
          foreground = green;
          underline = true;
        };
      };

      updates = {
        auto_update = true;
        auto_update_interval_hours = 72;
      };
    };
  };
}

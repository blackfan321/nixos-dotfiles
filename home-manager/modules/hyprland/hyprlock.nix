{
  programs.hyprlock = {
    enable = true;

    settings = {
      "$monitor" = "DP-2";
      "$avatar" = "$HOME/Pictures/Avatar.png";
      "$font" = "Rubik";

      general = {
        hide_cursor = true;
      };

      animations = {
        enabled = true;

        bezier = "linear, 1, 1, 0, 0";
        animation = [
          "fadeIn, 1, 5, linear"
          "fadeOut, 1, 5, linear"
          "inputFieldDots, 1, 1.5, linear"
        ];
      };

      background = {
          monitor = "$monitor";
          path = "$HOME/Pictures/Backgrounds/Tahoe-Dark.png";
      };

      label = [
        ### Date ###
        {
          text = "cmd[update:60000] date +\"%A, %B %d\"";
          font_size = 24;
          font_family = "$font";
          color = "rgba(246, 246, 246, 1)";

          position = "0, -128";
          halign = "center";
          valign = "top";
        }

        ### Time ###
        {
          text = "$TIME";
          font_size = 96;
          font_family = "$font SemiBold";
          color = "rgba(246, 246, 246, 1)";

          position = "0, -160";
          halign = "center";
          valign = "top";
        }

        ### User ###
        {
          text = "$USER";
          font_size = 18;
          font_family = "$font";
          color = "rgba(255, 255, 255, 1)";

          position = "0, 240";
          halign = "center";
          valign = "bottom";
        }

        ### Layout ###
        {
          text = "$LAYOUT[EN,RU]";
          font_size = 10;
          font_family = "$font";
          onclick = "hyprctl switchxkblayout all next";
          color = "rgba(246, 246, 246, 1)";

          position = "0, 164";
          halign = "center";
          valign = "bottom";
        }
      ];

      ### Avatar ###
      image = {
          path = "$avatar";
          size = 64;
          rounding = -1;
          border_size = 0;

          position = "0, 276";
          halign = "center";
          valign = "bottom";
      };

      input-field = {
          size = "160, 32";
          outline_thickness = 0;
          inner_color = "rgba(0, 0, 0, 0.25)";
          outer_color = "rgba(0, 0, 0, 0)";

          check_color = "rgba(255, 255, 255, 0.5)";
          fail_color = "rgba(255, 56, 60, 1)";
          capslock_color = "rgba(255, 0, 0, 0.5)";

          fade_on_empty = false;
          rounding = -1;

          font_family = "$font";
          font_color = "rgba(255, 255, 255, 1)";
          swap_font_color = "rgba(0, 0, 0, 1)";

          placeholder_text = "Enter Password";
          fail_text = "$PAMFAIL";

          dots_size = 0.25;
          dots_spacing = 0.5;

          position = "0, 192";
          halign = "center";
          valign = "bottom";
      };

      shape = {
          size = "38, 24";
          color = "rgba(0, 0, 0, 0.25)";
          rounding = 8;

          position = "0, 160";
          halign = "center";
          valign = "bottom";
      };
    };
  };
}

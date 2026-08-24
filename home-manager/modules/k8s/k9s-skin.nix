{ ... }:

let
  # same Adwaita-ish palette as fzf
  fg = "#DEDDDA";
  fgBright = "#FFFFFF";
  muted = "#9A9996";
  header = "#77767B";
  blue = "#3584E4";
  blueHi = "#62A0EA";
  red = "#C01C28";
  green = "#26A269";
  purple = "#9141AC";
  orange = "#E66100";
in
{
  programs.k9s = {
    settings.k9s.ui.skin = "adwaita";
    skins.adwaita.k9s = {
      body = {
        fgColor = fg;
        bgColor = "default";
        logoColor = blue;
      };
      prompt = {
        fgColor = fg;
        bgColor = "default";
        suggestColor = blueHi;
      };
      info = {
        fgColor = blue;
        sectionColor = muted;
      };
      dialog = {
        fgColor = fg;
        bgColor = "default";
        buttonFgColor = fgBright;
        buttonBgColor = blue;
        buttonFocusFgColor = fgBright;
        buttonFocusBgColor = purple;
        labelFgColor = orange;
        fieldFgColor = fg;
      };
      frame = {
        border = {
          fgColor = header;
          focusColor = blue;
        };
        menu = {
          fgColor = fg;
          keyColor = blue;
          numKeyColor = red;
        };
        crumbs = {
          fgColor = fgBright;
          bgColor = header;
          activeColor = blue;
        };
        status = {
          newColor = blueHi;
          modifyColor = purple;
          addColor = green;
          errorColor = red;
          highlightColor = orange;
          killColor = muted;
          completedColor = muted;
        };
        title = {
          fgColor = fg;
          bgColor = "default";
          highlightColor = blue;
          counterColor = purple;
          filterColor = green;
        };
      };
      views = {
        charts = {
          bgColor = "default";
          defaultDialColors = [
            blue
            red
          ];
          defaultChartColors = [
            blue
            red
          ];
        };
        table = {
          fgColor = fg;
          bgColor = "default";
          header = {
            fgColor = muted;
            bgColor = "default";
            sorterColor = blue;
          };
        };
        xray = {
          fgColor = fg;
          bgColor = "default";
          cursorColor = blue;
          graphicColor = purple;
        };
        yaml = {
          keyColor = blue;
          colonColor = muted;
          valueColor = fg;
        };
        logs = {
          fgColor = fg;
          bgColor = "default";
          indicator = {
            fgColor = fg;
            bgColor = "default";
            toggleOnColor = green;
            toggleOffColor = muted;
          };
        };
      };
    };
  };
}

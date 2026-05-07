{ ... }:
{
  programs.fastfetch = {
    enable = true;
    settings = {
      "$schema" = "https://github.com/fastfetch-cli/fastfetch/raw/master/doc/json_schema.json";
      modules = [
        "title"
        "separator"
        "os"
        {
          type = "kernel";
          format = "{release}";
        }
        "uptime"
        "packages"
        "shell"
        {
          type = "display";
          format = "{width}x{height} @ {refresh-rate}Hz ({inch}\")";
        }
        {
          type = "de";
          format = "{pretty-name} {version}";
        }
        {
          type = "terminal";
          key = "Terminal";
          format = "Ptyxis";
        }
        "terminalfont"
        "cpu"
        {
          type = "gpu";
          hideType = "integrated";
          format = "{name}";
        }
        "memory"
        "disk"
        "break"
        "colors"
      ];
    };
  };
}

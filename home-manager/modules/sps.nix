{ inputs, system, pkgs, ... }:

let
  steamPlatformStatsConfig = {
    fzf.default_platform = "linux";

    game_override = {
      "4294490" = {
        custom_name = "KOTAMON";
      };
    };
  };
in
{
  home.packages = [
    inputs.steam-platform-stats.packages.${system}.steam-platform-stats
  ];

  xdg.configFile."steam-platform-stats/config.toml".source =
    (pkgs.formats.toml { }).generate "config.toml" steamPlatformStatsConfig;
}

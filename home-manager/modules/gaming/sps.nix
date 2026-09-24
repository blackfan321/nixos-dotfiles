{ inputs, system, pkgs, ... }:

let
  steamPlatformStatsConfig = {
    fzf.default_platform = "linux";

    game_override = {
      "4294490" = {
        custom_name = "KOTAMON";
      };
      "22490" = {
        custom_name = "Fallout: New Vegas";
      };
      "31280" = {
        custom_name = "Poken Night at the Inventory";
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

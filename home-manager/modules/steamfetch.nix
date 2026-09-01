{ inputs, system, pkgs, ... }:

let
  steamfetch = inputs.steamfetch.packages.${system}.default.overrideAttrs (_: {
    doCheck = false;
  });

  secrets = import ../../secrets/steamfetch.nix;

  steamfetchConfig = {
    api = {
      steam_api_key = secrets.steam_api_key;
      steam_id = secrets.steam_id;
    };

    display = {
      show_top_games = 5;
      show_recently_played = true;
      show_achievements = true;
      show_rarest = false;
    };
  };
in
{
  home.packages = [
    steamfetch
  ];

  xdg.configFile."steamfetch/config.toml".source =
    (pkgs.formats.toml { }).generate "config.toml" steamfetchConfig;
}

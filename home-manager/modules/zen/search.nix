{ pkgs, username, ... }:

{
  programs.zen-browser.profiles.${username}.search = {
    force = true;
    engines = {
      "Nix Packages" = {
        definedAliases = [ "@np" ];
        urls = [
          {
            template = "https://search.nixos.org/packages";
            params = [
              {
                name = "channel";
                value = "unstable";
              }
              {
                name = "query";
                value = "{searchTerms}";
              }
            ];
          }
        ];
        icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
      };

      "Nix Options" = {
        definedAliases = [ "@no" ];
        urls = [
          {
            template = "https://search.nixos.org/options";
            params = [
              {
                name = "channel";
                value = "unstable";
              }
              {
                name = "query";
                value = "{searchTerms}";
              }
            ];
          }
        ];
        icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
      };

      "Home Manager Options" = {
        definedAliases = [ "@hmo" ];
        urls = [
          {
            template = "https://home-manager-options.extranix.com/";
            params = [
              {
                name = "query";
                value = "{searchTerms}";
              }
              {
                name = "release";
                value = "master";
              }
            ];
          }
        ];
        icon = "https://home-manager-options.extranix.com/images/favicon.png";
      };

      "MyAnimeList" = {
        definedAliases = [ "@mal" ];
        urls = [
          {
            template = "https://myanimelist.net/search/all";
            params = [
              {
                name = "q";
                value = "{searchTerms}";
              }
            ];
          }
        ];
        icon = "https://cdn.myanimelist.net/images/favicon.svg";
      };

      "GitHub" = {
        definedAliases = [ "@gh" ];
        urls = [
          {
            template = "https://github.com/search";
            params = [
              {
                name = "q";
                value = "{searchTerms}";
              }
              {
                name = "type";
                value = "repositories";
              }
            ];
          }
        ];
        icon = "https://github.githubassets.com/favicons/favicon.svg";
      };

      "ProtonDB" = {
        definedAliases = [ "@pdb" ];
        urls = [
          {
            template = "https://www.protondb.com/search";
            params = [
              {
                name = "q";
                value = "{searchTerms}";
              }
            ];
          }
        ];
        icon = "https://www.protondb.com/favicon.ico";
      };

      "SteamDB" = {
        definedAliases = [ "@sdb" ];
        urls = [
          {
            template = "https://steamdb.info/search/";
            params = [
              {
                name = "a";
                value = "all";
              }
              {
                name = "q";
                value = "{searchTerms}";
              }
            ];
          }
        ];
        icon = "https://steamdb.info/favicon.ico";
      };

      RuTracker = {
        definedAliases = [ "@rt" ];
        urls = [
          {
            template = "https://rutracker.org/forum/tracker.php";
            params = [
              {
                name = "nm";
                value = "{searchTerms}";
              }
            ];
          }
        ];
        icon = "https://rutracker.org/favicon.ico";
      };

      youtube-custom = {
        name = "YouTube";
        definedAliases = [ "@yt" ];
        urls = [
          {
            template = "https://www.youtube.com/results";
            params = [
              {
                name = "search_query";
                value = "{searchTerms}";
              }
            ];
          }
        ];
        icon = "https://www.youtube.com/favicon.ico";
      };

      youtube.metaData.hidden = true;
      bing.metaData.hidden = true;
      ddg.metaData.hidden = true;
    };
  };
}

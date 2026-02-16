{ pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    policies = {
      DisableFirefoxAccounts = true;
      DisableFirefoxScreenshots = true;
      DisableFirefoxStudies = true;
      AutofillAddressEnabled = false;
      AutofillCreditCardEnabled = false;
      DontCheckDefaultBrowser = true;
      SkipTermsOfUse = true;
      OfferToSaveLogins = false;

      Preferences = {
        "browser.newtabpage.activity-stream.showSponsored" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "widget.use-xdg-desktop-portal.file-picker" = 1;
      };
      ExtensionSettings = {
        # uBlock Origin
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
        };

        # KeePassXC-Browser
        "keepassxc-browser@keepassxc.org" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/keepassxc-browser/latest.xpi";
          installation_mode = "force_installed";
        };

        # SponsorBlock
        "sponsorBlocker@ajay.app" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/sponsorblock/latest.xpi";
          installation_mode = "force_installed";
        };

        # Return YouTube Dislike
        "{762f9885-5a13-4abd-9c77-433dcd38b8fd}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/return-youtube-dislikes/latest.xpi";
          installation_mode = "force_installed";
        };

        # Microslop
        "microslop@4o4" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/microslop/latest.xpi";
          installation_mode = "force_installed";
        };

        # Consent-O-Matic
        "gdpr@cavi.au.dk" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/consent-o-matic/latest.xpi";
          installation_mode = "force_installed";
        };

        # ClearURLs
        "{74145f27-f039-47ce-a470-a662b129930a}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/clearurls/latest.xpi";
          installation_mode = "force_installed";
        };
      };

      "3rdparty" = {
        Extensions = {
          "uBlock0@raymondhill.net" = {
            adminSettings = {
              selectedFilterLists = [
                "ublock-filters"
                "ublock-badware"
                "ublock-privacy"
                "ublock-quick-fixes"
                "ublock-unbreak"
                "easylist"
                "easyprivacy"
                "urlhaus-1"
                "plowe-0"
                "RUS-0"
                "RUS-1"
              ];
            };
          };
        };
      };
    };

    profiles = {
      "blackfan321" = {
        id = 0;
        isDefault = true;

        search.engines = {
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
          ebay.metaData.hidden = true;
          ecosia.metaData.hidden = true;
          ddg.metaData.hidden = true;

        };
        search.force = true;
      };
    };
  };
}

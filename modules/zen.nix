{ ... }:

{
  den.aspects.zen = { user, ... }: {
    homeManager =
      {
        pkgs,
        inputs,
        ...
      }:
      {
        imports = [
          inputs.zen-browser.homeModules.beta
        ];

        programs.zen-browser = {
          enable = true;
          setAsDefaultBrowser = true;

          policies = {
            AutofillAddressEnabled = false;
            AutofillCreditCardEnabled = false;
            DisableAppUpdate = true;
            DisableFirefoxStudies = true;
            DisablePocket = true;
            DontCheckDefaultBrowser = true;
            NoDefaultBookmarks = true;
            OfferToSaveLogins = false;
            EnableTrackingProtection = {
              Value = true;
              Locked = true;
              Cryptomining = true;
              Fingerprinting = true;
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

          profiles.${user.userName} = {
            id = 0;
            isDefault = true;

            settings = {
              zen.view.experimental-no-window-controls = true;
              zen.theme.content-element-separation = 3;
              zen.workspaces.continue-where-left-off = true;
              browser.toolbars.bookmarks.visibility = "never";
            };

            mods = [
              "c01d3e22-1cee-45c1-a25e-53c0f180eea8" # Ghost Tabs
              "664c54f9-d97d-410b-a479-23dd8a08a628" # Better Tab Indicators
            ];

            spacesForce = true;

            spaces = {
              Home = {
                id = "6de57c7b-858d-4195-8d4a-895115ea4704";
                position = 1000;
                icon = "🏠️";
              };

              Work = {
                id = "58a2eed3-6e7f-433a-a53f-98e1382a02d8";
                position = 2000;
                icon = "💻️";
                container = 2;
                theme = {
                  colors = [
                    {
                      red = 240;
                      green = 168;
                      blue = 196;
                      algorithm = "floating";
                      type = "explicit-lightness";
                      lightness = 80;
                    }
                  ];
                  opacity = 0.5;
                };
              };

              Ayakashigami = {
                id = "43dcb930-33f7-4047-9a6d-455865202320";
                position = 3000;
                icon = "📔";
                container = 1;
                theme = {
                  colors = [
                    {
                      red = 107;
                      green = 125;
                      blue = 173;
                      algorithm = "analogous";
                      type = "explicit-lightness";
                      lightness = 55;
                    }
                    {
                      red = 144;
                      green = 107;
                      blue = 174;
                      algorithm = "analogous";
                      type = "explicit-lightness";
                      lightness = 55;
                    }
                    {
                      red = 107;
                      green = 174;
                      blue = 168;
                      algorithm = "analogous";
                      type = "explicit-lightness";
                      lightness = 55;
                    }
                  ];
                  opacity = 0.475;
                };
              };
            };

            search = {
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
          };
        };
      };
  };
}

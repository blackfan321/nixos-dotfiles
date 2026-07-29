{ ... }:

{
  programs.zen-browser.policies = {
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
}

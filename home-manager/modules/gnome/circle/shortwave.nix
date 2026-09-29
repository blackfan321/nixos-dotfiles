{ config, ... }:

{
  dconf.settings."de/haeckerfelix/Shortwave" = {
    # API
    api-lookup-domain = "all.api.radio-browser.info";

    # Library
    library-sorting = "name";
    library-sorting-type = "ascending";

    # Playback
    background-playback = true;
    notifications = true;
    playback-past-tracks-count = 10;

    # Recording
    recording-mode = "decide";
    recording-minimum-duration = 30;
    recording-maximum-duration = 900;
    recording-track-directory = "${config.home.homeDirectory}/Music/Radio";
  };
}

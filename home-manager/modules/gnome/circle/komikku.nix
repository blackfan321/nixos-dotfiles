{ ... }:

{
  dconf.settings."info/febvre/Komikku" = {
    # General
    color-scheme = "light";
    night-light = false;
    system-accent-colors = true;
    progressbar-theme = "accent-color";
    card-backdrop-method = "unset";
    desktop-notifications = true;
    tracking = true;  # MAL
    downloader-state = true;

    # Library
    library-display-mode = "grid";
    library-sort-order = "latest-read-desc";
    library-servers-logo = true;
    library-badges = [ "unread-chapters" ];
    update-at-startup = true;
    new-chapters-auto-download = true;
    servers-languages = [ "ru" ];
    long-strip-detection = true;
    nsfw-content = true;
    nsfw-only-content = false;

    # Reader
    background-color = "system-style";
    borders-crop = true;
    borders-crop-threshold = 220;
    clamp-size = 960;
    fullscreen = false;
    landscape-zoom = false;
    page-numbering = true;
    reading-mode = "vertical";
    scaling = "screen";
    scaling-filter = "trilinear";
    scroll-click-percentage = 0.65;
    scroll-drag-factor = 2.0;

    # Advanced
    clear-cached-data-on-app-close = true;
    external-servers-modules = false;
    servers-bug-report = true;
    credentials-storage-plaintext-fallback = false;
    disable-animations = false;
  };
}

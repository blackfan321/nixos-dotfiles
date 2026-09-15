{ username, ... }:

{
  programs.zen-browser.profiles.${username}.mods = [
    "c01d3e22-1cee-45c1-a25e-53c0f180eea8" # Ghost Tabs
    "664c54f9-d97d-410b-a479-23dd8a08a628" # Better Tab Indicators
  ];
}

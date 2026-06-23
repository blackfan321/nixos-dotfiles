{ username, ... }:

{
  programs.zen-browser.profiles.${username} = {
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
  };
}

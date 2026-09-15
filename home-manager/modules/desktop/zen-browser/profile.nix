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

    spacesForce = true;
  };
}

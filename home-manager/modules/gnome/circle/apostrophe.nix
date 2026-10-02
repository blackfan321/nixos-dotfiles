{ ... }:

{
  dconf.settings."org/gnome/gitlab/somas/Apostrophe" = {
    # Editor
    input-format = "gfm"; # GitHub Flavored Markdown
    spellcheck = true;
    sync-scroll = true;
    characters-per-line = 66;
    bigger-text = false;
    hemingway-mode = false; # true = r/o mode
    autosave-period = 5;

    # UI
    color-scheme = "system";
    autohide-headerbar = true;
    toolbar-active = false;
    stat-default = "words";

    # Preview
    preview-active = false;
    preview-mode = "half-width";
    preview-security = "ask";
  };
}

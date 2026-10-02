{ ... }:

{
  xdg.mimeApps = {
    enable = true;

    defaultApplications = {
      "text/plain" = "dev.zed.Zed.desktop";
      "application/json" = "dev.zed.Zed.desktop";

      "text/markdown" = "org.gnome.gitlab.somas.Apostrophe.desktop";
      "text/x-markdown" = "org.gnome.gitlab.somas.Apostrophe.desktop";
    };
  };
}

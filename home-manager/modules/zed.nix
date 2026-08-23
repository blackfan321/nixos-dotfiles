{ pkgs, ... }:

{
  programs.zed-editor = {
    enable = true;
    package = pkgs.zed-editor-fhs;

    extraPackages = with pkgs; [
      nixd
      just-lsp
      helm-ls
      nixfmt
    ];

    extensions = [
      "nix"
      "toml"
      "csv"
      "just"
      "helm"
    ];

    userSettings = {
      cli_default_open_behavior = "new_window";
      restore_on_startup = "empty_tab";

      tab_size = 2;
      format_on_save = "off";

      ui_font_size = 16;
      buffer_font_size = 15;
      icon_theme = "Zed (Default)";

      file_scan_exclusions = [
        "**/.git"
        "**/.svn"
        "**/.hg"
        "**/.jj"
        "**/CVS"
        "**/.DS_Store"
        "**/Thumbs.db"
        "**/.classpath"
        "**/.settings"
        "**/nix/store/**"
        "**/result"
        "**/result-*"
      ];

      theme = {
        mode = "dark";
        light = "Adwaita Light";
        dark = "One Dark";
      };

      edit_predictions = {
        mode = "subtle";
      };

      terminal = {
        shell = "system";
      };

      project_panel = {
        dock = "left";
      };

      outline_panel = {
        button = false;
        dock = "left";
      };

      collaboration_panel = {
        button = false;
        dock = "left";
      };

      git_panel = {
        dock = "left";
      };

      agent = {
        dock = "right";
      };

      agent_servers = {
        cursor = {
          type = "registry";
        };
        codex-acp = {
          type = "registry";
        };
      };
    };
  };
}

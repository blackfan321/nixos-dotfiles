{ config, ... }:

{
  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;

      # don't create useless directories
      desktop = null;
      publicShare = null;
      templates = null;
    };

    configFile."npm/npmrc".text = ''
      prefix=${config.xdg.dataHome}/npm
      cache=${config.xdg.cacheHome}/npm
      init-module=${config.xdg.configHome}/npm/config/npm-init.js
      logs-dir=${config.xdg.stateHome}/npm/logs
    '';

    dataFile."fzf-marks".text = ''
      nixos-dotfiles : ${config.home.homeDirectory}/Projects/Personal/nixos-dotfiles
    '';
  };

  # keep $HOME clean: force XDG Base Directory paths for some stubborn apps
  home.sessionVariables = {
    KUBECONFIG = "${config.xdg.configHome}/kube/config";
    KUBECACHEDIR = "${config.xdg.cacheHome}/kube";

    RENPY_PATH_TO_SAVES = "${config.xdg.dataHome}/renpy";
    RENPY_MULTIPERSISTENT = "${config.xdg.dataHome}/renpy_shared";

    CARGO_HOME = "${config.xdg.dataHome}/cargo";

    NPM_CONFIG_USERCONFIG = "${config.xdg.configHome}/npm/npmrc";
  };
}

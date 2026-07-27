{ config, ... }:

{
  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };

  # keep $HOME clean: force XDG Base Directory paths for some stubborn apps
  home.sessionVariables = {
    KUBECONFIG = "${config.xdg.configHome}/kube/config";
    KUBECACHEDIR = "${config.xdg.cacheHome}/kube";

    RENPY_PATH_TO_SAVES = "${config.xdg.dataHome}/renpy";
    RENPY_MULTIPERSISTENT = "${config.xdg.dataHome}/renpy_shared";

    DOCKER_CONFIG = "${config.xdg.configHome}/docker";

    CARGO_HOME = "${config.xdg.dataHome}/cargo";
  };
}

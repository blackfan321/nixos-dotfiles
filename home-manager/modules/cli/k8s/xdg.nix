{ config, ... }:

{
  # tell kubectl to follow XDG Base Directory
  home.sessionVariables = {
    KUBECONFIG = "${config.xdg.configHome}/kube/config";
    KUBECACHEDIR = "${config.xdg.cacheHome}/kube";
  };
}

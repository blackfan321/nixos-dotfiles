{ pkgs, ... }:

{
  programs.kubecolor = {
    enable = true;
    package = pkgs.kubecolor;
    enableZshIntegration = true;
    enableAlias = true;
  };
}

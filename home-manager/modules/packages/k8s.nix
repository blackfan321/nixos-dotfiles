{ pkgs, ... }:

{
  home.packages = with pkgs; [
    kubectl
    kubelogin-oidc
    kubectx
    kubeconform
    kubernetes-helm
  ];
}

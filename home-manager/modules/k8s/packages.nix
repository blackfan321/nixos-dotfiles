{ pkgs, ... }:

{
  home.packages = with pkgs; [
    kubectl
    kubelogin-oidc
    kubectx  # kubens, kubectx
    kubeconform
    kubernetes-helm
    freelens-bin
  ];
}

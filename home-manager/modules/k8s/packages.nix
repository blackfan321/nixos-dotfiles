{ pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    kubectl
    kubelogin-oidc
    kubectx  # kubens, kubectx
    kubeconform
    kubernetes-helm
    freelens-bin
  ]
  ++
  [
    inputs.sofka.packages.${system}.sofka
  ];
}

{ ... }:

{
  den.aspects.k8s = { ... }: {
    homeManager = { pkgs, ... }: {
      home.packages = with pkgs; [
        kubectl
        kubelogin-oidc
        kubectx
        kubeconform
        kubernetes-helm
      ];

      programs.kubecolor = {
        enable = true;
        package = pkgs.kubecolor;
        enableZshIntegration = true;
        enableAlias = true;
      };
    };
  };
}

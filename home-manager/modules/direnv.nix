{ pkgs, ... }:

{
  programs.direnv = {
    enable = true;
    package = pkgs.direnv;
    enableZshIntegration = true;
    silent = true;
    nix-direnv = {
      enable = true;
      package = pkgs.nix-direnv;
    };
  };
}

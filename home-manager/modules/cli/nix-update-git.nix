{ inputs, system, ... }:

{
  home.packages = [
    inputs.nix-update-git.packages.${system}.nix-update-git
  ];
}

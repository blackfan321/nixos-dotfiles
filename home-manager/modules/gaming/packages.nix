{ pkgs, ... }:

{
  home.packages = with pkgs; [
    vintagestory
    protonplus
    # inputs.horizon-launcher.packages.${system}.default
  ];
}

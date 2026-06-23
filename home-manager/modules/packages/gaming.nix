{ pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    prismlauncher
    sgdboop
    protonplus
  ]
  ++
  [
    inputs.hytale-launcher.packages.${pkgs.system}.hytale-launcher
  ];
}

{ pkgs, inputs, system, ... }:

{
  home.packages = with pkgs; [
    prismlauncher
    sgdboop
    protonplus
  ]
  ++
  [
    inputs.hytale-launcher.packages.${system}.hytale-launcher
  ];
}

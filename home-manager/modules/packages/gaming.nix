{ pkgs, inputs, system, ... }:

{
  home.packages = with pkgs; [
    prismlauncher
    vintagestory
    protonplus
  ]
  ++
  [
    inputs.hytale-launcher.packages.${system}.hytale-launcher
  ];
}

{ pkgs, inputs, system, ... }:

{
  home.packages = with pkgs; [
    vintagestory
    protonplus
  ]
  ++
  [
    inputs.hytale-launcher.packages.${system}.hytale-launcher
  ];
}

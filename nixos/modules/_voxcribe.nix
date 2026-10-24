{ inputs, system, ... }:

{
  imports = [
    inputs.voxcribe.nixosModules.default
  ];

  programs.voxcribe = {
    enable = true;
    package = inputs.voxcribe.packages.${system}.default;
  };
}

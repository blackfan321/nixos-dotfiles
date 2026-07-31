{ inputs, ... }:

{
  imports = [
    inputs.nix-gen.nixosModules.default
  ];

  programs.nix-gen = {
    enable = true;
  };
}

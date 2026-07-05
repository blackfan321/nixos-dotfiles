{ inputs, ... }:

{
  imports = [
    (inputs.import-tree ./modules)
    inputs.vicinae.nixosModules.default
  ];

  system.stateVersion = "25.11";
}

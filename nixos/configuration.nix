{ inputs, ... }:

{
  imports = [
    (inputs.import-tree ./modules)
  ];

  system.stateVersion = "25.11";
}

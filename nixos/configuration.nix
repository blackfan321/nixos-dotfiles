{ inputs, ... }:

{
  imports = [
    (inputs.import-tree ./modules)
    inputs.vicinae.nixosModules.default
  ];

  time.timeZone = "Europe/Moscow";
  system.stateVersion = "25.11";
}

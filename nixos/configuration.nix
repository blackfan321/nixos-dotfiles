{ inputs, ... }:

{
  imports = [
    (inputs.import-tree ./modules)
  ];

  time.timeZone = "Europe/Moscow";
  system.stateVersion = "26.05";
}

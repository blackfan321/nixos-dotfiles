{ inputs, ... }:

{
  imports = [
    (inputs.import-tree ./modules)
    inputs.vicinae.nixosModules.default # TODO: move this
    inputs.nix-gen.nixosModules.default # TODO: move this
  ];

  programs.nix-gen.enable = true; # TODO: move this

  time.timeZone = "Europe/Moscow";
  system.stateVersion = "26.05";
}

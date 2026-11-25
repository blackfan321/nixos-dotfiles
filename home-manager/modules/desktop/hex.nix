{ inputs, ... }:

{
  imports = [
    inputs.hex.homeManagerModules.hex
  ];

  programs.hex = {
    enable = true;
    autostart = true;
  };
}

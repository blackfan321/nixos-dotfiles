{ inputs, pkgs, ... }:

{
  imports = [ inputs.proton-ge.nixosModules.default ];

  programs.steam = {
    enable = true;
    package = pkgs.steam;

    extraCompatPackages = with pkgs; [
      GE-Proton11-12
    ];

    protontricks = {
      enable = true;
      package = pkgs.protontricks;
    };
  };
}

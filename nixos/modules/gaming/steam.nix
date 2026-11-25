{ inputs, pkgs, ... }:

{
  imports = [ inputs.proton-ge.nixosModules.default ];

  programs.steam = {
    enable = true;
    package = pkgs.steam;

    extraCompatPackages = with pkgs; [
      GE-Proton11-14
    ];

    protontricks = {
      enable = true;
      package = pkgs.protontricks;
    };
  };
}

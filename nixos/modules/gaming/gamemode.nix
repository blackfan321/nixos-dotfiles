{ pkgs, username, ... }:

{
  programs.gamemode = {
    enable = true;
    package = pkgs.gamemode;

    settings = {
      custom = {
        start = "${pkgs.power-profiles-daemon}/bin/powerprofilesctl set performance";
        end = "${pkgs.power-profiles-daemon}/bin/powerprofilesctl set balanced";
      };
      gpu = {
        apply_gpu_optimisations = "accept-responsibility";
        gpu_device = 1; # card1 = Navi 48 dGPU, card0 = Raphael iGPU
        amd_performance_level = "high";
      };
    };
  };

  users.extraGroups.gamemode.members = [ username ];
}

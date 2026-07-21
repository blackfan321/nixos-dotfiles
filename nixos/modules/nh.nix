{ username, pkgs, ... }:

{
  programs.nh = {
    enable = true;
    package = pkgs.nh;
    flake = "/home/${username}/Git/nixos-dotfiles";

    clean = {
      enable = true;
      dates = "*-*-1/3 22:00";
      extraArgs = "--keep-since 7d --optimise";
    };
  };
}

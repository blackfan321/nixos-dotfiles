{ username, ... }:

{
  programs.nh = {
    enable = true;
    flake = "/home/${username}/Git/nixos-dotfiles";

    clean = {
      enable = true;
      dates = "*-*-1/3 22:00";
      extraArgs = "--keep-since 7d --optimise";
    };
  };
}

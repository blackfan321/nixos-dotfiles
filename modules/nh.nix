{ ... }:

{
  den.aspects.nh = { user, ... }: {
    nixos = { ... }: {
      programs.nh = {
        enable = true;
        flake = "/home/${user.userName}/Git/nixos-dotfiles";

        clean = {
          enable = true;
          dates = "*-*-1/3 22:00";
          extraArgs = "--keep-since 7d --optimise";
        };
      };
    };
  };
}

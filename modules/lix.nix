{ ... }:

{
  den.aspects.lix = { ... }: {
    nixos = { pkgs, ... }: {
      nix = {
        package = pkgs.lixPackageSets.stable.lix;
        settings = {
          experimental-features = [
            "nix-command"
            "flakes"
          ];
          trusted-users = [ "@wheel" ];
        };
      };
    };
  };
}

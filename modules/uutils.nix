{ ... }:

{
  den.aspects.uutils = { ... }: {
    nixos = { pkgs, ... }: {
      environment.systemPackages = [ pkgs.uutils-coreutils-noprefix ];
    };
  };
}

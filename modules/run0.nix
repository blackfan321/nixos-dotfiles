{ ... }:

{
  den.aspects.run0 = { ... }: {
    nixos = { ... }: {
      security.run0 = {
        enable = true;
        persistentAuth.enable = true;
        wheelNeedsPassword = true;
      };
    };
  };
}

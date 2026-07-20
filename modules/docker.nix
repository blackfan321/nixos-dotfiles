{ ... }:

{
  den.aspects.docker = { user, ... }: {
    nixos = { ... }: {
      virtualisation.docker = {
        enable = true;

        autoPrune = {
          enable = true;
          dates = "*-*-1/3 23:00";
        };
      };

      users.extraGroups.docker.members = [ user.userName ];
    };
  };
}

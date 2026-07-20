{ ... }:

{
  den.aspects.git = { user, ... }: {
    homeManager = { pkgs, ... }: {
      programs.git = {
        enable = true;
        package = pkgs.gitFull;
        settings = {
          user.name = user.description;
          user.email = "${user.userName}@gmail.com";
        };
      };
    };
  };
}

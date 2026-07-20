{ ... }:

{
  den.aspects.vim = { ... }: {
    homeManager = { ... }: {
      programs.vim = {
        enable = true;
        defaultEditor = true;
        settings = {
          number = true;
        };
      };
    };
  };
}

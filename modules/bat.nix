{ ... }:

{
  den.aspects.bat = { ... }: {
    homeManager = { pkgs, ... }: {
      programs.bat = {
        enable = true;
        package = pkgs.bat;
        extraPackages = with pkgs.bat-extras; [
          batwatch
          batdiff
          batgrep
          batpipe
        ];
        config = {
          theme = "OneHalfLight";
          style = "numbers,changes,header";
        };
      };
    };
  };
}

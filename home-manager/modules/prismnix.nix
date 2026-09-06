{ inputs, pkgs, ... }:

{
  imports = [ inputs.prismnix.homeModules.prismnix ];

  programs.prismnix = {
    enable = true;
    package = pkgs.prismlauncher;

    instances."Test" = {
      config = {
        memory = {
          override = true;
          min = 2048;
          max = 8192;
        };
      };

      minecraft = {
        enable = true;
        version = "1.21.1";

        mod-loader = {
          enable = true;
          loader = "fabric";
        };

        mods = {
          fabric-api.enable = true;
        };

        packages = [
          pkgs.prismnix.sodium
        ];
      };
    };
  };
}

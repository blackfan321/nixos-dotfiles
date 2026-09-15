{ inputs, pkgs, ... }:

let
  iris = pkgs.prismnix.mkModrinthPkg {
    name = "iris";
    id = "YL57xq9U";
    type = "mod";
    version = {
      id = "2nyTWtzT";
      file = "iris-fabric-1.11.5+mc26.3.jar";
      hash = "sha256-kEt1bys68c+mCWRiZF9boZRxhPdNYbEf6Sx5pjiCfC0=";
    };
  };
in
{
  imports = [ inputs.prismnix.homeModules.prismnix ];

  programs.prismnix = {
    enable = true;
    package = pkgs.prismlauncher;

    instances."26.3" = {
      config = {
        memory = {
          override = true;
          min = 2048;
          max = 8192;
        };
      };

      minecraft = {
        enable = true;
        version = "26.3";

        mod-loader = {
          enable = true;
          loader = "fabric";
          version = "0.19.5";
        };

        shader-loader = {
          enable = true;
          loader = "iris";
          package = iris;
        };

        packages = [
          # TODO: lithium
          (pkgs.prismnix.mkModrinthPkg {
            name = "fabric-api";
            id = "P7dR8mSH";
            type = "mod";
            version = {
              id = "oCYG2H4L";
              file = "fabric-api-0.160.5+26.3.jar";
              hash = "sha256-UJbpd01imFAzj8HHO1VxtScXE3SxGsIxaR+5NzHuCuY=";
            };
          })
          (pkgs.prismnix.mkModrinthPkg {
            name = "sodium";
            id = "AANobbMI";
            type = "mod";
            version = {
              id = "bAZQdGpg";
              file = "sodium-fabric-0.9.2+mc26.3.jar";
              hash = "sha256-h6W7Offm5BEG538SL4L8k/nTvAtuvLdGsxQXKkRqKHo=";
            };
          })
          (pkgs.prismnix.mkModrinthPkg {
            name = "scalablelux";
            id = "Ps1zyz6x";
            type = "mod";
            version = {
              id = "z2JqNJyJ";
              file = "ScalableLux-fabric-0.3.0-alpha.0.4-all.jar";
              hash = "sha256-zqrVR50Xn49POkFM9KJZIqvd9Ygk14IWl19sB3S/xh4=";
            };
          })
          (pkgs.prismnix.mkModrinthPkg {
            name = "jade";
            id = "nvQzSEkH";
            type = "mod";
            version = {
              id = "vdhnGNqO";
              file = "Jade-mc26.3-Fabric-26.3.0.jar";
              hash = "sha256-9DcEqMcSQPcqbZMr3xU7oaNTVsMzS7dxPK8v/xyqvio=";
            };
          })
          (pkgs.prismnix.mkModrinthPkg {
            name = "presence-footsteps";
            id = "rcTfTZr3";
            type = "mod";
            version = {
              id = "UUNiN7Tm";
              file = "PresenceFootsteps-1.14.0+26.3.jar";
              hash = "sha256-7vvOCNPaW2/Pe0f+M2h3KY+fT5hYfTUTdceFLlZliHM=";
            };
          })
          (pkgs.prismnix.mkModrinthPkg {
            name = "complementary-reimagined";
            id = "HVnmMxH1";
            type = "shader";
            version = {
              id = "Bqen1mJX";
              file = "ComplementaryReimagined_r5.9.3.zip";
              hash = "sha256-/tbIeecyz3/HvGVw67He9DI1qn6W9ihZ+9vb+gtISzg=";
            };
          })
        ];
      };
    };
  };
}

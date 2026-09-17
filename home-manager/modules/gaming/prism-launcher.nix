{ inputs, pkgs, ... }:

let
  iris = pkgs.prismnix.mkModrinthPkg {
    name = "iris";
    id = "YL57xq9U";
    type = "mod";
    version = {
      id = "bAdKrpw8";
      file = "iris-fabric-1.11.6+mc26.3.jar";
      hash = "sha256-D81viFjblO0fKCEABfz/m5Nkvqpusqjsz5RJpvcJ8U0=";
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
          (pkgs.prismnix.mkModrinthPkg {
            name = "fabric-api";
            id = "P7dR8mSH";
            type = "mod";
            version = {
              id = "hHj6EvFZ";
              file = "fabric-api-0.160.7+26.3.jar";
              hash = "sha256-FyDjGrZcYtTebpY2BtdNtNYGO/WLBl9AKWzaposldZ0=";
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
            name = "lithium";
            id = "gvQqBUqZ";
            type = "mod";
            version = {
              id = "WXHRsMRl";
              file = "lithium-fabric-0.26.1+mc26.3.jar";
              hash = "sha256-NOXhl8QNo3L2dQDtSWuyGT2RR8EtUPmI4EpRMgXRgBU=";
            };
          })
          (pkgs.prismnix.mkModrinthPkg {
            name = "ferritecore";
            id = "uXXizFIs";
            type = "mod";
            version = {
              id = "d5ddUdiB";
              file = "ferritecore-9.0.0-fabric.jar";
              hash = "sha256-ITlmxy7ZZ6zHOSvrKKhm+6MB/1a5l2wueAHC233mvyI=";
            };
          })
          (pkgs.prismnix.mkModrinthPkg {
            name = "mouse-tweaks";
            id = "aC3cM3Vq";
            type = "mod";
            version = {
              id = "LeMuMhLv";
              file = "MouseTweaks-fabric-mc26.3-2.31.jar";
              hash = "sha256-f6Nd9WjIcMRf0UTcmlQTlFne2CNhXdoyvAnZAlgx5lU=";
            };
          })
          (pkgs.prismnix.mkModrinthPkg {
            name = "fishing-rod-fix";
            id = "x9ISUf1U";
            type = "mod";
            version = {
              id = "lUbeEytd";
              file = "fishingrodfix-26.3-v0.5.jar";
              hash = "sha256-0FYi4aPxp/gMKOEACuteGMuJ10HR0CpaCFCGjWGfRkg=";
            };
          })
          (pkgs.prismnix.mkModrinthPkg {
            name = "scalablelux";
            id = "Ps1zyz6x";
            type = "mod";
            version = {
              id = "g4eqNSKd";
              file = "ScalableLux-fabric-mc26.3-0.3.0-alpha.0.6-all.jar";
              hash = "sha256-6RN6BP3vyk/R9HQKs9xhlLXqfBVFbGaRN2uRAFOFOik=";
            };
          })
          (pkgs.prismnix.mkModrinthPkg {
            name = "jade";
            id = "nvQzSEkH";
            type = "mod";
            version = {
              id = "lt43vWtF";
              file = "Jade-mc26.3-Fabric-26.3.1.jar";
              hash = "sha256-wvUwjaW38+unpxHwzy5YriZmvHK+/81KAMYW2nWn5/A=";
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

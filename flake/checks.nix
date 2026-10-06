{ inputs, ... }:
{
  perSystem =
    { pkgs, system, ... }:
    let
      prek = inputs.git-hooks.lib.${system}.run {
        src = inputs.self;
        package = pkgs.prek;
        hooks = {
          deadnix.enable = true;
          deadnix.priority = 1;

          statix.enable = true;
          statix.priority = 2;
        };
      };
    in
    {
      checks.prek = prek;
    };
}

{
  perSystem =
    { config, pkgs, ... }:
    {
      devShells.default = pkgs.mkShell {
        inherit (config.checks.prek) shellHook;
        buildInputs = config.checks.prek.enabledPackages;
      };
    };
}

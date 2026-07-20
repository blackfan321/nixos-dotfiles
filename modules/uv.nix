{ ... }:

{
  den.aspects.uv = { ... }: {
    homeManager = { pkgs, ... }: {
      programs.uv = {
        enable = true;
        package = pkgs.uv;

        settings = {
          python-preference = "only-managed";
          python-downloads = "manual";
        };

        python = {
          versions = [
            "3.13"
            "3.14"
          ];
          default = [ "3.14" ];
          prune = true;
        };

        tool = {
          packages = [
            "argcomplete"
            "datamodel-code-generator"
            "complexipy"
          ];
          prune = true;
        };
      };
    };
  };
}

{
  programs.uv = {
    enable = true;

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
      ];
      prune = true;
    };
  };
}

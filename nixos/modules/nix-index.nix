{ inputs, system, ... }:

{
  imports = [
    inputs.nix-index-database.nixosModules.default
  ];

  programs = {
    nix-index-database = {
      enable = true;
      comma.enable = true;
    };
    nix-index = {
      enable = true;
      enableZshIntegration = true;
      package = inputs.nix-index-database.packages.${system}.nix-index-with-small-db;
    };
  };
}

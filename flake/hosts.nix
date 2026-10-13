{ inputs, ... }:

let
  username = "blackfan321";
  system = "x86_64-linux";
in
{
  flake = {
    nixosConfigurations.nixos = inputs.nixpkgs-patcher.lib.nixosSystem {
      inherit system;
      specialArgs = inputs // {
        inherit inputs username system;
      };
      modules = [
        "${inputs.self}/nixos/configuration.nix"

        inputs.determinate.nixosModules.default
        inputs.home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = inputs // {
              inherit inputs username system;
            };
            backupFileExtension = "hm-bak";
            users.${username} = "${inputs.self}/home-manager/home.nix";
          };
        }
      ];
    };
  };
}

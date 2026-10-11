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
        self = inputs.self;
      };
      modules = [
        "${inputs.self}/nixos/configuration.nix"

        inputs.home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = {
              inherit inputs username system;
              self = inputs.self;
            };
            backupFileExtension = "hm-bak";
            users.${username} = "${inputs.self}/home-manager/home.nix";
          };
        }
      ];
    };
  };
}

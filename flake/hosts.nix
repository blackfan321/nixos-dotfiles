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
        ../nixos/configuration.nix

        inputs.home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = { inherit inputs username system; };
            backupFileExtension = "hm-bak";
            users.${username} = ../home-manager/home.nix;
          };
        }
      ];
    };
  };
}

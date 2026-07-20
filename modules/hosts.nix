{ inputs, ... }:

{
  den.hosts.x86_64-linux.nixos = {
    users.blackfan321 = {
      face = ../assets/face.png;
      description = "Ivan Batrakov";
    };

    instantiate =
      args:
      inputs.nixpkgs.lib.nixosSystem (
        args
        // {
          specialArgs = (args.specialArgs or { }) // {
            inherit inputs;
          };
        }
      );
  };

  # den.hosts.aarch64-darwin.macos.users.blackfan321 = { };
}

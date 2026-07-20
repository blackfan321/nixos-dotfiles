{ inputs, den, ... }:

{
  den.aspects.nixos = {
    includes = [
      den.aspects.nixos-machine
      den.aspects.systemd-boot
      den.aspects.run0
      den.aspects.networkmanager
      den.aspects.cachyos-kernel
      den.aspects.lix
      den.aspects.fonts
      den.aspects.i18n
      den.aspects.uutils
    ];

    nixos = { ... }: {
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        backupFileExtension = "hm-bak";
        extraSpecialArgs = { inherit inputs; };
      };
    };
  };
}

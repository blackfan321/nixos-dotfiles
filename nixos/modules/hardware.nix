{ ... }:

{
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/7611b7ff-332f-4c68-827e-0a1461a963e9";
      fsType = "ext4";
    };
    "/boot" = {
      device = "/dev/disk/by-uuid/3AC2-EFC3";
      fsType = "vfat";
      options = [
        "fmask=0077"
        "dmask=0077"
      ];
    };
  };

  hardware = {
    enableRedistributableFirmware = true;
    cpu.amd.updateMicrocode = true;
    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };
}

{ pkgs, ... }:

{
  boot = {
    loader = {
      timeout = 15;
      systemd-boot = {
        enable = true;
        memtest86.enable = true;
        windows = {
          "windows" = {
            title = "Windows 11";
            efiDeviceHandle = "HD0b";
          };
        };
      };
      efi.canTouchEfiVariables = true;
    };
    kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest-lto-zen4;
  };
}

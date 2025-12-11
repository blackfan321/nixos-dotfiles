{ pkgs, ... }:

{
  boot.loader.timeout = 15;
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.windows = {
    "windows" = {
      title = "Windows 11";
      efiDeviceHandle = "HD0b";
    };
  };
  boot.loader.systemd-boot.memtest86.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;
}

{ pkgs, ... }:

{
  boot = {
    kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest-lto-zen4;

    kernel.sysctl."vm.max_map_count" = 262144;

    initrd = {
      availableKernelModules = [
        "nvme"
        "xhci_pci"
        "ahci"
        "usbhid"
        "usb_storage"
        "sd_mod"
      ];
      kernelModules = [ ];
    };

    supportedFilesystems = [ "ntfs" ];

    kernelModules = [ "ntsync" ];
    blacklistedKernelModules = [ "ntfs3" ];

    tmp.cleanOnBoot = true;
  };
}

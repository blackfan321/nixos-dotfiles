{ inputs, lib, pkgs, ... }:

{
  nixpkgs.overlays = lib.mkBefore [
    inputs.nix-cachyos-kernel.overlays.pinned
  ];

  boot = {
    kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest-lto-zen4;

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
  };
}

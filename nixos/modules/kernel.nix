{
  config,
  inputs,
  pkgs,
  ...
}:

{
  nixpkgs.overlays = [
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

    kernelModules = [
      "amneziawg"
      "kvm-amd"
      "ntsync"
    ];

    extraModulePackages = with config.boot.kernelPackages; [ amneziawg ];
    supportedFilesystems = [ "ntfs" ];
  };
}

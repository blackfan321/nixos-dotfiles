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

    # Thank you, Cursor-sama for fixing this
    # Linux 6.14+ removed ipv6_stub; upstream amneziawg still uses it (as of 1.0.20260611).
    extraModulePackages =
      let
        kp = config.boot.kernelPackages;
      in
      [
        (kp.amneziawg.overrideAttrs (old: {
          postPatch = (old.postPatch or "") + ''
            substituteInPlace socket.c \
              --replace-fail 'ipv6_stub->ipv6_dst_lookup_flow' 'ip6_dst_lookup_flow'
          '';
        }))
      ];
    supportedFilesystems = [ "ntfs" ];
  };
}

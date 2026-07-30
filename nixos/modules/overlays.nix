{ inputs, ... }:

let
  cachyos-kernel = inputs.cachyos-kernel.overlays.pinned;
  networkmanager-amneziawg = inputs.networkmanager-amneziawg.overlays.default;

  packages = _final: prev: {
    vintagestory = prev.vintagestory.override {
      waylandSupport = true;
      x11Support = false;
    };
  };
in
{
  nixpkgs.overlays = [
    cachyos-kernel
    networkmanager-amneziawg
    packages
  ];
}

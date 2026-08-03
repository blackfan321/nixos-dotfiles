{ inputs, ... }:

let
  cachyos-kernel = inputs.cachyos-kernel.overlays.pinned;
  networkmanager-amneziawg = inputs.networkmanager-amneziawg.overlays.default;

  package-overrides = _final: prev: with prev; {
    vintagestory = vintagestory.override {
      waylandSupport = true;
      x11Support = false;
    };

    anki = anki.overrideAttrs (old: {
      preFixup = (old.preFixup or "") + ''
        makeWrapperArgs+=(
          --set QT_QPA_PLATFORM wayland
          --set ANKI_WAYLAND 1
        )
      '';
    });
  };
in
{
  nixpkgs.overlays = [
    cachyos-kernel
    networkmanager-amneziawg
    package-overrides
  ];
}

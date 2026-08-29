{ inputs, ... }:

let
  flakeOverlays = [
    inputs.cachyos-kernel.overlays.pinned
    inputs.networkmanager-amneziawg.overlays.default
  ];

  local-overrides = final: prev: {
    # https://github.com/vovochka404/network-manager-amneziawg/pull/9
    networkmanager-amneziawg = prev.networkmanager-amneziawg.overrideAttrs (old: {
      patches = (old.patches or [ ]) ++ [
        ../patches/networkmanager-amneziawg-kernel-abi.patch
        ../patches/networkmanager-amneziawg-sysfs-version.patch
      ];
    });

    vintagestory = prev.vintagestory.override {
      waylandSupport = true;
      x11Support = false;
    };

    anki = prev.anki.overrideAttrs (old: {
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
  nixpkgs.overlays = flakeOverlays ++ [ local-overrides ];
}

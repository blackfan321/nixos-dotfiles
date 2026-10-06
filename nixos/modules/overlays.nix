{ inputs, ... }:

let
  flakeOverlays = [
    inputs.cachyos-kernel.overlays.pinned
    inputs.networkmanager-amneziawg.overlays.default
    inputs.prism-launcher.overlays.default
  ];

  local-overrides = final: prev: {
    networkmanager-amneziawg = prev.networkmanager-amneziawg.overrideAttrs (old: {
      patches = (old.patches or [ ]) ++ [
        ../patches/networkmanager-amneziawg-sysfs-version.patch
        ../patches/networkmanager-amneziawg-pr11.patch
      ];
    });

    vintagestory = prev.vintagestory.override {
      waylandSupport = true;
      x11Support = false;
    };

    # apostrophe (python312) only — don't touch python314/anyio used by lix
    python312Packages = prev.python312Packages.overrideScope (
      _pyFinal: pyPrev: {
        anyio = pyPrev.anyio.overridePythonAttrs (_old: {
          doCheck = false;
        });
      }
    );
  };
in
{
  nixpkgs.overlays = flakeOverlays ++ [ local-overrides ];
}

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

    scx = scx // {
      rustscheds = scx.rustscheds.overrideAttrs (old: rec {
        version = "1.1.2";
        src = fetchFromGitHub {
          owner = "sched-ext";
          repo = "scx";
          tag = "v${version}";
          hash = "sha256-igrmrfimVOEJnFxMr9ghN6lAHwEBSFLLVrB2MQ72PXI=";
        };
        cargoHash = "sha256-CTEVdvw6aG/fFas2Fk3x9o4Sp2k3lHO/OLwUM8t9UjE=";
        cargoDeps = rustPlatform.fetchCargoVendor {
          inherit src;
          name = "${old.pname}-${version}-vendor";
          hash = cargoHash;
        };
        doInstallCheck = false;
      });
    };
  };
in
{
  nixpkgs.overlays = [
    cachyos-kernel
    networkmanager-amneziawg
    package-overrides
  ];
}

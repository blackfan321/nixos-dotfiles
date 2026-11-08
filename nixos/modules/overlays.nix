{ inputs, ... }:

let
  flakeOverlays = [
    inputs.cachyos-kernel.overlays.pinned
    inputs.prism-launcher.overlays.default
  ];

  local-overrides = _final: prev: {
    vintagestory = prev.vintagestory.override {
      waylandSupport = true;
      x11Support = false;
    };

    # use detsys nix instead of vanilla one
    comma = prev.comma.override {
      nix = inputs.detsys-nix.packages.${prev.system}.default;
    };

    # CachyOS patch: PPD switches scx_loader modes on GNOME power profile change
    # https://github.com/CachyOS/CachyOS-PKGBUILDS/tree/master/power-profiles-daemon
    power-profiles-daemon = prev.power-profiles-daemon.overrideAttrs (old: {
      patches = (old.patches or [ ]) ++ [ ../patches/scx-loader-mode-switching.patch ];
    });
  };
in
{
  nixpkgs.overlays = flakeOverlays ++ [ local-overrides ];
}

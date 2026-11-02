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
  };
in
{
  nixpkgs.overlays = flakeOverlays ++ [ local-overrides ];
}

{ inputs, self, ... }:

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

    # apostrophe (python312) only — don't touch python314/anyio used by lix
    python312Packages = prev.python312Packages.overrideScope (
      _pyFinal: pyPrev: {
        anyio = pyPrev.anyio.overridePythonAttrs (_old: {
          doCheck = false;
        });
      }
    );

    # Determinate Nix 3.23+ emits ActivityType 10113; nom 2.2.0 rejects it.
    # Upstream: maralorn/nix-output-monitor#321 — drop when nixpkgs nom > 2.2.0.
    nh =
      if prev.nix-output-monitor.version == "2.2.0"
         # nixpkgs#576147 adds the same fix as fetchpatch — skip ours then,
         # or the hunks collide. (patches attr always exists, may be [])
         && (prev.nix-output-monitor.patches or [ ]) == [ ] then
        prev.nh.override {
          nix-output-monitor = prev.nix-output-monitor.overrideAttrs (old: {
            patches = (old.patches or [ ]) ++ [
              "${self}/nixos/patches/nix-output-monitor-unknown-activity-types.patch"
            ];
          });
        }
      else
        prev.nh;
  };
in
{
  nixpkgs.overlays = flakeOverlays ++ [ local-overrides ];
}

# Linux 6.14+ removed ipv6_stub; upstream amneziawg still uses it (as of 1.0.20260611).
# Must use linuxPackages.extend — plain // is dropped when NixOS re-extends boot.kernelPackages.
_final: prev:
let
  inherit (prev.lib) hasPrefix mapAttrs;

  patchAmneziawg =
    amneziawg:
    amneziawg.overrideAttrs (old: {
      patches = (old.patches or [ ]) ++ [
        ../patches/amneziawg-ipv6-stub.patch
      ];
    });

  patchLinuxPackages =
    kp:
    if kp ? extend && kp ? amneziawg then
      kp.extend (
        _final: prevLp: {
          amneziawg = patchAmneziawg prevLp.amneziawg;
        }
      )
    else
      kp;
in
{
  cachyosKernels = mapAttrs (
    name: kp:
    if hasPrefix "linuxPackages" name then
      patchLinuxPackages kp
    else
      kp
  ) prev.cachyosKernels;
}

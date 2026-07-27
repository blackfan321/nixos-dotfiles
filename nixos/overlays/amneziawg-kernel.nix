# Linux 6.14+/7.1.5+ API breaks in upstream amneziawg (1.0.20260611):
# - ipv6_stub removed
# - udp_tunnel_* takes struct sock* instead of socket*
# Must use linuxPackages.extend — plain // is dropped when NixOS re-extends boot.kernelPackages.
_final: prev:
let
  inherit (prev.lib) hasPrefix mapAttrs;

  patchAmneziawg =
    amneziawg:
    amneziawg.overrideAttrs (old: {
      patches = (old.patches or [ ]) ++ [
        ../patches/amneziawg-kernel-7.patch
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

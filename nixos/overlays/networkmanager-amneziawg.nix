# Patches networkmanager-amneziawg from wg-feed:
# - PR #6: netlink backend robustness (vovochka404/network-manager-amneziawg#6)
# - NixOS: add /run/current-system/sw/bin/modprobe to search paths
final: prev:
{
  networkmanager-amneziawg = prev.networkmanager-amneziawg.overrideAttrs (old: {
    patches = (old.patches or [ ]) ++ [
      ../patches/networkmanager-amneziawg-pr6.patch
    ];

    postPatch =
      (old.postPatch or "")
      + ''
        substituteInPlace shared/awg/awg-connection-manager-netlink.c \
          --replace-fail '"/usr/sbin/modprobe",' '"/usr/sbin/modprobe", "/run/current-system/sw/bin/modprobe",'
      '';
  });
}

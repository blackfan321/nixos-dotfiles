{ inputs, system, ... }:

{
  home.packages = [
    inputs.nix-update-git.packages.${system}.nix-update-git

    # NixOS: /etc/systemd is RO — use /run drop-in instead (upstream aleadag/nix-proxy-manager)
    # (inputs.nix-proxy-manager.packages.${system}.nix-proxy-manager.overrideAttrs (old: {
    #   patches = (old.patches or [ ]) ++ [
    #     "${self}/nixos/patches/nix-proxy-manager-runtime-dropin.patch"
    #   ];
    # }))
  ];
}

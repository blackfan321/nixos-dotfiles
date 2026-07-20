{ ... }:

{
  den.aspects.networkmanager = { ... }: {
    nixos = {
      pkgs,
      inputs,
      config,
      ...
    }:
    {
      nixpkgs.overlays = [
        inputs.networkmanager-amneziawg.overlays.default
      ];

      networking = {
        networkmanager = {
          enable = true;
          plugins = with pkgs; [
            networkmanager-openvpn
            networkmanager-amneziawg
          ];
        };

        # Encrypted using git-crypt; see ../secrets/networking-hosts.nix
        hosts = import ../secrets/networking-hosts.nix;
      };

      environment.systemPackages = [ pkgs.amneziawg-tools ];

      systemd.services.NetworkManager = {
        path = [ pkgs.amneziawg-tools ];
        serviceConfig.Environment = [ "NM_FORCE_AWG_QUICK=1" ];
      };

      boot = {
        kernelModules = [ "amneziawg" ];

        # Linux 6.14+ removed ipv6_stub; upstream amneziawg still uses it (as of 1.0.20260611).
        extraModulePackages =
          let
            kp = config.boot.kernelPackages;
          in
          [
            (kp.amneziawg.overrideAttrs (old: {
              postPatch = (old.postPatch or "") + ''
                substituteInPlace socket.c \
                  --replace-fail 'ipv6_stub->ipv6_dst_lookup_flow' 'ip6_dst_lookup_flow'
              '';
            }))
          ];
      };
    };
  };
}

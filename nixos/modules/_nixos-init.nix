{ pkgs, ... }:

{
  # currently breaks NM VPN plugins (nixpkgs#505475 / #533343)
  system.nixos-init = {
    enable = true;
    package = pkgs.nixos-init;
  };

  system.etc.overlay.enable = true;
}

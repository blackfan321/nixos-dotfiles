{ ... }:

{
  nix = {
    channel.enable = false;

    settings = {
      trusted-users = [ "@wheel" ];
      warn-dirty = false;
      nix-path = [ "nixpkgs=flake:nixpkgs" ];
      use-xdg-base-directories = true;
      experimental-features = [ "cgroups" ];
      use-cgroups = true;
    };
  };

  nixpkgs.config = {
    allowUnfree = true;
  };

  # drop useless "NixOS Manual" desktop shortcut
  documentation.nixos.enable = false;
}

{ inputs, system, lib, ... }:

{
  nix = {
    package = inputs.detsys-nix.packages.${system}.default;

    channel.enable = false;

    settings = {
      trusted-users = [ "@wheel" ];
      warn-dirty = false;
      nix-path = [ "nixpkgs=flake:nixpkgs" ];
      use-xdg-base-directories = true;
      experimental-features = [ "cgroups" ];
      use-cgroups = true;
      # detsys-only features
      eval-cores = 0;
      lazy-trees = true;
    };
  };

  nixpkgs.config = {
    allowUnfree = true;
  };

  # detsys daemon defaults
  systemd.services.nix-daemon.serviceConfig = {
    LimitNOFILE = lib.mkOverride 75 1048576;
    LimitSTACK = lib.mkOverride 75 "64M";
    TasksMax = lib.mkOverride 75 1048576;
  };

  # drop useless "NixOS Manual" desktop shortcut
  documentation.nixos.enable = false;
}

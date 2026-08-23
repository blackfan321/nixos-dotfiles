{ pkgs, ... }:

{
  nix = {
    package = pkgs.lixPackageSets.stable.lix;
    channel.enable = false;

    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      trusted-users = [ "@wheel" ];
      warn-dirty = false;
      nix-path = [ "nixpkgs=flake:nixpkgs" ];
      use-xdg-base-directories = true;
    };
  };

  nixpkgs.config = {
    allowUnfree = true;
  };
}

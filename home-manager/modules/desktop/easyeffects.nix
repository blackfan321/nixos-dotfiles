{ pkgs, ... }:

{
  services.easyeffects = {
    enable = true;
    package = pkgs.easyeffects;
    # TODO: add declarative presets
  };
}

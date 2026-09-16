{ pkgs, ... }:

{
  services.fwupd = {
    enable = true;
    package = pkgs.fwupd;
  };

  environment.systemPackages = [ pkgs.gnome-firmware ];
}

{ lib, ... }:

{
  services.gnome.gnome-keyring.enable = lib.mkForce false;

  services.oo7.enable = true;
  security.pam.services.gdm.oo7.enable = true;
}

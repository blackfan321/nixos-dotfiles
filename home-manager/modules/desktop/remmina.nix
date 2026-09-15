{ pkgs, ... }:

{
  xdg.mimeApps.enable = true;

  services.remmina = {
    enable = true;
    package = pkgs.remmina;

    systemdService.enable = false;
    addRdpMimeTypeAssoc = true;
  };
}

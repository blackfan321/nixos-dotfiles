{ pkgs, ... }:

{
  services = {
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    gnome = {
      core-apps.enable = true;
      core-developer-tools.enable = false;
      games.enable = false;
    };
  };

  environment.gnome.excludePackages = with pkgs; [
    epiphany
    gnome-console
    gnome-maps
    gnome-text-editor
    gnome-contacts
    gnome-tour
    gnome-user-docs
    showtime
    snapshot
    gnome-user-docs
  ];
}

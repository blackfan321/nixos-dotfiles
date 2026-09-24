{ pkgs, ... }:

{
  services = {
    desktopManager.gnome.enable = true;
    gnome = {
      core-apps.enable = true;
      core-developer-tools.enable = false;
      games.enable = false;
    };
  };

  environment.gnome.excludePackages = with pkgs; [
    epiphany
    decibels
    gnome-connections
    gnome-console
    # gnome-maps
    gnome-text-editor
    gnome-contacts
    gnome-tour
    gnome-user-docs
    gnome-music
    showtime
    snapshot
    yelp
  ];
}

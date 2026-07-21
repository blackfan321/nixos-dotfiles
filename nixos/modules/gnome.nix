{ pkgs, username, ... }:

let
  faceIcon = ../../assets/face.png;
in
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
    decibels
    gnome-connections
    gnome-console
    gnome-maps
    gnome-text-editor
    gnome-contacts
    gnome-tour
    gnome-user-docs
    gnome-music
    showtime
    snapshot
    yelp
  ];

  # implicitly installs nautilus-python as well
  programs.nautilus-open-any-terminal = {
    enable = true;
    terminal = "ptyxis";
  };

  # fix missing avatar in GDM
  systemd.tmpfiles.rules = [
    "f+ /var/lib/AccountsService/users/${username} 0600 root root - [User]\\nIcon=/var/lib/AccountsService/icons/${username}\\n"
    "L+ /var/lib/AccountsService/icons/${username} - - - - ${faceIcon}"
  ];
}

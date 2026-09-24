{ username, ... }:

let
  faceIcon = ../../../assets/face.png;
in
{
  services.displayManager.gdm = {
    enable = true;
    banner = "Hello!";
    autoSuspend = true;
  };

  # fix missing avatar in GDM
  systemd.tmpfiles.rules = [
    "f+ /var/lib/AccountsService/users/${username} 0600 root root - [User]\\nIcon=/var/lib/AccountsService/icons/${username}\\n"
    "L+ /var/lib/AccountsService/icons/${username} - - - - ${faceIcon}"
  ];
}

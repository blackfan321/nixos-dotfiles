{ username, self, ... }:

let
  faceIcon = "${self}/assets/face.png";
in
{
  services.displayManager.gdm = {
    enable = true;
    autoSuspend = true;
  };

  # fix missing avatar in GDM
  systemd.tmpfiles.rules = [
    "f+ /var/lib/AccountsService/users/${username} 0600 root root - [User]\\nIcon=/var/lib/AccountsService/icons/${username}\\n"
    "L+ /var/lib/AccountsService/icons/${username} - - - - ${faceIcon}"
  ];
}

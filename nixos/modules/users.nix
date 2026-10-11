{ pkgs, username, self, ... }:

let
  secrets = import "${self}/secrets/password.nix";
in
{
  services.userborn = {
    enable = true;
    package = pkgs.userborn;
  };

  users = {
    defaultUserShell = pkgs.zsh;
    users.${username} = {
      isNormalUser = true; # create & set home directory, add users group, etc.
      description = "Ivan Batrakov";
      hashedPassword = secrets.hashedPassword;

      # some staff to fix rootless podman issue
      subUidRanges = [
        {
          startUid = 100000;
          count = 65536;
        }
      ];
      subGidRanges = [
        {
          startGid = 100000;
          count = 65536;
        }
      ];
    };
  };
}

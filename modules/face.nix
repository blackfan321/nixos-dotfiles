{ ... }:

{
  den.aspects.face = { user, ... }: {
    nixos = { ... }: {
      systemd.tmpfiles.rules = [
        "f+ /var/lib/AccountsService/users/${user.userName} 0600 root root - [User]\\nIcon=/var/lib/AccountsService/icons/${user.userName}\\n"
        "L+ /var/lib/AccountsService/icons/${user.userName} - - - - ${user.face}"
      ];
    };

    homeManager = { ... }: {
      home.file.".face".source = user.face;
    };
  };
}

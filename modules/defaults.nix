{ den, lib, ... }:

{
  den.schema.user.classes = lib.mkDefault [ "homeManager" ];

  den.default.includes = [
    den.batteries.define-user
    den.batteries.hostname
  ];

  den.default.homeManager = {
    home.stateVersion = "26.05";

    home.sessionVariables.QT_QPA_PLATFORMTHEME = "xdgdesktopportal";

    xdg.userDirs.enable = true;
    xdg.userDirs.createDirectories = true;
  };

  den.default.nixos = {
    system.stateVersion = "25.11";

    security.sudo.enable = false;
    time.timeZone = "Europe/Moscow";

    nixpkgs.config = {
      allowUnfree = true;
      permittedInsecurePackages = [
        "pnpm-10.29.2"
        "electron-40.10.5"
      ];
    };

    services.xserver.xkb = {
      layout = "us,ru";
      variant = "";
    };
  };
}

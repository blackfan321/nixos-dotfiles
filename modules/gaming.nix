{ ... }:

{
  den.aspects.gaming = { user, ... }: {
    nixos = { pkgs, ... }: {
      hardware.xone.enable = true;

      boot.kernelModules = [ "ntsync" ];

      programs = {
        gamemode.enable = true;

        steam = {
          enable = true;
          remotePlay.openFirewall = true;
          protontricks.enable = true;
          extraCompatPackages = with pkgs; [
            proton-ge-bin # for cool games
            dwproton-bin # for chinese casino games
          ];
        };
      };

      users.extraGroups.gamemode.members = [ user.userName ];
    };

    homeManager = { pkgs, inputs, ... }: {
      home.packages =
        with pkgs;
        [
          prismlauncher
          sgdboop
          protonplus
        ]
        ++ [
          inputs.hytale-launcher.packages.${pkgs.system}.hytale-launcher
        ];
    };
  };
}

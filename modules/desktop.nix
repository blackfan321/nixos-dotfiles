{ ... }:

{
  den.aspects.desktop = { ... }: {
    homeManager = { pkgs, inputs, ... }: {
      home.packages =
        with pkgs;
        [
          keepassxc
          telegram-desktop
          remmina
          anki
          qbittorrent
          vlc
          yaak
          onlyoffice-desktopeditors
          ptyxis
          pinta
          amberol
        ]
        ++ [
          inputs.express-messenger.packages.${pkgs.system}.express
          inputs.loop-messenger.packages.${pkgs.system}.loop-desktop
          inputs.ktalk.packages.${pkgs.system}.ktalk
        ];
    };
  };
}

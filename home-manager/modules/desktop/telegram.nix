{ pkgs, ... }:

let
  telegram-desktop = pkgs.symlinkJoin {
    name = "telegram-desktop-wayland";
    paths = [ pkgs.telegram-desktop ];
    nativeBuildInputs = [ pkgs.makeWrapper ];
    postBuild = ''
      wrapProgram $out/bin/Telegram \
        --set QT_QPA_PLATFORM wayland
    '';
  };
in
{
  home.packages = [ telegram-desktop ];
}

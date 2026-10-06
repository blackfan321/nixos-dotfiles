{ pkgs, ... }:

let
  wrapAnki = pkg: pkgs.symlinkJoin {
    name = "anki-wayland";
    paths = [ pkg ];
    nativeBuildInputs = [ pkgs.makeWrapper ];
    postBuild = ''
      wrapProgram $out/bin/anki \
        --set QT_QPA_PLATFORM wayland \
        --set ANKI_WAYLAND 1
    '';
    inherit (pkg) meta;
    passthru = pkg.passthru // {
      withAddons = addons: wrapAnki (pkg.withAddons addons);
    };
  };
in
{
  programs.anki = {
    enable = true;
    package = wrapAnki pkgs.anki;

    language = "ru_RU";
    theme = "followSystem";
    style = "native";
    reduceMotion = true;

    hideTopBar = true;
    hideTopBarMode = "always";

    videoDriver = "opengl"; # vulkan is broken on wayland atm
  };
}

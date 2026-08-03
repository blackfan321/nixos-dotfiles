{ pkgs, ... }:

{
  programs.anki = {
    enable = true;
    package = pkgs.anki;

    language = "ru_RU";
    theme = "followSystem";
    style = "native";
    reduceMotion = true;

    hideTopBar = true;
    hideTopBarMode = "always";

    videoDriver = "opengl"; # vulkan is broken on wayland atm
  };
}

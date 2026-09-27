{ pkgs, ... }:

{
  programs.appimage = {
    enable = true;
    package = pkgs.appimage-run;
    binfmt = true;
  };
}

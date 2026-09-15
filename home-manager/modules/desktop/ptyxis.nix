{ pkgs, ... }:

{
  programs.ptyxis = {
    enable = true;
    package = pkgs.ptyxis;
  };

  dconf.settings."org/gnome/Ptyxis" = {
    use-system-font = false;
    font-name = "JetBrainsMono Nerd Font Mono Semi-Bold 12";
  };
}

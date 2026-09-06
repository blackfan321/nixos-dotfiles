{ pkgs, ... }:

{
  programs.bat = {
    enable = true;
    package = pkgs.bat;
    extraPackages = with pkgs.bat-extras; [
      batwatch
      batdiff
      batgrep
      batpipe
    ];
    config = {
      theme = "OneHalfDark";
    };
  };
}

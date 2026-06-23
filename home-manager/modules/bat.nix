{ pkgs, ... }:

{
  programs.bat = {
    enable = true;
    extraPackages = with pkgs.bat-extras; [
      batwatch
      batdiff
      batgrep
      batpipe
    ];
    config = {
      theme = "OneHalfLight";
      style = "numbers,changes,header";
    };
  };
}

{ pkgs, ... }:

{
  programs.jq = {
    enable = true;
    package = pkgs.jq;

    colors = {
      null = "1;30"; # dim gray
      false = "1;31"; # #C01C28 red
      true = "0;32"; # #26A269 green
      numbers = "0;36"; # #1AA1E0 cyan
      strings = "0;33"; # #E5A50A amber
      arrays = "1;35"; # #9141AC purple
      objects = "1;37"; # bright fg
      objectKeys = "1;34"; # #3584E4 blue
    };
  };
}

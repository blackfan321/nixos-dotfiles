{ pkgs, ... }:
{
  programs.zed-editor = {
    enable = true;
    package = pkgs.zed-editor-fhs;
    extraPackages = [
      pkgs.nixd
      pkgs.nil
    ];
    extensions = [ "nix" ];
  };

}

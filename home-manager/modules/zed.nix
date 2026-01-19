{ pkgs, ... }:

{
  programs.zed-editor = {
    enable = true;
    package = pkgs.zed-editor-fhs;
    extraPackages = with pkgs; [
      nixd
      just-lsp
      helm-ls
      nixfmt
    ];
    extensions = [
      "nix"
      "toml"
      "csv"
      "just"
      "helm"
    ];
  };
}

{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    package = pkgs.neovim-unwrapped;

    defaultEditor = true;
    vimAlias = true;

    initLua = ''
      vim.opt.number = true
    '';
  };
}

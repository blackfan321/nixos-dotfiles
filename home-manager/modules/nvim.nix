{ ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;

    initLua = ''
      vim.opt.number = true
    '';
  };
}

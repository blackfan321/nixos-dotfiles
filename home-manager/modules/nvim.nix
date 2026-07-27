{ ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;

    extraLuaConfig = ''
      vim.opt.number = true
    '';
  };
}

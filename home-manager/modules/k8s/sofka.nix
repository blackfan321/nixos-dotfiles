{ inputs, ... }:
{
  imports = [ inputs.sofka.homeManagerModules.default ];

  programs.sofka = {
    enable = true;
  };
}

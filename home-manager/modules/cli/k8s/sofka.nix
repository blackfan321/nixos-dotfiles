{ inputs, system, ... }:

{
  imports = [ inputs.sofka.homeManagerModules.default ];

  programs.sofka = {
    enable = true;
    package = inputs.sofka.packages.${system}.sofka;
  };
}

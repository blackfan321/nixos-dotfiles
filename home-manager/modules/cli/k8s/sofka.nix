{ inputs, system, ... }:

{
  programs.sofka = {
    enable = true;
    package = inputs.sofka.packages.${system}.sofka;
  };
}

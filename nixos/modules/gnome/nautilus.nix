{ ... }:

{
  # implicitly installs nautilus-python as well
  programs.nautilus-open-any-terminal = {
    enable = true;
    terminal = "ptyxis";
  };
}

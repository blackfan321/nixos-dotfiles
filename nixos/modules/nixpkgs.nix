{ ... }:

{
  nixpkgs.config = {
    allowUnfree = true;
    ## https://github.com/NixOS/nixpkgs/issues/410814
    problems.handlers."gtk+".broken = "warn";
  };
}

{ inputs, ... }:

{
  imports = [
    inputs.voxcribe.homeManagerModules.default
  ];

  programs.voxcribe = {
    enable = true;
    settings = {
      model = "large-v3";
      output = "clipboard";
    };
  };
}

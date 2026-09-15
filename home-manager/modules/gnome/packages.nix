{ pkgs, inputs, system, ... }:

{
  home.packages = with pkgs; [
    morewaita-icon-theme
  ]
  ++
  [
    inputs.text-extractor-ocr.packages.${system}.text-extractor-ocr
    inputs.nautilus-open-in-zed.packages.${system}.nautilus-open-in-zed
  ];
}

{ pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    morewaita-icon-theme
    gnomeExtensions.appindicator
    gnomeExtensions.caffeine
    gnomeExtensions.tiling-assistant
    gnomeExtensions.xwayland-indicator
    gnomeExtensions.notification-timeout
    gnomeExtensions.pip-on-top
    gnomeExtensions.copyous
    gnomeExtensions.text-extractor
    gnomeExtensions.quick-settings-audio-panel
  ]
  ++
  [
    inputs.text-extractor-ocr.packages.${pkgs.system}.text-extractor-ocr
  ];
}

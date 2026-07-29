{ pkgs, inputs, system, ... }:

{
  home.packages = with pkgs; [
    morewaita-icon-theme
    gnomeExtensions.appindicator
    gnomeExtensions.caffeine
    gnomeExtensions.tiling-assistant
    gnomeExtensions.xwayland-indicator
    gnomeExtensions.notification-timeout
    gnomeExtensions.pip-on-top
    gnomeExtensions.text-extractor
    gnomeExtensions.quick-settings-audio-panel
    gnomeExtensions.vicinae
  ]
  ++
  [
    inputs.text-extractor-ocr.packages.${system}.text-extractor-ocr
    inputs.nautilus-open-in-zed.packages.${system}.nautilus-open-in-zed
  ];
}

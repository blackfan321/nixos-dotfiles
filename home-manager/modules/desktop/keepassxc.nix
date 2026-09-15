{ pkgs, ... }:

{
  programs.keepassxc = {
    enable = true;
    package = pkgs.keepassxc;
  };

  # TODO: declarative settings

  programs.zen-browser.nativeMessagingHosts = [ pkgs.keepassxc ];
}

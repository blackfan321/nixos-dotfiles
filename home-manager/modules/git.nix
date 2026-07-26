{ username, pkgs, config, ... }:

{
  programs.git = {
    enable = true;
    package = pkgs.gitFull;
    settings = {
      user.name = "Ivan Batrakov";
      user.email = "${username}@gmail.com";
    };
    signing = {
      format = "ssh";
      key = "${config.home.homeDirectory}/.ssh/id_ed25519.pub";
      signByDefault = true;
    };
  };
}

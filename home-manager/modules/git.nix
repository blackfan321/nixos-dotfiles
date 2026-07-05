{ username, pkgs, ... }:

{
  programs.git = {
    enable = true;
    package = pkgs.gitFull;
    settings = {
      user.name = "Ivan Batrakov";
      user.email = "${username}@gmail.com";
    };
  };
}

{ pkgs, username, ... }:

{
  users = {
    defaultUserShell = pkgs.zsh;
    users.${username} = {
      isNormalUser = true; # create & set home directory, add users group, etc.
      description = "Ivan Batrakov";
    };
  };
}

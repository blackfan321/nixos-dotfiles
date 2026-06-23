{ username, ... }:

{
  programs.git = {
    enable = true;
    settings = {
      user.name = "Ivan Batrakov";
      user.email = "${username}@gmail.com";
    };
  };
}

{ username, pkgs, lib, ... }:

let
  key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIb9Kz8Qk/wpiqut9p0lQEvpdcq530jxr/fbarl1nixz";
in
{
  programs.git = {
    enable = true;
    package = pkgs.gitFull;

    settings = {
      user.name = "Ivan Batrakov";
      user.email = "${username}@gmail.com";
      core.editor = "re.sonny.Commit";
      credential.helper = "libsecret";
    };

    signing = {
      inherit key;
      format = "ssh";
      signByDefault = true;
      allowedSigners = ''
        ${username}@gmail.com namespaces="git" ${key}
      '';
    };
  };

  xdg.configFile."git/config" = {
    force = true;
    text = lib.mkAfter ''

      [re.sonny.Commit]
      	title-length-hint = 50
      	body-length-wrap = 72
      	auto-capitalize-title = false
    '';
  };
}

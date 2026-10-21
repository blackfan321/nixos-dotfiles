{ self, pkgs, lib, ... }:

let
  personal = import "${self}/secrets/git/personal.nix";
  ugsk = import "${self}/secrets/git/ugsk.nix";
in
{
  programs.git = {
    enable = true;
    package = pkgs.gitFull;

    settings = {
      user.name = personal.name;
      user.email = personal.email;
      core.editor = "re.sonny.Commit";
      credential.helper = "libsecret";
    };

    signing = {
      key = personal.signingKey;
      format = "ssh";
      signByDefault = true;
      allowedSigners = ''
        ${personal.email} namespaces="git" ${personal.signingKey}
        ${ugsk.email} namespaces="git" ${ugsk.signingKey}
      '';
    };

    # Work config
    includes = [
      {
        condition = "gitdir:~/Projects/UGSK/";
        contents = {
          user.name = ugsk.name;
          user.email = ugsk.email;
          user.signingKey = ugsk.signingKey;
        };
      }
    ];
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

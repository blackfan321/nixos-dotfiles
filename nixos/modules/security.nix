{ username, ... }:

{
  security = {
    sudo.enable = false; # sudo sucks
    doas = {
      enable = true;
      extraRules = [
        {
          users = [ "${username}" ];
          keepEnv = true;
          persist = true;
        }
      ];
    };
  };
}

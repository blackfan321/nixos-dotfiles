{
  security = {
    sudo.enable = false; # sudo sucks
    doas = {
      enable = true;
      extraRules = [
        {
          users = [ "blackfan321" ];
          keepEnv = true;
          persist = true;
        }
      ];
    };
  };
}

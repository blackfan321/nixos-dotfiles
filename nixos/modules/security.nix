{
  security = {
    sudo.enable = false; # sudo sucks
    run0 = {
      enable = true;
      persistentAuth.enable = true;
      wheelNeedsPassword = true;
    };
  };
}

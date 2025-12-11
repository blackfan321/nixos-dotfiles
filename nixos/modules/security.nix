{
  security.sudo.enable = false; 
  security.doas.enable = true;
  security.doas.extraRules = [
    {
      users = [ "blackfan321" ];
      keepEnv = true;
      persist = true;
    }
  ];
}

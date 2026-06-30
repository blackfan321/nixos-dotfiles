{
  virtualisation.docker = {
    enable = true;

    autoPrune = {
      enable = true;
      dates = "*-*-1/3 23:00";
    };
  };
}

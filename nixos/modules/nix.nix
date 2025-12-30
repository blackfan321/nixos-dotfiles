{
  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
    };
    gc = {
      automatic = true;
      dates = [ "22:00" ];
      options = "--delete-older-than 7d";
    };
    optimise = {
      automatic = true;
      dates = [ "22:30" ];
    };
  };
}

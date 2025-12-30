{
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;

      preload = [ 
        "$HOME/Pictures/Backgrounds/Tahoe-Dark.png"
      ];
 
      wallpaper = [
        "DP-2,$HOME/Pictures/Backgrounds/Tahoe-Dark.png"
      ];
    };
  };

}

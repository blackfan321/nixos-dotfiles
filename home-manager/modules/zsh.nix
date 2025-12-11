{ config, ... }: {

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      nixedit = "doas vim /etc/nixos";    
      nixrebuild = "doas nixos-rebuild switch";
      hmedit = "vim ~/.config/home-manager";
      hmrebuild = "home-manager switch";
      ff = "fastfetch";
      v = "vim";
    }; 

    history.size = 10000;
    history.path = "${config.xdg.dataHome}/zsh/history";

    initExtra = ''
      # Start UWSM
      if uwsm check may-start; then
        exec uwsm start hyprland-uwsm.desktop
      fi

      source <(fzf --zsh)
    '';
  };

}

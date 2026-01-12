{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    antidote = {
      enable = true;
      plugins = [
        "ael-code/zsh-colored-man-pages"
        "KKRainbow/zsh-command-note.plugin"
        "urbainvaes/fzf-marks"
        "MichaelAquilina/zsh-auto-notify"
      ];
    };

    shellAliases = {
      nixedit = "doas vim /etc/nixos";
      nixrebuild = "doas nixos-rebuild switch";
      hmedit = "vim ~/.config/home-manager";
      hmrebuild = "home-manager switch -b backup";
    };

    history.size = 10000;

    initContent = ''
      PROMPT='%F{green}%n@%m%f %F{blue}%~%f > '
      export GROFF_NO_SGR=1
    '';
  };
}

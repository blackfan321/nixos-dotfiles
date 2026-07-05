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
        "urbainvaes/fzf-marks"
        "MichaelAquilina/zsh-auto-notify"
      ];
    };

    history.size = 10000;

    shellAliases = {
      run0 = "command run0 --background=";
    };

    initContent = ''
      PROMPT='%F{green}%n@%m%f %F{blue}%~%f > '
      export GROFF_NO_SGR=1

      bindkey '^A' beginning-of-line
      bindkey '^E' end-of-line
    '';
  };
}

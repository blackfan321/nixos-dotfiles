{ pkgs, config, ... }:

{
  programs.zsh = {
    enable = true;
    package = pkgs.zsh;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    # TODO: add theming

    antidote = {
      enable = true;
      package = pkgs.antidote;
      useFriendlyNames = true;
      plugins = [
        "ael-code/zsh-colored-man-pages"
        "urbainvaes/fzf-marks"
        "MichaelAquilina/zsh-auto-notify"
      ];
    };

    history = {
      share = true;
      append = true;
      ignoreSpace = true;
      extended = true;
    };

    shellAliases = {
      run0 = "command run0 --background=";
      wget = "wget2";
    };

    localVariables = {
      PROMPT = "%F{green}%n@%m%f %F{blue}%~%f > ";
    };

    sessionVariables = {
      GROFF_NO_SGR = "1";
      FZF_MARKS_FILE = "${config.xdg.dataHome}/fzf-marks";
    };

    initContent = ''
      bindkey '^A' beginning-of-line
      bindkey '^E' end-of-line
    '';
  };
}

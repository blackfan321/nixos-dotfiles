{ pkgs, config, ... }:

{
  programs.zsh = {
    enable = true;
    package = pkgs.zsh;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    autocd = true;

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
      bc = "bc -lq";
      k = "kubectl";
      ports = "run0 netstat -tulpn";
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

      # zed-editor-fhs hides /etc/subuid so rootless podman breaks; escape via run0
      # --background= : no privilege tint (same as run0 alias)
      # -D "$PWD"     : keep cwd (-u alone drops you in $HOME)
      if [[ -e /.host-etc/subuid && ! -e /etc/subuid ]]; then
        podman() { command run0 --background= -D "$PWD" -u "$USER" podman "$@"; }
        docker() { command run0 --background= -D "$PWD" -u "$USER" podman "$@"; }
      fi
    '';
  };
}

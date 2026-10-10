{ inputs, system, lib, ... }:

{
  home.packages = [ inputs.wfetch.packages.${system}.wfetch ];

  programs.zsh = {
    initContent = lib.mkAfter ''
      wfetch() {
        command ${inputs.wfetch.packages.${system}.wfetch}/bin/wfetch \
          --challenge \
          --challenge-timestamp "$(stat -c '%W' /nix)" \
          --challenge-years 5 \
          --challenge-type nix \
          "$@"
      }

      if [[ -o interactive ]]; then
        wfetch
      fi
    '';
  };
}

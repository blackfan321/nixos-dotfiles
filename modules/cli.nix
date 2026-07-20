{ ... }:

{
  den.aspects.cli = { ... }: {
    nixos = { pkgs, ... }: {
      environment.systemPackages = with pkgs; [
        doggo
        wget
        killall
        htop
        file
        unzip
        unixtools.netstat
        inetutils
        pciutils
        mtr
        git-crypt
      ];

      programs = {
        nano.enable = false; # nano sucks
        nix-ld.enable = true;
      };
    };

    homeManager = { pkgs, inputs, ... }: {
      home.packages =
        with pkgs;
        [
          bc
          dysk
          just
          libnotify
          asciinema
          dive
          caligula
          sshuttle
          tldr
          fd
          sd
          ripgrep
          sqlite
          tokei
          bandwhich
          broot
          jq
          yq
          btop
          tree
          hwinfo
          prek
          onefetch
        ]
        ++ [
          inputs.steam-platform-stats.packages.${pkgs.system}.steam-platform-stats
        ];
    };
  };
}

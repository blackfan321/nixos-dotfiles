{ pkgs, inputs, system, ... }:

{
  programs.steam.config.nonSteamApps = {
    "Prism Launcher" = {
      seed = "prismlauncher";
      target = pkgs.prismlauncher;
      launchOptions.wrappers = [ "gamemoderun" ];
      artwork = {
        icon = pkgs.fetchurl {
          url = "https://cdn2.steamgriddb.com/icon/bb8bf48a4f86fb1a77d0d0953d87958e.png";
          hash = "sha256-Kp+0iidypZdcCWLnu1QmzqtB/G+oXlvf6nUsZp/nFGc=";
        };
        cover = pkgs.fetchurl {
          url = "https://cdn2.steamgriddb.com/grid/c4626abae9280456d8dd7ea8f518af7c.png";
          hash = "sha256-Iji4R79l/O8yjEwaw0cqZdsY82z2c8SIYxrDSxC6vOM=";
        };
        hero = pkgs.fetchurl {
          url = "https://cdn2.steamgriddb.com/hero/77fd1d4f4e2edb4384e207a1ab551f9f.png";
          hash = "sha256-tdg3VaLyP9RFMHQmyVo8DaYcjKByRQQh+0b3Om/3GtM=";
        };
        logo = pkgs.fetchurl {
          url = "https://cdn2.steamgriddb.com/logo/4e43d1f5709b2bdd5a0c7a5bcb529991.png";
          hash = "sha256-jHt+WNgwd2RNho6i1jwdYXeJWgwCcgX3/1+lWLranGY=";
        };
      };
    };

    "Hytale" = {
      seed = "hytale";
      target = inputs.hytale-launcher.packages.${system}.hytale-launcher;
      launchOptions.wrappers = [ "gamemoderun" ];
      artwork = {
        icon = pkgs.fetchurl {
          url = "https://cdn2.steamgriddb.com/icon/12bb430be526cebb26b7248683b51fab.png";
          hash = "sha256-QmIb1fx1hktRJwoazbqIk4EDxrQibx6/5vsMBId2fmA=";
        };
        cover = pkgs.fetchurl {
          url = "https://cdn2.steamgriddb.com/grid/24d5d9de8fd0f989a622c597d4bb036b.png";
          hash = "sha256-HOhKUk52ZVXCdeC+IJvln4piGOKl6HBqKVBEXtI/GlA=";
        };
        hero = pkgs.fetchurl {
          url = "https://cdn2.steamgriddb.com/hero/f9502a4e2c9cb33351220ddd8ac39da5.png";
          hash = "sha256-RPwr9rWO+cyuSVmhUaq1ptJtwU+HH5RdLM+pxPfa598=";
        };
        logo = pkgs.fetchurl {
          url = "https://cdn2.steamgriddb.com/logo/0e253041de725c9e8175639f2f7b4fc8.png";
          hash = "sha256-S0OP0Ntj9p9M3WE55OvXvnuk8LKbfZ9/TDRdANQjeHk=";
        };
      };
    };
  };
}

{ pkgs, ... }:

{
  programs.steam.config.nonSteamApps = {
    "Prism Launcher" = {
      seed = "prismlauncher";
      target = pkgs.prismlauncher;
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
  };
}

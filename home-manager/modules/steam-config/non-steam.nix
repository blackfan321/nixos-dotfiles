{ pkgs, inputs, system, ... }:

{
  programs.steam.config.nonSteamApps = {
    "Prism Launcher" = {
      seed = "prismlauncher";
      target = pkgs.prismlauncher;
      wrappers = [ "gamemoderun" ];
      artwork = {
        icon = pkgs.fetchurl {
          url = "https://cdn2.steamgriddb.com/icon/bb8bf48a4f86fb1a77d0d0953d87958e.png";
          hash = "sha256-Kp+0iidypZdcCWLnu1QmzqtB/G+oXlvf6nUsZp/nFGc=";
        };
        cover = pkgs.fetchurl {
          url = "https://cdn2.steamgriddb.com/grid/c4626abae9280456d8dd7ea8f518af7c.png";
          hash = "sha256-Iji4R79l/O8yjEwaw0cqZdsY82z2c8SIYxrDSxC6vOM=";
        };
        header = pkgs.fetchurl {
          url = "https://cdn2.steamgriddb.com/grid/e1e13e230874060d4397c0b1680b1a6f.png";
          hash = "sha256-/pBvK4YAlvEfv7eOct+dw15KMYwQjM58bu78eFFP+Fo=";
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
      wrappers = [ "gamemoderun" ];
      artwork = {
        icon = pkgs.fetchurl {
          url = "https://cdn2.steamgriddb.com/icon/12bb430be526cebb26b7248683b51fab.png";
          hash = "sha256-QmIb1fx1hktRJwoazbqIk4EDxrQibx6/5vsMBId2fmA=";
        };
        cover = pkgs.fetchurl {
          url = "https://cdn2.steamgriddb.com/grid/24d5d9de8fd0f989a622c597d4bb036b.png";
          hash = "sha256-HOhKUk52ZVXCdeC+IJvln4piGOKl6HBqKVBEXtI/GlA=";
        };
        header = pkgs.fetchurl {
          url = "https://cdn2.steamgriddb.com/grid/4dfc3a04ca3550205f7414469154c2e1.png";
          hash = "sha256-SkGPqvhLAFetlk7FVJOVOU81JpDh8RNogE+2QFmbhPI=";
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

    "Vintage Story" = {
      seed = "vintagestory";
      target = pkgs.vintagestory;
      wrappers = [ "gamemoderun" ];
      artwork = {
        icon = pkgs.fetchurl {
          url = "https://cdn2.steamgriddb.com/icon/5db1317ed8f7ef0ea3e1398608b608f2.png";
          hash = "sha256-DbxY3b9EPPMiabIVgqksT90h6y8t596BbNDlHeGe20Y=";
        };
        cover = pkgs.fetchurl {
          url = "https://cdn2.steamgriddb.com/grid/3346a6d8537b1bb22d58f279368e0728.png";
          hash = "sha256-PIg5eWicRcQ8RPvk9fp+yQYB1PrnoEGpVT+/h8n4OhU=";
        };
        header = pkgs.fetchurl {
          url = "https://cdn2.steamgriddb.com/grid/60f4bacddeef710675c768a57768844c.png";
          hash = "sha256-nAmErlPzmDhv3DIbKmmBNlmmahiIghaiZhCY/VR9i/E=";
        };
        hero = pkgs.fetchurl {
          url = "https://cdn2.steamgriddb.com/hero/dd698f947326ec5d181520df8f85ba20.png";
          hash = "sha256-9vIMhxhtgxqPNoYEuyXdXYw1+QALBU5OZRvjdfGP0mA=";
        };
        logo = pkgs.fetchurl {
          url = "https://cdn2.steamgriddb.com/logo/c4ceb72ec3f041dfca7cadb443fdc873.png";
          hash = "sha256-5WQVNw5IxA+bqKPq6I2d0B/uRwh6WkuuGHtn2WC77Es=";
        };
      };
    };
  };
}

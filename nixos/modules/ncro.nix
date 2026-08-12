{ inputs, system, lib, ... }:

{
  imports = [
    inputs.ncro.nixosModules.default
  ];

  services.ncro = {
    enable = true;
    package = inputs.ncro.packages.${system}.ncro;

    settings = {
      server.listen = ":7777";
      logging.timestamps = false;

      upstreams = [
        {
          # nixpkgs (RU mirror)
          url = "https://mirror.yandex.ru/nixos";
          priority = 10;
          public_key = "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=";
        }
        {
          # nixpkgs
          url = "https://cache.nixos.org";
          priority = 20;
          public_key = "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=";
        }
        {
          # unfree packages
          url = "https://nix-community.cachix.org";
          priority = 30;
          public_key = "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs=";
        }
        {
          # CachyOS kernel
          url = "https://attic.xuyh0120.win/lantian";
          priority = 40;
          public_key = "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc=";
        }
        {
          # CachyOS kernel (backup mirror)
          url = "https://cache.xinux.uz";
          priority = 50;
          public_key = "cache.xinux.uz:BXCrtqejFjWzWEB9YuGB7X2MV4ttBur1N8BkwQRdH+0=";
        }
      ];
    };
  };

  nix.settings = {
    substituters = lib.mkForce [ "http://127.0.0.1:7777" ];
    trusted-substituters = lib.mkForce [ "http://127.0.0.1:7777" ];
  };
}

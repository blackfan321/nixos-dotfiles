{
  description = "NixOS + Home Manager dotfiles";

  nixConfig = {
    warn-dirty = false;
    substituters = [
      "https://cache.nixos.org"              # nixpkgs
      "https://mirror.yandex.ru/nixos"       # nixpkgs (RU mirror)
      "https://nix-community.cachix.org"
      "https://attic.xuyh0120.win/lantian"   # cachyos kernel
      # "https://cache.xinux.uz"               # cachyos kernel (mirror)
      "https://cache.garnix.io"
      "https://vicinae.cachix.org"           # vicinae
    ];
    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "cache.xinux.uz:BXCrtqejFjWzWEB9YuGB7X2MV4ttBur1N8BkwQRdH+0="
      "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc="
      "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
      "vicinae.cachix.org-1:1kDrfienkGHPYbkpNj1mWTr7Fm1+zcenzgTizIcI3oc="
    ];
  };

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    git-hooks = {
      url = "github:cachix/git-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-gen = {
      url = "github:htelsiz/nix-gen";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    import-tree = {
      url = "github:denful/import-tree";
    };
    cachyos-kernel = {
      url = "github:xddxdd/nix-cachyos-kernel/release";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    hytale-launcher = {
      url = "github:JPyke3/hytale-launcher-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    networkmanager-amneziawg = {
      url = "github:Exeteres/wg-feed";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    vicinae = {
      url = "github:vicinaehq/vicinae";
    };
    vicinae-extensions = {
      url = "github:vicinaehq/extensions";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.vicinae.follows = "vicinae";
    };
    nautilus-open-in-zed = {
      url = "github:blackfan321/nautilus-open-in-zed";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    steam-config-nix = {
      url = "github:different-name/steam-config-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    express-messenger = {
      url = "github:blackfan321/express-messenger-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    loop-messenger = {
      url = "github:blackfan321/loop-messenger-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ktalk = {
      url = "github:blackfan321/ktalk-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    steam-platform-stats = {
      url = "github:blackfan321/steam-platform-stats";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    text-extractor-ocr = {
      url = "github:blackfan321/text-extractor-ocr-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      git-hooks,
      ...
    }@inputs:
    let
      username = "blackfan321";
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      checks.${system}.prek = git-hooks.lib.${system}.run {
        src = self;
        package = pkgs.prek;
        hooks = {
          deadnix.enable = true;
          deadnix.priority = 1;

          statix.enable = true;
          statix.priority = 2;
        };
      };

      devShells.${system}.default = pkgs.mkShell {
        inherit (self.checks.${system}.prek) shellHook;
        buildInputs = self.checks.${system}.prek.enabledPackages;
      };

      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs username self; };
        modules = [
          ./nixos/configuration.nix

          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = { inherit inputs username; };
              backupFileExtension = "hm-bak";
              users.${username} = ./home-manager/home.nix;
            };
          }
        ];
      };
    };
}

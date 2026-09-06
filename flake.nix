{
  description = "blackfan321's NixOS dotfiles";

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
      url = "github:htelsiz/nix-gen/v0.3.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    import-tree = {
      url = "github:denful/import-tree";
    };
    cachyos-kernel = {
      url = "github:xddxdd/nix-cachyos-kernel/release";
    };
    ncro = {
      url = "github:manic-systems/ncro/v2.2.2";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
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
      url = "github:blackfan321/wg-feed";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nautilus-open-in-zed = {
      url = "github:blackfan321/nautilus-open-in-zed";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    steam-config-nix = {
      url = "github:different-name/steam-config-nix/v0.6.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    steamfetch = {
      url = "github:unhappychoice/steamfetch/v0.5.6";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    prismnix = {
      url = "github:qacow37/prismnix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    express-messenger = {
      url = "github:blackfan321/express-messenger-nix/3.72.37";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    loop-messenger = {
      url = "github:blackfan321/loop-messenger-nix/6.0.3";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ktalk = {
      url = "github:blackfan321/ktalk-nix/3.7.1";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    steam-platform-stats = {
      url = "github:blackfan321/steam-platform-stats/0.4.1";
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
        specialArgs = { inherit inputs username self system; };
        modules = [
          ./nixos/configuration.nix

          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = { inherit inputs username system; };
              backupFileExtension = "hm-bak";
              users.${username} = ./home-manager/home.nix;
            };
          }
        ];
      };
    };
}

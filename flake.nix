{
  description = "blackfan321's NixOS dotfiles";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs-patcher = {
      url = "github:gepbird/nixpkgs-patcher";
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
      inputs.flake-parts.follows = "flake-parts";
    };
    ncro = {
      url = "github:manic-systems/ncro/v2.3.0";
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
    # hytale-launcher = {
    #   url = "github:JPyke3/hytale-launcher-nix";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    networkmanager-amneziawg = {
      url = "github:Exeteres/wg-feed";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    steam-config-nix = {
      url = "github:different-name/steam-config-nix/v0.6.0";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };
    steamfetch = {
      url = "github:unhappychoice/steamfetch/v0.5.6";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    prism-launcher = {
      url = "github:qacow37/prismnix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    sofka = {
      url = "github:nklmilojevic/sofka/v0.31.0";
      inputs.home-manager.follows = "home-manager";
    };

    # ── my own flakes ──
    express-messenger = {
      url = "github:blackfan321/express-messenger-nix/3.74.36";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
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
    nautilus-open-in-zed = {
      url = "github:blackfan321/nautilus-open-in-zed";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # ── nixpkgs patches ──
    # nixpkgs-patch-throne-1-3-1 = {
    #   url = "https://github.com/NixOS/nixpkgs/pull/566708.diff";
    #   flake = false;
    # };
  };

  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [ (inputs.import-tree ./flake) ];
      systems = [ "x86_64-linux" ];
    };
}

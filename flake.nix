{
  description = "blackfan321's NixOS dotfiles";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs?ref=nixos-unstable";
    };
    detsys-nix = {
      url = "github:DeterminateSystems/nix-src?ref=v3.24.2";
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
      url = "github:htelsiz/nix-gen?ref=v0.3.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    import-tree = {
      url = "github:denful/import-tree?ref=v0.3.0";
    };
    cachyos-kernel = {
      url = "github:xddxdd/nix-cachyos-kernel?ref=release";
      # don't follow nixpkgs to use the cache
      inputs.flake-parts.follows = "flake-parts";
    };
    ncro = {
      url = "github:manic-systems/ncro?ref=v2.4.0";
      # don't follow nixpkgs — build with ncro's own pinned toolchain
    };
    nix-update-git = {
      url = "github:yuxqiu/nix-update-git?ref=v0.7.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # nix-proxy-manager = {
    #   url = "github:aleadag/nix-proxy-manager";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    steam-config-nix = {
      url = "github:different-name/steam-config-nix?ref=v0.6.0";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };
    steamfetch = {
      url = "github:unhappychoice/steamfetch?ref=v0.5.6";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    prism-launcher = {
      url = "github:qacow37/prismnix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    sofka = {
      url = "github:nklmilojevic/sofka?ref=v0.34.0";
      # don't follow nixpkgs to use the cache
      inputs.home-manager.follows = "home-manager";
    };
    wfetch = {
      url = "github:iynaix/wfetch";
      # don't follow nixpkgs to use the cache
      inputs.flake-parts.follows = "flake-parts";
    };
    proton-ge = {
      url = "github:daluca/proton-ge-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
      inputs.flake-parts.follows = "flake-parts";
      inputs.git-hooks.follows = "git-hooks";
      inputs.import-tree.follows = "import-tree";
    };
    voxcribe = {
      url = "git+ssh://git@gitea.apollo-kitten.space:359/voxcribe/voxcribe.git";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
      inputs.git-hooks.follows = "git-hooks";
      inputs.import-tree.follows = "import-tree";
    };
    # horizon-launcher = {
    #   url = "github:Granddave/horizon-launcher.nix";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    # ── my own flakes ──
    express-messenger = {
      url = "github:blackfan321/express-messenger-nix?ref=3.76.74";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
      inputs.git-hooks.follows = "git-hooks";
      inputs.import-tree.follows = "import-tree";
    };
    loop-messenger = {
      url = "github:blackfan321/loop-messenger-nix?ref=6.0.4";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
      inputs.git-hooks.follows = "git-hooks";
      inputs.import-tree.follows = "import-tree";
    };
    ktalk = {
      url = "github:blackfan321/ktalk-nix?ref=3.8.0";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
      inputs.git-hooks.follows = "git-hooks";
      inputs.import-tree.follows = "import-tree";
    };
    steam-platform-stats = {
      url = "github:blackfan321/steam-platform-stats?ref=main";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
      inputs.git-hooks.follows = "git-hooks";
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
    nixpkgs-patch-anki-tomlkit = {
      url = "https://github.com/NixOS/nixpkgs/pull/584713.diff";
      flake = false;
    };
  };

  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [ (inputs.import-tree ./flake) ];
      systems = [ "x86_64-linux" ];
    };
}

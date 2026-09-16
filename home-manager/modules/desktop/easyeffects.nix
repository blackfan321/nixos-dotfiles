{ pkgs, ... }:

let
  presets = pkgs.fetchFromGitHub {
    owner = "JackHack96";
    repo = "EasyEffects-Presets";
    rev = "dd966e41ad9e44d4b11e19047f526ba718bbbe57";
    hash = "sha256-JpQVWuEokBRu01xkGA22dPeV5Jo8Xzvfrg5oQ8RtIrI=";
  };
in
{
  services.easyeffects = {
    enable = true;
    package = pkgs.easyeffects;
    preset = "Perfect EQ";
  };

  xdg.dataFile."easyeffects/output/Perfect EQ.json".source =
    "${presets}/Perfect EQ.json";
}

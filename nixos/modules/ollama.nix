{ pkgs, ... }:

{
  services.ollama = {
    enable = true;
    package = pkgs.ollama-rocm;
    loadModels = [
      "hf.co/adilkairolla/zeta-2.1-GGUF:Q8_0"
    ];
  };
}

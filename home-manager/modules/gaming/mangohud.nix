{ pkgs, ... }:

{
  programs.mangohud = {
    enable = true;
    package = pkgs.mangohud;

    settings = {
      # FPS / frametime
      fps = true;
      frametime = true;
      frame_timing = true;
      dynamic_frame_timing = true;
      fps_metrics = [ "avg" "0.01" "0.1" "1" ];

      # CPU
      cpu_stats = true;
      cpu_temp = true;
      cpu_mhz = true;
      cpu_power = true;
      cpu_load_change = true;

      # GPU (card1 = Navi dGPU; card0 = Raphael iGPU)
      gpu_stats = true;
      gpu_temp = true;
      gpu_core_clock = true;
      gpu_mem_clock = true;
      gpu_power = true;
      gpu_power_limit = true;
      gpu_load_change = true;
      throttling_status = true;
      throttling_status_graph = true;
      gpu_list = [ 1 ];

      # Memory
      vram = true;
      ram = true;

      # Runtime / wrappers
      gamemode = true;
      vulkan_driver = true;
      wine = true;
      engine_version = true;

      # Overlay
      position = "top-left";
      font_size = 24;
      background_alpha = 0.4;
      toggle_hud = "Shift_R+F12";
    };
  };
}

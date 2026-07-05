{
  boot.loader = {
    timeout = 15;
    systemd-boot = {
      enable = true;
      configurationLimit = 10;
      memtest86.enable = true;
      windows = {
        "windows" = {
          title = "Windows 11";
          efiDeviceHandle = "HD0b";
        };
      };
    };
    efi.canTouchEfiVariables = true;
  };
}

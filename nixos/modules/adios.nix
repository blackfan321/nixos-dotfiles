{
  # ADIOS block scheduler on NVMe drives (available in cachyos kernel)
  services.udev.extraRules = ''
    ACTION=="add|change", SUBSYSTEM=="block", KERNEL=="nvme*", ATTR{queue/scheduler}="adios"
  '';
}

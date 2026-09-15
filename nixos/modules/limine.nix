{ pkgs, ... }:

let
  resolution = "3440x1440";
  windowsEspGuid = "50c09ef9-11c9-45b5-8fc8-805ff09e4924";
in
{
  boot.loader = {
    timeout = 30;

    limine = {
      enable = true;
      package = pkgs.limine;

      enableEditor = false;
      maxGenerations = 10;

      inherit resolution;

      extraInstallCommands = ''
        sed -i 's|^/+NixOS default profile$|/+NixOS|' /boot/limine/limine.conf
      '';

      additionalFiles = {
        "efi/memtest86/BOOTX64.efi" = "${pkgs.memtest86-efi}/BOOTX64.efi";
        "efi/memtest86/unifont.bin" = "${pkgs.memtest86-efi}/unifont.bin";
        "efi/memtest86/mt86.png" = "${pkgs.memtest86-efi}/mt86.png";
        "efi/memtest86/blacklist.cfg" = "${pkgs.memtest86-efi}/blacklist.cfg";
        # TODO: add UEFI Shell
      };

      style = {
        wallpapers = [ ../../assets/boot-wallpaper.png ];
        wallpaperStyle = "stretched";
        backdrop = "05070A";

        interface = {
          inherit resolution;
          helpHidden = true;
          brandingColor = "3A7BD5";
          helpColor = "5BA3D9";
          helpColorBright = "8B2323";
        };

        graphicalTerminal = {
          font.scale = "2x2";
          foreground = "D1D9E1";
          background = "990A0D14";
          brightForeground = "E8EEF4";
          brightBackground = "773A7BD5";
          palette = "0A0D14;8B2323;2A6B5A;C9A227;3A7BD5;6B4C8A;5BA3D9;B8C0C8";
          brightPalette = "1A2B44;C04040;3D9B7A;E5C04A;62A0EA;9B6BB5;73C2FB;E8EEF4";
          margin = 0;
          marginGradient = 0;
        };
      };

      extraEntries = ''
        /Windows 11
            protocol: efi
            path: guid(${windowsEspGuid}):/EFI/Microsoft/Boot/bootmgfw.efi

        /MemTest86
            protocol: efi
            path: boot():/efi/memtest86/BOOTX64.efi
      '';
    };
  };
}

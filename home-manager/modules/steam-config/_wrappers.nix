{ pkgs, ... }:

{
  # GNOME HDR on → command → HDR off
  hdrHook = pkgs.writers.writePython3Bin "hdr-hook" {
    flakeIgnore = [ "E501" ];
  } ''
    import subprocess
    import sys

    MONITOR = "DP-2"
    MODE = "3440x1440@170.000+vrr"
    GDCTL = "${pkgs.mutter}/bin/gdctl"
    NOTIFY_SEND = "${pkgs.libnotify}/bin/notify-send"

    monitor_args = [
        "--logical-monitor",
        "--primary",
        "--monitor",
        MONITOR,
        "--mode",
        MODE,
    ]


    def notify(text: str) -> None:
        subprocess.run([NOTIFY_SEND, text], check=False)


    def set_color_mode(color_mode: str) -> bool:
        result = subprocess.run(
            [GDCTL, "set", *monitor_args, "--color-mode", color_mode],
            check=False,
        )
        return result.returncode == 0


    def main() -> int:
        if len(sys.argv) < 2:
            notify("hdr-hook: missing command")
            return 1

        hdr_enabled = set_color_mode("bt2100")
        if hdr_enabled:
            notify("HDR enabled")
        else:
            notify("hdr-hook: failed to enable HDR; launching in SDR")

        try:
            return subprocess.run(sys.argv[1:], check=False).returncode
        finally:
            if hdr_enabled and set_color_mode("default"):
                notify("SDR enabled")


    raise SystemExit(main())
  '';
}

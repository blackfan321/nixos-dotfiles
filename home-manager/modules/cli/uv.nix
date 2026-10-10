{ config, pkgs, ... }:

{
  programs.uv = {
    enable = true;
    package = pkgs.uv;

    settings = {
      python-preference = "only-managed";
      python-downloads = "manual";
    };

    python = {
      versions = [
        "3.13"
        "3.14"
      ];
      default = [ "3.14" ];
      prune = true;
    };

    tool = {
      packages = [
        "argcomplete"
        "datamodel-code-generator"
        "complexipy"
      ];
      prune = true;
    };
  };

  systemd.user.services.uv-cache-clean = {
    Unit.Description = "Clean uv package cache";
    Service = {
      Type = "oneshot";
      ExecStart = "${config.programs.uv.package}/bin/uv cache clean";
    };
  };

  systemd.user.timers.uv-cache-clean = {
    Unit.Description = "Weekly uv cache clean";
    Timer = {
      OnCalendar = "weekly";
      Persistent = true;
      RandomizedDelaySec = "1h";
    };
    Install.WantedBy = [ "timers.target" ];
  };
}

{ config, lib, ... }:

let
  mangaDir = "${config.home.homeDirectory}/Documents/Manga";
  downloadsDir = "${mangaDir}/_downloads";
  puid = "1000";
  pgid = "100";
in
{
  home.activation.uchiyomiDirs = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    mkdir -p ${lib.escapeShellArg mangaDir} ${lib.escapeShellArg downloadsDir}
  '';

  programs.zsh.shellAliases = {
    uchiyomi-start = "systemctl --user start podman-uchiyomi.service";
    uchiyomi-stop = "systemctl --user stop podman-uchiyomi.service";
    uchiyomi-status = "systemctl --user status podman-uchiyomi.service";
  };

  services.podman = {
    networks.uchiyomi_app = {
      driver = "bridge";
      autoStart = false;
    };

    containers = {
      uchiyomi = {
        image = "ghcr.io/angelosha/uchiyomi:v0.28.1";
        description = "Uchiyomi manga server";
        autoStart = false;
        network = [ "uchiyomi_app.network" ];
        ports = [ "8888:3000" ];
        extraPodmanArgs = [ "--userns=keep-id" ];
        environment = {
          PUID = puid;
          PGID = pgid;
          NODE_ENV = "production";
          PORT = "3000";
          LIBRARY_BACKEND = "owned";
          PUBLIC_ORIGIN = "http://localhost:8888";
          FLARESOLVERR_URL = "http://uchiyomi-flaresolverr:8191";
          SOURCES_DIR = "/sources";
          CUSTOM_SITES_FILE = "/config/sites.json";
          BACKUP_KEEP = "14";
          SUWAYOMI_URL = "http://uchiyomi-suwayomi:4567";
          SUWAYOMI_MAX_SOURCES = "25";
        };
        volumes = [
          "${mangaDir}:/library"
          "${downloadsDir}:/library-dl"
          "uchiyomi_data:/data"
          "uchiyomi_config:/config"
          "uchiyomi_cache:/cache"
          "uchiyomi_backups:/backups"
        ];
        extraConfig = {
          Unit = {
            Wants = [
              "podman-uchiyomi-flaresolverr.service"
              "podman-uchiyomi-suwayomi.service"
            ];
            After = [
              "podman-uchiyomi-flaresolverr.service"
              "podman-uchiyomi-suwayomi.service"
            ];
          };
          Service.TimeoutStopSec = 40;
        };
      };

      uchiyomi-flaresolverr = {
        image = "ghcr.io/flaresolverr/flaresolverr:v3.5.0";
        description = "FlareSolverr for Uchiyomi";
        autoStart = false;
        network = [ "uchiyomi_app.network" ];
        environment.LOG_LEVEL = "warning";
        extraPodmanArgs = [
          "--shm-size=1g"
          "--memory=2g"
        ];
        extraConfig = {
          Unit.PartOf = [ "podman-uchiyomi.service" ];
          Container = {
            HealthCmd = "curl -fsS http://127.0.0.1:8191/ | grep -q 'FlareSolverr is ready' || exit 1";
            HealthInterval = "60s";
            HealthTimeout = "10s";
            HealthRetries = 3;
            HealthStartPeriod = "30s";
          };
        };
      };

      uchiyomi-suwayomi = {
        image = "ghcr.io/suwayomi/suwayomi-server:v2.3.2243";
        description = "Suwayomi extension engine for Uchiyomi";
        autoStart = false;
        network = [ "uchiyomi_app.network" ];
        environment = {
          TZ = "Europe/Moscow";
          AUTO_DOWNLOAD_CHAPTERS = "false";
          DOWNLOAD_AS_CBZ = "true";
        };
        volumes = [ "uchiyomi_suwayomi:/home/suwayomi/.local/share/Tachidesk" ];
        extraConfig.Unit.PartOf = [ "podman-uchiyomi.service" ];
      };
    };
  };
}

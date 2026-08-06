{
  services.podman = {
    enable = true;

    settings = {
      containers.engine.compose_warning_logs = false;

      storage.storage = {
        driver = "overlay";
      };

      policy = {
        default = [ { type = "insecureAcceptAnything"; } ];
      };

      registries = {
        search = [
          "docker.io"
          "quay.io"
          "ghcr.io"
          "gcr.io"
          "registry.ugsk.ru"
          "prod-registry.ugsk.ru"
        ];
      };
    };
  };
}

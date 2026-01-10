{ pkgs, ... }:
{
  services.espanso = {
    enable = true;
    package = pkgs.espanso-wayland;
    configs = {
      default = {
        backend = "inject";
      };
    };
    matches = {
      default = {
        matches = [
          {
            regex = "(?P<last>\\S)  ";
            replace = "{{last}}. ";
          }
        ];
      };
    };
  };
}

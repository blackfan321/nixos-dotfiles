{ ... }:

{
  services.journald.settings.Journal = {
    Storage = "persistent";
    Compress = "yes";

    SystemMaxUse = "500M";
    SystemKeepFree = "1G";
    SystemMaxFileSize = "50M";
    RuntimeMaxUse = "100M";

    MaxFileSec = "1day";
    MaxRetentionSec = "2week";

    MaxLevelStore = "info";
  };
}

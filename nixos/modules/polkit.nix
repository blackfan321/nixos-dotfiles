{ pkgs, ... }:

{
  # force authentication for KeePassXC database unlock
  security.polkit.extraConfig = ''
    polkit.addRule(function(action, subject) {
      if (action.id === "org.keepassxc.KeePassXC.unlockDatabase") {
        return polkit.Result.AUTH_SELF;
      }
    });
  '';

  # polkitd only reads actions from the system profile; keepassxc is installed via home-manager
  environment.systemPackages = [
    (pkgs.runCommand "keepassxc-polkit-policy" { } ''
      mkdir -p $out/share/polkit-1/actions
      ln -s ${pkgs.keepassxc}/share/polkit-1/actions/org.keepassxc.KeePassXC.policy \
        $out/share/polkit-1/actions/org.keepassxc.KeePassXC.policy
    '')
  ];
}

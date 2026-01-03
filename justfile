set shell := ["zsh", "-cu"]

sync-home-manager:
  rm -rf home-manager
  cp -R ~/.config/home-manager ./home-manager
  git add home-manager
  git diff --cached --quiet || git commit -m "chore: sync home-manager"

sync-nixos:
  doas rm -rf nixos
  doas cp -a /etc/nixos ./nixos
  git add nixos
  git diff --cached --quiet || git commit -m "chore: sync nixos"

sync: sync-home-manager sync-nixos

{ den, ... }:

{
  den.aspects.blackfan321.includes = [
    den.batteries.primary-user
    (den.batteries.user-shell "zsh")
    ({ user, ... }: {
      nixos.users.users.${user.userName}.description = user.description;
    })
    den.aspects.fzf
    den.aspects.direnv
    den.aspects.docker
    den.aspects.nh
    den.aspects.uv
    den.aspects.zed
    den.aspects.bat
    den.aspects.k8s
    den.aspects.vesktop
    den.aspects.zsh
    den.aspects.gnome
    den.aspects.face
    den.aspects.zen
    den.aspects.gaming
    den.aspects.vicinae
    den.aspects.git
    den.aspects.vim
    den.aspects.cli
    den.aspects.desktop
    den.aspects.fastfetch
  ];
}

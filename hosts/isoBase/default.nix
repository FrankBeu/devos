{ profiles, ... }:
let
  mainuser = "nixos";
in
{
  ### build with: `bud build isoBase bootstrapIso`
  ### reachable on the local link via ssh root@fe80::47%eno1
  ### where 'eno1' is replaced by your own machine's network
  ### interface that has the local link to the target machine

  imports = [
    profiles.users.root ### make sure to configure ssh keys
    profiles.users.${mainuser}

    # profiles.networking
    profiles.core

    profiles.editor.vim
    profiles.filemanager.ranger
  ];

  home-manager.users.${mainuser} = { suites, profiles, ... }: {
    imports = [
      profiles.filemanager.ranger
    ];
  };

  boot.loader.systemd-boot.enable = true;

  ### will be overridden by the bootstrapIso instrumentation
  fileSystems."/" = { device = "/dev/disk/by-label/nixos"; };

  environment.variables = {
    EDITOR = "vim";
  };
}

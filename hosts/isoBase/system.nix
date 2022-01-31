{ profiles, mainUser, ... }:
{
  imports = [
    profiles.users.root                                        ### make sure to configure ssh keys  
    profiles.users.${mainUser}

    # profiles.networking
    profiles.core

    profiles.editor.vim
    profiles.filemanager.ranger
  ];

  boot.loader.systemd-boot.enable = true;

  environment.variables = {
    EDITOR = "vim";
  };

  fileSystems."/" = { device = "/dev/disk/by-label/nixos"; };  ### will be overridden by the bootstrapIso instrumentation
}

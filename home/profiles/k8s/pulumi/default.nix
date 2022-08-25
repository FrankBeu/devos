{ config, pkgs, ... }:
let
  inherit (config.home) username;
in
{
  home = {
    packages = with pkgs; [
      pulumi-bin
      crd2pulumi    ### https://github.com/pulumi/crd2pulumi
      kube2pulumi   ### https://github.com/pulumi/kube2pulumi
    ];

    shellAliases = {
      p     = ''summonPulumi dev'';
      pS    = ''summonPulumi stage'';
      pPROD = ''summonPulumi prod'';
    };
  };

  ### $XDG_STATE_HOME is not available; hm: config.xdg.stateHome is not implemented
  systemd.user.tmpfiles.rules =
    [
      "d /home/${username}/.local/state/pulumi  755 ${username} users"
    ];
}

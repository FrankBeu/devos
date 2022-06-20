{ config, lib, nixosConfig, pkgs, ... }:
let
  inherit (config.home)            username;
  inherit (nixosConfig.networking) hostName;
in
{
  home = {
    file = {
      ".ssh/config".source = ./config;
      ".docLocal/content/homemanager/security.org".text = pkgs.lib.mkDefault( pkgs.lib.mkAfter ''
        ${(import ./ssh.org { inherit username hostName; })}
      '');
    };

    shellAliases =
      let ifSudo = lib.mkIf nixosConfig.security.sudo.enable; in {
        sshkglh =        ''     ssh-keygen -l -f ~/.ssh/id_ed25519                             ''; ### SSH-Keygen-Gen-List-Home
        sshkgln = ifSudo ''sudo ssh-keygen -l -f /etc/ssh/ssh_host_ed25519_key                 ''; ### SSH-Keygen-Gen-List-Nixos
        sshkgn  =        ''     ssh-keygen -N "" -t ed25519 -a 100 -C "${username}@${hostName}"''; ### SSH-Keygen-Gen-New               <FILE>
        sshkgnp =        ''     ssh-keygen       -t ed25519 -a 100 -C "${username}@${hostName}"''; ### SSH-Keygen-Gen-New-with-Password <FILE>
        sshkgr  =        ''     ssh-keygen -R                                                  ''; ### SSH-Keygen-Gen-Remove            <HOST>

        ###  currently ~/.ssh/config is used because of rofi
        # ssh = ''ssh -F ${XDG_CONFIG_HOME}/ssh/config''; ### SSH

        ssha    = ''ssh-add'';

        ### TODO extract??
        nucs    = ''ssh nuc'';
        nucx    = ''ssh nucX'';
        # nucw  = ''wol 94:c6:91:1e:02:ec'';
        # nucv    = ''vncv'';
        # nucr    = ''rc con'';

      };
  };
}

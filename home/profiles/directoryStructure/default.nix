{ config, lib, nixosConfig, pkgs, variables, ... }:
let
  inherit (config.home) username;
  shell = nixosConfig.users.users.${username}.shell.pname;
in
{
  xdg.configFile."i3/config".text = pkgs.lib.mkDefault( pkgs.lib.mkAfter ''
    ${(import ./i3/additional.nix )}
  '' );

  programs.${shell}.enable = true;
  home = {

    file.".local/bin/registerRepo".source = ./dotLocal/registerRepo;

    ### ranger can only use single-letter-marks; cf. ../filemanager/ranger/ranger/state/bookmarks.nix:1:9
    shellAliases =
      let ifSudo = lib.mkIf nixosConfig.security.sudo.enable;
      in
      lib.mkMerge [
        {
          ### ALiasCD     | high(2uppercases) norm(followedBy=)     | align= (WithANSI)                      | surround=   | rm'
          alcd = '' alias | rg --color=always -P '^[A-Z]{1,2}(?==)' | sd '(m[A-Z]{1})(\x1b)(.*)=' '$1$2$3 =' | sd '=' ' = '| sd "'" "" '';

          A    = "cd $HOME/MEDIA/ANDROID"                                 ;
          AS   = "cd $HOME/MEDIA/ANDROID/Internal\\ shared\\ storage/DCIM";  ### Android_Storage
          AK   = "cd $HOME/AKTUELLES"                                     ;
          B    = "cd $HOME/BAK"                                           ;
          C    = "cd $HOME/.config"                                       ;  ###       externaly created
          D    = "cd $HOME/DEVOS"                                         ;
          DH   = "cd $HOME/DEVOS/home/profiles"                           ;
          DL   = "cd $HOME/DEVOS/lib"                                     ;
          DN   = "cd $HOME/DEVOS/nixos/profiles"                          ;
          DO   = "cd $HOME/DEVOS/hosts"                                   ;
          DS   = "cd $HOME/DEVOS/secrets"                                 ;
          DT   = "cd $HOME/DEVOS/tests"                                   ;
          E    = "cd $HOME/.emacs.d"                                      ;  ### cond. externaly created
          G    = "cd $HOME/GAMES"                                         ;  ### cond. externaly created
          I    = "cd $HOME/MUSIC"                                         ;
          K    = "cd $HOME/KUBE"                                          ;
          L    = "cd $HOME/DOWNLOADS"                                     ;
          M    = "cd $HOME/MEDIA"                                         ;
          MB   = "cd $HOME/MEDIA/BAK"                                     ;  ### SUBDIR-ALIASES are created in ../backup/kopia/default.nix:68:86
          MC   = "cd $HOME/MEDIA/CCUSB"                                   ;
          MX   = "cd $HOME/MEDIA/EXTERN"                                  ;
          N    = "cd $HOME/NOTES"                                         ;
          O    = "cd $HOME/NOW"                                           ;
          P    = "cd $HOME/PICTURES/flameshot"                            ;
          R    = "cd $HOME/ROUTINES"                                      ;
          RE   = "cd $HOME/ROUTINES/EXISTENTIAL"                          ;
          RM   = "cd $HOME/ROUTINES/MENTAL"                               ;
          RI   = "cd $HOME/ROUTINES/MISC"                                 ;
          S    = "cd $HOME/SRC"                                           ;
          T    = "cd $HOME/TMP"                                           ;
          U    = "cd $HOME/UNSORTED"                                      ;
          V    = "cd $HOME/VIDEOS"                                        ;
          W    = "cd /run/current-system/sw"                              ;  ###       externaly created
          X    = "cd /nix/store/"                                         ;  ###       externaly created

          mum = ifSudo "sudo umount $HOME/MEDIA/"       ;  ### uMountU Media <DIRNAME>
          muc = ifSudo "sudo umount $HOME/MEDIA/CCUSB"  ;  ### uMountU Ccusb
          mue = ifSudo "sudo umount $HOME/MEDIA/EXTERN" ;  ### uMountU Extern
        }

        (lib.mkIf (lib.elem pkgs.ranger nixosConfig.environment.systemPackages) {
          ### ALiasRangeR | find ranger                | align=                                     | surround=   | rm'
          alrr = '' alias | rg --color=always 'ranger' | sd '(r)=' '$1   =' | sd '(^\w{3})=' '$1 =' | sd '=' ' = '| sd "'" "" '';

          rras    = "ranger $HOME/MEDIA/ANDROID/Internal\\ shared\\ storage/DCIM";
          rrak   = "ranger $HOME/AKTUELLES";
          rrb    = "ranger $HOME/BAK"                                         ;
          rrc    = "ranger $HOME/.config"                                     ;  ###       externaly created
          rrd    = "ranger $HOME/DEVOS"                                       ;
          rrdh   = "ranger $HOME/DEVOS/home/profiles"                         ;
          rrdl   = "ranger $HOME/DEVOS/lib"                                   ;
          rrdn   = "ranger $HOME/DEVOS/nixos/profiles"                        ;
          rrdo   = "ranger $HOME/DEVOS/hosts"                                 ;
          rrds   = "ranger $HOME/DEVOS/secrets"                               ;
          rrdt   = "ranger $HOME/DEVOS/tests"                                 ;
          rre    = "ranger $HOME/.emacs.d"                                    ;  ### cond. externaly created
          rrg    = "ranger $HOME/GAMES"                                       ;  ### cond. externaly created  ### rg reserved for rip-grep
          rri    = "ranger $HOME/MUSIC"                                       ;
          rrk    = "ranger $HOME/KUBE"                                        ;
          rrl    = "ranger $HOME/DOWNLOADS"                                   ;
          rrm    = "ranger $HOME/MEDIA"                                       ;
          rrmb   = "ranger $HOME/MEDIA/BAK"                                   ;  ### SUBDIRS-ALIASES are created in ../backup/kopia/default.nix:71:85
          rrmc   = "ranger $HOME/MEDIA/CCUSB"                                 ;
          rrmx   = "ranger $HOME/MEDIA/EXTERN"                                ;
          rrn    = "ranger $HOME/NOTES"                                       ;
          rro    = "ranger $HOME/NOW"                                         ;
          rrp    = "ranger $HOME/PICTURES/flameshot"                          ;
          rrre   = "ranger $HOME/ROUTINES/EXISTENTIAL"                        ;
          rrrm   = "ranger $HOME/ROUTINES/MENTAL"                             ;
          rrri   = "ranger $HOME/ROUTINES/MISC"                               ;
          rrs    = "ranger $HOME/SRC"                                         ;
          rrt    = "ranger $HOME/TMP"                                         ;
          rru    = "ranger $HOME/UNSORTED"                                    ;
          rrv    = "ranger $HOME/VIDEOS"                                      ;
          rrw    = "ranger /run/current-system/sw"                            ;  ###       externaly created
          rrx    = "ranger /nix/store/"                                       ;  ###       externaly created
        })
      ];
      ### TODO dry-it-out
  };

  systemd.user.tmpfiles.rules =
    [
      "d /home/${username}/AKTUELLES            755 ${username} users"
      "d /home/${username}/ARCHIVES             755 ${username} users"
      "d /home/${username}/BAK                  755 ${username} users"
      "d /home/${username}/DOCUMENTS            755 ${username} users"
      "d /home/${username}/DOCUMENTS/CCUSB      755 ${username} users"
      "d /home/${username}/MEDIA                755 ${username} users"
      "d /home/${username}/MEDIA/ANDROID        755 ${username} users"
      "d /home/${username}/MEDIA/BAK            755 ${username} users"  ### +SUBDIRS are created in cf. ../backup/kopia/default.nix:16:73
      "d /home/${username}/MEDIA/CCUSB          755 ${username} users"
      "d /home/${username}/MEDIA/EXTERN         755 ${username} users"
      "d /home/${username}/MEDIA/PIC            755 ${username} users"
      "d /home/${username}/MUSIC                755 ${username} users"
      "d /home/${username}/NOTES                755 ${username} users"
      "d /home/${username}/NOW                  755 ${username} users"
      "d /home/${username}/PICTURES             755 ${username} users"
      "d /home/${username}/PICTURES/flameshot   755 ${username} users"
      "d /home/${username}/ROUTINES             755 ${username} users"
      "d /home/${username}/ROUTINES/EXISTENTIAL 755 ${username} users"
      "d /home/${username}/ROUTINES/MENTAL      755 ${username} users"
      "d /home/${username}/ROUTINES/MISC        755 ${username} users"
      "d /home/${username}/SRC                  755 ${username} users"
      "d /home/${username}/SRC/registeredRepos  755 ${username} users"
      "d /home/${username}/SRC/GITEA            755 ${username} users"
      "d /home/${username}/SRC/GITHUB           755 ${username} users"
      "d /home/${username}/TMP                  755 ${username} users"
      "d /home/${username}/UNBAKED              755 ${username} users"  ### unBAKed and unBackUped
      "d /home/${username}/UNSORTED             755 ${username} users"
      "d /home/${username}/VIDEOS               755 ${username} users"
      "d /home/${username}/VIDEOS/OBS           755 ${username} users"
      "d /home/${username}/VIRTUALISATION       755 ${username} users"  ### TODO create config for VBox
    ];

    # "d /home/${user}/SRC/CONTAINER      755 ${user} users"
    # "d /home/${user}/SRC/MISC           755 ${user} users"
    # "d /home/${username}/SRC/GITHUB/MIRRORS 755 ${username} users"
}
### TODO doc
### explain why uppercase difference Structureal Regular folder; folders created by apps can be cleaned up easily
### INFO: `man tmpfiles.d`

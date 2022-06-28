### RYZEN:  ../../../../hosts/ryzen/home/frank/kopia/default.nix:2:14
### MODULE: ../../../modules/services/backup/kopia/default.nix:1:14
{ config
, lib
, pkgs
, nixosConfig
, self
, variables
, ...
}:
### TODO check quickLinks
let
  inherit (config.home) username homeDirectory;
  kopiaMountPoint = "${homeDirectory}/MEDIA/BAK/KOPIA";
in
{
  systemd.user.tmpfiles.rules = [
    "d ${homeDirectory}/MEDIA/BAK        755 ${username} users"  ### cf ../../directoryStructure/default.nix:109:103
    "d ${homeDirectory}/MEDIA/BAK/KOPIA/ 755 ${username} users"
  ] ;

  home = {
    packages = with pkgs; [
      kopia
    ];

    sessionVariables = {
      KOPIA_CHECK_FOR_UPDATES = "false";
      ### TODO set other envs for manual usage
    };

    shellAliases = let
      inherit (lib) mkIf elem;

      batMan     = ''bat -l man   --wrap never --style changes,header,grid'';
      batKop     = ''bat -l fstab --wrap never --style changes,header,grid''; ### TODO create kopia-syntax
      batJson    = ''bat -l json  --wrap never --style changes,header,grid'';
      fmtJson    = ''prettybat -l json ''                                   ;
      fmtBatJson = ''${fmtJson} | ${batJson}''                              ;
      batDff     = ''sed 's/sizes\|modification/FIELDSEPARATOR&/' | awk 'BEGIN {FS=" FIELDSEPARATOR";}{$1 = sprintf("%-64s",  $1); print $0}'| ${batKop}'';
    in
    lib.mkMerge [
      {
        kop        = ''kopia''                                              ;### KOPia

        kophh      = ''kopia --help                       | ${batMan}''     ;### KOPiaHelpHelp        119l  context aware
        kophf      = ''kopia --help-full                  | ${batMan}''     ;### KOPiaHelpFull        514l  for commands
        kophl      = ''kopia --help-long                  | ${batMan}''     ;### KOPiaHelpLong        1629l context aware
        kophm      = ''man <(kopia --help-man)''                            ;### KOPiaHelpMan         2428l
        koph       = ''(){ kopia help ''${1}              | ${batMan}}''    ;### KOPiaHelp            <COMMAND>

        kopsn      = ''kopia snapshot''                                     ;### KOPia SNapshot       <...>
        kopsncr    = ''kopia snapshot create''                              ;### KOPia SNapshot       CReate  <PATH>
        kopsnls    = ''(){ kopia snapshot list  "''${@}"  | ${batKop}}''    ;### KOPia SNapshot       LiSt                      ### TODO create kopia-syntax

        kopls      = ''(){ kopia ls -l   "''${@}"         | ${batKop}}''    ;### KOPia LiSt           <SNAPSHOT>                ### TODO create kopia-syntax
        kopdf      = ''(){ kopia diff    "''${@}"         | ${batDff}}''    ;### KOPia DifF           <IDENTIFIER> <IDENTIFIER> ### TODO create kopia-syntax
        kopdff     = ''(){ kopia diff -f "''${@}"         | ${batDff}}''    ;### KOPia DifF           <IDENTIFIER> <IDENTIFIER> ### TODO create kopia-syntax
        kopsh      = ''(){ kopia show    "''${@}"         | ${fmtBatJson}}'';### KOPia SHow           <IDENTIFIER>
        kopshdir   = ''(){ kopia content show -j "''${@}" | ${batJson}}''   ;### KOPia SHow DIRectory <IDENTIFIER>

        koprp      = ''kopia repository''                                   ;### KOPia RePository     <...>
        koprpst    = ''kopia repository status            | ${batKop}''     ;### KOPia RePository     STatus                    ### TODO create kopia-syntax
        koprpdis   = ''kopia repository disconnect''                        ;### KOPia RePository     DISconnect

        kopmntall  = ''kopia mount all        ${kopiaMountPoint}''          ;### KOPia MouNT ALL
        kopmnt     = ''(){ kopia mount ''${1} ${kopiaMountPoint} ;}''       ;### KOPia MouNT <IDENTIFIER>
        kopumnt    = ''fusermount -u          ${kopiaMountPoint}''          ;### KOPia UMouNT ### INFO used to force unmounting a stuck mount

        MBK   = ''cd ${kopiaMountPoint}''                                   ;### cf. ../../directoryStructure/default.nix:41:87
      }
      (lib.mkIf (lib.elem pkgs.ranger nixosConfig.environment.systemPackages) {
        rrmbk   = ''ranger ${kopiaMountPoint}''                             ;### cf ../../directoryStructure/default.nix:82:94
      })
    ];

    file.".docLocal/content/homemanager/backup.org".text = pkgs.lib.mkDefault( pkgs.lib.mkAfter ''
      ${(import ./kopia.org.nix { inherit config nixosConfig; })}
    '');
  };
}

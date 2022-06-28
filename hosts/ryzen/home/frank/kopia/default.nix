### MOUNTS:  ../../../system/misc/mountsBackup/default.nix:1:12
### PROFILE: ../../../../../home/profiles/backup/kopia/default.nix:1:13
### MODULE:  ../../../../../home/modules/services/backup/kopia/default.nix:2:14
{ config
, lib
, pkgs
, nixosConfig
, self
, ...
}:
let
  inherit (config.home) username homeDirectory;
  inherit (lib)         hm;

  SAFE                 = "${homeDirectory}/.SAFE";

  homeInternalRepoPath = "${homeDirectory}/.KOPIA/INTERNAL";
  homeExternalRepoPath = "/srv/BAK/KOPIA/HOME/EXTERNAL";
  ### TODO NUC
  # homeRemoteRepoPath   = "/srv/BAK/KOPIA/HOME/REMOTE";
  homeRemoteRepoPath   = "${homeDirectory}/TMP/KOPIA/repo2";  ### TODO only for testing
  safeRepoPath         = "/srv/BAK/SAFE/KOPIA";

  homeInternalPassPath = "kopia/HOME/INTERNAL";
  homeExternalPassPath = "kopia/HOME/EXTERNAL";
  homeRemotePassPath   = "kopia/HOME/REMOTE";
  safePassPath         = "kopia/SAFE";
in
{
  systemd.user.tmpfiles.rules = [
    ### create via activationScript
    # "d ${homeDirectory}/.SAFE            755 ${username} users"
    "d ${homeDirectory}/.KOPIA           755 ${username} users"
    "d ${homeDirectory}/.KOPIA/INTERNAL  755 ${username} users"
  ] ;

  home = {
    activation.kopiaSettings = let
      cpCmd   = "$DRY_RUN_CMD ${pkgs.coreutils}/bin/cp    $VERBOSE_ARG -L  ";
      mdCmd   = "$DRY_RUN_CMD ${pkgs.coreutils}/bin/mkdir $VERBOSE_ARG -p  ";
      secrets = nixosConfig.sops.secrets;
    in
    hm.dag.entryAfter [ "writeBoundary" ]
    ''
      ${mdCmd} "${SAFE}"
      ${cpCmd} "${secrets."kopia/SAFE/scripts/update".path}" "${SAFE}/update"
      ${cpCmd} "${secrets."kopia/SAFE/scripts/plain" .path}" "${SAFE}/plain"
    '';

    shellAliases = let
      ### TODO dry-it-out
      ### TODO extract to lib or to module with automatic alias-creation
      ###                                        make variable
      askPass          = passPath:             ''KOPIA_PASSWORD=$(gopass show -c ${passPath} &>/dev/null; xsel -ob)'';
      con2Fs           =           fileSystem: ''kopia repository connect filesystem --path ${fileSystem}''          ;
      askPassAndCon2Fs = passPath: fileSystem: ((askPass passPath) + " " + (con2Fs fileSystem))                      ;
    in
    {
      ### connection
      koprpcnsf    = ''${(askPassAndCon2Fs         safePassPath         safeRepoPath)}'';### KOPia RePository CoNnect SaFe
      koprpcnhmint = ''${(askPassAndCon2Fs homeInternalPassPath homeInternalRepoPath)}'';### KOPia RePository CoNnect HoMe INTernal
      koprpcnhmext = ''${(askPassAndCon2Fs homeExternalPassPath homeExternalRepoPath)}'';### KOPia RePository CoNnect HoMe EXTernal
      koprpcnhmrmt = ''${(askPassAndCon2Fs   homeRemotePassPath   homeRemoteRepoPath)}'';### KOPia RePository CoNnect HoMe ReMoTe

      ### manualBackup
      kopbakhmext  = ''systemctl  --user start kopia-HOME-EXTERNAL.service''            ;### KOPia BAcKup HoMe EXTernal
      kopbakhmint  = ''systemctl  --user start kopia-HOME-INTERNAL.service''            ;### KOPia BAcKup HoMe INTernal
      kopbakhmrmt  = ''systemctl  --user start kopia-HOME-REMOTE.service''              ;### KOPia BAcKup HoMe ReMoTe
      kopbaksf     = ''systemctl  --user start kopia-SAFE.service''                     ;### KOPia BAcKup SaFe

      ### logs
      koploghmext  = ''journalctl --user   -eu kopia-HOME-EXTERNAL.service''            ;### KOPia LOG HoMe EXTernal
      koploghmint  = ''journalctl --user   -eu kopia-HOME-INTERNAL.service''            ;### KOPia LOG HoMe INTernal
      koploghmrmt  = ''journalctl --user   -eu kopia-HOME-REMOTE.service''              ;### KOPia LOG HoMe ReMoTe
      koplogsf     = ''journalctl --user   -eu kopia-SAFE.service''                     ;### KOPia LOG SaFe
    };
  };

  ### TODO create mounts automatically

  services.kopia = let
    homeSnapshotDirs = map (dir: homeDirectory + "/" + dir) (import ./homeSnapshotDirs.nix );
  in
  {
    enable = true;
    jobs = {
      SAFE = {
        timer = {};
        repoPath    = safeRepoPath;
        envFilePath = nixosConfig.sops.secrets."${safePassPath}/environmentFile".path;
        ### TODO mount device update snap unmount
        snapshots   = [
          SAFE
        ];
      };

      HOME-INTERNAL = {
        timer = {
          # OnCalendar         = "*:00/15";
          OnCalendar         = "*:00/30";
          RandomizedDelaySec = "2m";
        };
        repoPath    = homeInternalRepoPath;
        envFilePath = nixosConfig.sops.secrets."${homeInternalPassPath}/environmentFile".path;
        snapshots   = homeSnapshotDirs;
      };

      HOME-EXTERNAL = {
        timer = {
          OnCalendar         = "18:00";
          RandomizedDelaySec = "1h";
        };
        repoPath    = homeExternalRepoPath;
        envFilePath = nixosConfig.sops.secrets."${homeExternalPassPath}/environmentFile".path;
        snapshots   = homeSnapshotDirs;
        ### TODO mount device snap unmount
      };

      HOME-REMOTE = {
        timer = {
          OnCalendar         = "Sun 18:00";
          RandomizedDelaySec = "1h";
        };
        repoPath    = homeRemoteRepoPath;
        envFilePath = nixosConfig.sops.secrets."${homeRemotePassPath}/environmentFile".path;
        snapshots   = homeSnapshotDirs;
      };
    };
  };
}

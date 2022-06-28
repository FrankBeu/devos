### PROFILE: ../../../../../home/profiles/backup/kopia/default.nix:2:13
### RYZEN:   ../../../../../hosts/ryzen/home/frank/kopia/default.nix:3:14
### based on: https://github.com/knopki/devops-at-home
{ config
, lib
, nixosConfig
, pkgs
, ...
}:
let
  inherit (lib)
  concatStringsSep
  escapeShellArg
  filterAttrs
  mapAttrs'
  mapAttrsToList
  mkEnableOption
  mkIf
  mkOption
  nameValuePair
  types
  ;

  cfg       = config.services.kopia;
  jobModule = types.submodule ({ config, ... }: {
    options = {
      snapshots = mkOption {
        type        = with types; listOf str;
        description = "A List of snapshots";
      };
      timer = mkOption {
        type        = with types; attrsOf str;
        description = "Attrs of systemd Timer section. Set to {} if the service should start only after manual activation.";
      };
      envFilePath = mkOption {
        type        = types.nullOr types.path;
        default     = null;
        description = "The path to the kopiaJob's EnvironmentFile.";
      };
      repoPath = mkOption {
        type        = types.nullOr types.path;
        default     = null;
        description = "The path to the kopiaJob's initialized repository.";
      };
    };
  });
in
{
  options.services.kopia = {
    enable = mkEnableOption "kopia configuration";
    jobs   = mkOption {
      type        = types.attrsOf jobModule;
      default     = { };
      description = "kopia jobs";
    };
  };

  config = mkIf cfg.enable {
    home.packages         = with pkgs; [ kopia ];

    ### TODO remote snapshotting uses SFTP
    # nixosConfig.services.openssh.allowSFTP = true;

    systemd.user.services = mapAttrs'
    (name: value: nameValuePair "kopia-${name}" {
      Unit = {
        Description           = "kopia-backup-job: ${name}";
        StartLimitIntervalSec = "0";
      };
      Service = {
        CPUSchedulingPolicy = "idle";
        IOSchedulingClass   = "idle";
        Restart             = "on-failure";
        RestartSec          = "1m";
        Type                = "oneshot";
        EnvironmentFile     = value.envFilePath;
        ExecStartPre =''
          ${pkgs.kopia}/bin/kopia repository connect filesystem --path ${value.repoPath}
        '';
        ExecStart    =''
          ${pkgs.kopia}/bin/kopia snap create ${concatStringsSep " " (map escapeShellArg value.snapshots)}
        '';
        ExecStop     =''
          ${pkgs.kopia}/bin/kopia repository disconnect
        '';
      };
    })
    cfg.jobs;

    systemd.user.timers = mapAttrs'
    (name: value: nameValuePair "kopia-${name}" {
      Unit  = { Description = "Kopia periodic snapshotting - ${name}"; };
      Timer = {
        Unit       = "kopia-${name}.service";
        Persistent = true;
      } // value.timer;
      Install = { WantedBy = [ "timers.target" ]; };
    })
    ### do not create a *.timer file, if job.timer is {}
    (filterAttrs (_: job: job.timer != {}) cfg.jobs);
  };
}

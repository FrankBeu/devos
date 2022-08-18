### BAKUP: ../../../home/frank/kopia/default.nix:1:14
{ config, lib, ... }:
{
  fileSystems."/srv/BAK/KOPIA" = {
    device = "/dev/disk/by-label/BAK";
    fsType = "btrfs";
    options = [
      "nofail"
      "subvol=KOPIA"
      # "x-systemd.automount"
    ];
  };

  fileSystems."/srv/BAK/SAFE" = {
    device = "/dev/disk/by-label/SAFE";
    fsType = "btrfs";
    options = [
      "nofail"
    ];
  };

  environment.shellAliases =
    let ifSudo = lib.mkIf config.security.sudo.enable; in
    {
      sysmbak = ''sudo systemctl start srv-BAK-KOPIA.mount'';  ### SYStemctl Mount  BAK
      sysubak = ''sudo systemctl stop  srv-BAK-KOPIA.mount'';  ### SYStemctl Umount BAK

      sysmsf  = ''sudo systemctl start srv-BAK-SAFE.mount'' ;  ### SYStemctl Mount  SaFe
      sysusf  = ''sudo systemctl stop  srv-BAK-SAFE.mount'' ;  ### SYStemctl Umount SaFe
    };
}

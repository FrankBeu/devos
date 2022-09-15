{ config, lib, ... }:
{
  fileSystems."/home/frank/MEDIA/EXTERN" = {
    device = "/dev/disk/by-label/EXTERN";
    fsType = "btrfs";
    options = [ "nofail" ];
  };

  fileSystems."/home/frank/MEDIA/CCUSB" = {
    device = "/dev/disk/by-label/CCUSB";
    fsType = "vfat";
    options = [
      "nofail"
      "uid=1428"
      "gid=100"
      "dmask=007"
      "fmask=117"
    ];
    # options = [ "noauto" "nofail" ];
  };

  environment = {
    shellAliases =
      let ifSudo = lib.mkIf config.security.sudo.enable; in
      {
        sysmex  = ''sudo systemctl start home-frank-MEDIA-EXTERN.mount'' ;  ### SYStemctl Mount  EXtern
        sysuex  = ''sudo systemctl stop  home-frank-MEDIA-EXTERN.mount'' ;  ### SYStemctl Umount EXtern

        sysmcc  = ''sudo systemctl start home-frank-MEDIA-CCUSB.mount''  ;  ### SYStemctl Mount  CCusb
        sysucc  = ''sudo systemctl stop  home-frank-MEDIA-CCUSB.mount''  ;  ### SYStemctl Umount CCusb
      };
  };
}
### TODO doc:
### get label with `lsblk -f`
### nofail: Do not fail, if device is not available on boot.
### noauto: Do not mount device automatically on boot or on switch.
### info about creating labels

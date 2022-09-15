{ config, lib, ... }:
{
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
  };

  environment = {
    shellAliases =
      let ifSudo = lib.mkIf config.security.sudo.enable; in
      {
        sysmcc  = ''sudo systemctl start home-frank-MEDIA-CCUSB.mount''  ;  ### SYStemctl Mount  CCusb
        sysucc  = ''sudo systemctl stop  home-frank-MEDIA-CCUSB.mount''  ;  ### SYStemctl Umount CCusb
      };
  };
}

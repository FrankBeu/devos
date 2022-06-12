{ config, lib, pkgs, variables, ... }:
{
  environment.systemPackages = with pkgs; [
    jmtpfs
    mtpfs                      ###  https://github.com/cjd/mtpfs
    libmtp                     ###  http://libmtp.sourceforge.net/
    android-file-transfer      ###  https://whoozle.github.io/android-file-transfer-linux/
  ];

  programs.adb.enable = true;

  environment.shellAliases =
    let ifSudo = lib.mkIf config.security.sudo.enable;
    in
    {
      maj = ifSudo "sudo jmtpfs $HOME/MEDIA/ANDROID";  ### MountAndroidwithJmtpfs
      mua = "fusermount -u $HOME/MEDIA/ANDROID";
    };
}

### TODO doc
### mount with user
### https://nixos.wiki/wiki/MTP

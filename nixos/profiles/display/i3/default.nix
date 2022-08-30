{config, pkgs, ...}:
{
  imports = [
    ./keyboard
  ];

  services.xserver = {
    enable                  = true;
    windowManager.i3.enable = true;
  };

  environment.systemPackages = with pkgs; [
    alsa-utils
    xorg.xkill
    xsel
    xorg.xwininfo
  ];

  environment.etc."/docLocal/content/system/xserver.org".source = ./xserver.org;
}

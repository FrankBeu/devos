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
    xorg.xkill
    xsel
    xlibs.xwininfo
  ];

  environment.etc."/docLocal/content/system/xserver.org".source = ./xserver.org;
}

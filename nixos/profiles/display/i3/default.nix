###
##
# * xserver
#
{config, pkgs, variables, ...}:
{

  imports = [
    ./keyboard
    # ./ibus   ### TODO + barista
  ];

  services.xserver = {
    enable = true;
    windowManager.i3.enable = true;

  };

  services.unclutter-xfixes.enable = true;

  environment.systemPackages = with pkgs; [
    xdotool                                  ### TODO: extract to gopass
    xorg.xkill
    xsel

    i3

    #TODO
    # i3statusBar

    bibata-cursors
    #bibata-cursors-translucent
    #bibata-extra-cursors
  ];

  environment.etc."/nixos/doc/content/system/xserver.org".source = ./doc.org;

}

{ pkgs, variables, ... }:
{
  services.xserver = {
    displayManager = {
      autoLogin = {
        enable = variables.displaymanager.autologin.enabled;
        user   = variables.displaymanager.autologin.username;
      };
      hiddenUsers = [ "borg" ];
      lightdm.greeters.gtk.iconTheme = {
        package = pkgs.bibata-cursors;
        name    = "Bibata_Classic";
      };
      defaultSession  = "none+i3";
      sessionCommands = ''
        ### mouseAcceleration
        ${pkgs.xorg.xset}/bin/xset m 7/1 1

        ### keyboard
        ${pkgs.xorg.xset}/bin/xset r rate 145 225

        ### the xkb-settings require: (the console settings work without the following statement)
        ${pkgs.xorg.setxkbmap}/bin/setxkbmap
      '';
      # ${pkgs.xorg.xset}/bin/xset r rate 175 85
    };
  };

}

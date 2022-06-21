### TODO create nixos.profiles.keyboard after wayland
{config, pkgs, ...}:
{

  services.xserver = {
    xkbModel     = "logicda";
    # layout     = "us,ru,in,ara,us,us";
    # xkbVariant = "intl-unicode,,san-kagapa,qwerty,colemak_dh,colemak_dh_iso";
    layout       = "us,ru,in,ara";
    xkbVariant   = "intl-unicode,,san-kagapa,qwerty";



    ### KEYBINDINGS
    ### configFile: cat /run/current-system/etc/X11/xorg.conf.d/00-keyboard.conf

    xkbOptions = builtins.concatStringsSep "," [

      ### LAYOUT-SWITCHING
      ### rg -e "grp:.*toggle" /run/current-system/sw/share/X11/xkb/rules/base.lst

      # "grp:shifts_toggle"                         ### Both Shift together
      "grp:alt_space_toggle"                        ### Alt+Space

      ### OPTIONS
      ### rg -e "(ctrl|caps):" /run/current-system/sw/share/X11/xkb/rules/base.lst
      "ctrl:swap_lalt_lctl"                       ### swap ctrl_l with alt_l

      # "ctrl:swapcaps"                           ### swap ctrl_l with capsLock
      # "eurosign:e"

      "numpad:mac"                                ### always use numbers
      # "altwin:swap_alt_win"                     ### super to AltGr
      # "lv3:switch"                              ### lv3 to CtrlR
    ];

    # libinput.enable = true;                     ### enable touchpad support ### TODO hostSpecific: use variable

  };

  console.useXkbConfig = true;                    ### Use same config for linux console
}

### CURRENT DEFAULT COMMAND
### setxkbmap -layout "us" -option ""&& setxkbmap -model "logicda" -layout "us,ru,in,ara" -variant "intl-unicode,,san-kagapa,qwerty" -option "ctrl:swap_lalt_lctl,grp:alt_space_toggle,numpad:mac"

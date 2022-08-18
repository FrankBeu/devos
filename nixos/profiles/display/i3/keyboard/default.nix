### TODO create nixos.profiles.keyboard after wayland
{config, pkgs, ...}:
{

  services.xserver = {
    xkbModel     = "logicda";
    layout       = "us,ru,custom-deva,ara";
    xkbVariant   = "intl-unicode,,,qwerty";

    ### TODO doc
    ### https://nixos.org/manual/nixos/stable/index.html#custom-xkb-layouts
    ### modifications require to
    ### switch and
    ### systemctl restart display-manager.service
    ### temporaryly setting a layout (apply a safty-net first):
    ### setxkbmap -v 10 us
    ### setxkbmap -v 10 custom-deva
    ### new layouts:
    ### https://www.x.org/releases/current/doc/xorg-docs/input/XKB-Enhancing.html#Defining_New_Layouts
    ### https://wiki.archlinux.org/title/X_keyboard_extension#Basic_examples
    extraLayouts = {
      custom-deva = {
        description = "InScript:devanagari with fixed toggle option";
        languages = [ "hin" ];
        symbolsFile = ./layouts/symbols/deva;
      };
    };



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
### setxkbmap -layout "us" -option ""
### setxkbmap -layout "us" -option ""&& setxkbmap -model "logicda" -layout "us,ru,custom-deva,ara" -variant "intl-unicode,,,qwerty" -option "ctrl:swap_lalt_lctl,grp:alt_space_toggle,numpad:mac"

### available layouts: cd /run/current-system/sw/share/X11/xkb/symbols

### available values
### bat $(sudo nix-build --no-out-link '<nixpkgs>' -A xkeyboard_config)/etc/X11/xkb/rules/base.lst

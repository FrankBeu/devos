{ config, pkgs, ... }:
{
  ### TODO needs home.profiles.clipmenu
  home = {
    ### TODO nec or will be installed automatically with plugins
    packages = with pkgs; [
      # rofi
      # (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
      rofi-calc
      rofi-emoji
      rofi-file-browser
      rofi-menugen
      rofi-mpd
      rofi-pass
      rofi-power-menu
      rofi-systemd
      rofi-vpn
      # rofimoji
      surfraw
    ];
    ### TODO commands YAGNI?? which one
    # file.".config/rofi/cmds"             .source =  ./cmds;
  };

  xdg.configFile."i3/config".text = pkgs.lib.mkDefault( pkgs.lib.mkAfter ''
    ${(import ./i3/additional.nix )}
  '' );

  ### TODO not working with age
  xdg.dataFile."rofi/commands/rofiGopass.zsh".source = ./commands/rofiGopass.zsh;

  programs.rofi = {

    enable  = true;

    theme   = import ./themes/theme.rasi.nix { inherit config; };
    # theme = "Arc-Dark";
    # theme = "gruvbox-dark";
    # theme = "solarized";
    # theme = (import ./themes/colors.nix { inherit config theme;});

    cycle   = true;

    extraConfig = {
      case-sensitive      = false;
      columns             = 2;
      disable-history     = false;
      # disable-history     = true;
      # display-drun        = "Programs";
      drun-display-format = "{name}";
      # drun-match-fields   = "name";
      drun-show-actions   = true;
      # drun-url-launcher   = "${pkgs.sway}/bin/swaymsg -- ${pkgs.xdg_utils}/bin/xdg-open";
      hide-scrollbar      = true;
      matching            = "fuzzy";
      # matching            = "normal";
      # modi                = "window,run,ssh,drun";
      modi                = builtins.concatStringsSep "," [ ### check with `rofi -h`
      "window"
      "windowcd"
      "run"
      "ssh"
      "drun"
      "combi"
      "keys"
      "filebrowser"
      "emoji"
      "calc"
      "file-browser-extended"
      ];
      # modi                = "combi";
      # combi-modi          = "run,ssh,drun";
      combi-modi          = builtins.concatStringsSep "," [
        "window"
        "windowcd"
        "run"
        "ssh"
        "drun"
        # "keys"
        # "filebrowser"
        # "emoji"
        # "calc"
        # "file-browser-extended"
      ];
      # modi                = "drun,run";
      # modi                = "drun,run,ssh";
      # modi                = "run,drun,ssh";
      # modi                = "run,ssh,drun";
      # modi                = "window,drun,run,ssh,combi";
      # run-command         = "${pkgs.sway}/bin/swaymsg exec -- {cmd}";
      # show-icons          = false;
      show-icons          = true;
      sort                = true;
      sorting-method      = "fzf";

      #######################################################################
      terminal                   = "alacritty";
      ssh-command                = "{terminal} -e {ssh-client} {host}";
      ssh-client                 = "ssh";
      drun-match-fields          = "name,generic,exec,categories";
      sidebar-mode               = true;
      parse-hosts                = false;
      parse-known-hosts          = true;
      separator-style            = "none";

      fullscreen                 = false;
      display-drun               = "drun";
      # max-history-size         = 25;
      combi-hide-mode-prefix     = true;
      # pid                      = "/run/user/1000/rofi.pid";*/
      #	display-window           = ; ###??
      #	display-windowcd         = ; ###??
      #	display-run              = ; ###??
      #	display-ssh              = ; ###??
      #	display-drun             = ; ###??
      #	display-combi            = ; ###??
      #	display-keys             = ; ###??
      kb-accept-alt              = "Shift+Return";
      kb-accept-custom           = "Control+Return";
      # kb-cancel                = "Escape,Control+g,Control+bracketleft";
      kb-cancel                  = "Escape,Control+g,Control+bracketleft,Super+Escape";
      kb-clear-line              = "Control+w";
      kb-custom-10               = "Alt+0";
      kb-custom-11               = "Alt+exclam";
      kb-custom-12               = "Alt+at";
      kb-custom-13               = "Alt+numbersign";
      kb-custom-14               = "Alt+dollar";
      kb-custom-15               = "Alt+percent";
      kb-custom-16               = "Alt+dead_circumflex";
      kb-custom-17               = "Alt+ampersand";
      kb-custom-18               = "Alt+asterisk";
      kb-custom-19               = "Alt+parenleft";
      kb-custom-1                = "Alt+1";
      kb-custom-2                = "Alt+2";
      kb-custom-3                = "Alt+3";
      kb-custom-4                = "Alt+4";
      kb-custom-5                = "Alt+5";
      kb-custom-6                = "Alt+6";
      kb-custom-7                = "Alt+7";
      kb-custom-8                = "Alt+8";
      kb-custom-9                = "Alt+9";
      kb-delete-entry            = "Shift+Delete";
      kb-move-char-back          = "Left,Control+b";
      kb-move-char-forward       = "Right,Control+f";
      kb-move-end                = "Control+e";
      kb-move-front              = "Control+a";
      kb-move-word-back          = "Alt+b";
      kb-move-word-forward       = "Alt+f";
      kb-page-next               = "Page_Down";
      kb-page-prev               = "Page_Up";
      kb-primary-paste           = "Control+V,Shift+Insert";
      kb-remove-char-back        = "BackSpace,Control+h";
      kb-remove-char-forward     = "Delete,Control+d";
      kb-remove-to-sol           = "Control+u";
      kb-remove-word-back        = "Control+Alt+h,Control+BackSpace";
      kb-remove-word-forward     = "Control+Alt+d";
      ### kb-row-first           = "Home,KP_Home";   ### REFERENCE
      ### kb-row-last            = "End,KP_End";     ### REFERENCE
      kb-row-left                = "Control+Page_Up";
      kb-row-right               = "Control+Page_Down";
      ### kb-row-select          = "Control+space";  ### REFERENCE
      kb-row-tab                 = "Tab";
      kb-screenshot              = "Alt+S";
      kb-secondary-paste         = "Control+v,Insert";
      kb-select-10               = "Super+0";
      kb-select-1                = "Super+1";
      kb-select-2                = "Super+2";
      kb-select-3                = "Super+3";
      kb-select-4                = "Super+4";
      kb-select-5                = "Super+5";
      kb-select-6                = "Super+6";
      kb-select-7                = "Super+7";
      kb-select-8                = "Super+8";
      kb-select-9                = "Super+9";
      kb-toggle-case-sensitivity = "grave,dead_grave";
      kb-toggle-sort             = "Alt+grave";
      me-accept-custom           = "Control+MouseDPrimary";
      me-accept-entry            = "MouseDPrimary";
      me-select-entry            = "MousePrimary";
      ml-row-down                = "ScrollDown";
      ml-row-left                = "ScrollLeft";
      ml-row-right               = "ScrollRight";
      ml-row-up                  = "ScrollUp";

      ### jkl;
      kb-accept-entry            = "Control+m,Return,KP_Enter,Super+semicolon";
      kb-remove-to-eol           = "Control+k";
      kb-row-select              = "Super+space";

      kb-mode-previous           = "Shift+Left,Control+ISO_Left_Tab,Super+J";
      kb-row-up                  = "Up,Control+p,ISO_Left_Tab,Super+k";
      kb-row-down                = "Down,Control+n,Super+l";
      kb-mode-next               = "Shift+Right,Control+Tab,Super+colon";

      kb-row-first               = "Home,KP_Home,Super+K";
      kb-row-last                = "End,KP_End,Super+L";
    };

    ### TODO currently in theme
    font = "RobotoMono 20";
    # font = ''"Roboto 20"'';
    # font = "Iosevka 14";
    # font = "JetBrainsMono Nerd Font 12";
    # font = "Iosevka Term 14";
    # font = "Fira Code Retina 10";

    # location = "top";
    location = "center";

    # package = pkgs.rofi-wayland;

    ### TODO https://github.com/carnager/rofi-pass
    ### TODO use TESSEN instead https://github.com/ayushnix/tessen afterWayland
    # pass = {
      #   enable      = true;
      #   extraConfig = "";
      #   stores      = [
        #   "~/.local/share/gopass/stores/k8s"
        #   "~/.local/share/gopass/stores/root"
        #   "~/.local/share/gopass/stores/thesym.site"
        #   ];
        # };

        ### TODO how to access, configure, (cf. pkgs)use:
        plugins = with pkgs; [
          rofi-emoji
          rofi-calc
          rofi-file-browser
        ];

        # terminal = config.wayland.windowManager.sway.config.terminal;
        terminal = "${pkgs.alacritty}/bin/alacritty";

        xoffset = 10;

        yoffset = 10;

  };
}
### TODO color, cleanup
### keybindings: i3 mode like dunst
### TODO completion for program with file; keybindings
### select chromium; CTRL-L opens filechooser; TODO configure
### check font nerdfont.override; available for Roboto? Make globally configurable
### TODO run comand from cli: check for Warnings: missing options in theme
### (process:1823031): XrmOptions-WARNING **: 15:01:29.061: Option: columns is not found.
### (process:1823031): XrmOptions-WARNING **: 15:01:29.061: Option: fullscreen is not found.
### (process:1823031): XrmOptions-WARNING **: 15:01:29.061: Option: hide-scrollbar is not found.
### (process:1823031): XrmOptions-WARNING **: 15:01:29.061: Option: separator-style is not found.
### emojis are in clipboard after selection
### `rofi -show keys` show configured keybindings




#############################################################################
#############################################################################

### for colors.nix
# let
  #   theme = {
    #     font1 = "VictorMono Nerd Font Mono:pixelsize=15";
    #     font2 = "JoyPixels:pixelsize=20";
    #     cursorshape = "6";
    #     wallpaper = "flower.jpg";

    #     dbg = "121212";  ###  "#121212";
    #     lbg = "18181f";  ###  "#18181f";
    #     ###   #
    #     fg  = "d6c2c3";  ###  "#d6c2c3";
    #     bg  = "0f0f12";  ###  "#0f0f12";
    #     cc  = "d6c2c3";  ###  "#d6c2c3";
    #     c0  = "0f0f12";  ###  "#0f0f12";
    #     c1  = "7B3B4A";  ###  "#7B3B4A";
    #     c2  = "3a655e";  ###  "#3a655e";
    #     c3  = "7c8e32";  ###  "#7c8e32";
    #     c4  = "494da1";  ###  "#494da1";
    #     c5  = "9b4fbf";  ###  "#9b4fbf";
    #     c6  = "39d4d4";  ###  "#39d4d4";
    #     c7  = "d6c2c3";  ###  "#d6c2c3";
    #     ###   #
    #     c8  = "958788";  ###  "#958788";
    #     c9  = "ff6464";  ###  "#ff6464";
    #     c10 = "527670";  ###  "#527670";
    #     c11 = "8d9d4a";  ###  "#8d9d4a";
    #     c12 = "6063a9";  ###  "#6063a9";
    #     c13 = "a265bf";  ###  "#a265bf";
    #     c14 = "5dd4d4";  ###  "#5dd4d4";
    #     c15 = "f8e1e2";  ###  "#f8e1e2";

    ### own colors for color.nix (not finished)

    #     # black0:		#1A171B;
    #     # black1:		#252228;
    #     # black2:		#29262C;
    #     # black3:		#2E2A31;
    #     # gray0:		#BCBABE;
    #     # gray1:		#C4CBD4 ;
    #     # color0:		#AF3A03;
    #     # color1:		#D8137F;
    #     # color2:		#01ACFF;

    #     # colorBorder:        @color0;

    #     # foreground:		#ffeedd;
    #     # backlight:		#ccffeedd;
    #     # background-color:  transparent;
    #     # dark:		#1c1c1c;

    #     # /* BLACK */
    #     # black:		#3d352a;
    #     # lightblack:		#554444;
    #     # tlightblack:	#554444cc;

    #     # /* RED */
    #     # red:		#cd5c5c;
    #     # lightred:		#cc5533;

    #     # /* GREEN */
    #     # green:		#86af80;
    #     # lightgreen:	#88cc22;

    #     # /* YELLOW */
    #     # yellow:		#e8ae5b;
    #     # lightyellow:	#ffa75d;

    #     # /* BLUE */
    #     # blue:		#6495ed;
    #     # lightblue:		#87ceeb;

    #     # /* MAGENTA */
    #     # magenta:		#deb887;
    #     # lightmagenta:	#996600;

    #     # /* CYAN */
    #     # cyan:		#b0c4de;
    #     # tcyan:		#ccb0c4de;
    #     # lightcyan:		#b0c4de;

    #     # /* WHITE */
    #     # white:		#bbaa99;
    #     # lightwhite:		#ddccbb;

    #     # /* BOLD, ITALIC, UNDERLINE */
    #     # highlight:     underline bold #ffffff;

    #     # transparent: rgba(0,0,0,0);
    #     # /* font: "Source Code Pro 18"; */
    #     # font: "Roboto 20";



    #   };
    # in
    #############################################################################
    ### DRACULA

    /**
    # * Base16 Dracula ROFI Color theme
    # *
    # * Authors
    # *  Scheme: Mike Barkmin (http://github.com/mikebarkmin) based on Dracula Theme (http://github.com/dracula)
    # *  Template: Jordi Pakey-Rodriguez (https://github.com/0xdec), Andrea Scarpino (https://github.com/ilpianista)
    # */

    # * {
      # red:                         rgba ( 234, 81, 178, 100 % );
      # blue:                        rgba ( 98, 214, 232, 100 % );
      # lightfg:                     rgba ( 241, 242, 248, 100 % );
      # lightbg:                     rgba ( 58, 60, 78, 100 % );
      # foreground:                  rgba ( 233, 233, 244, 100 % );
      # background:                  rgba ( 40, 41, 54, 100 % );
      # background-color:            rgba ( 40, 41, 54, 0 % );
      # separatorcolor:              @foreground;
      # border-color:                @foreground;
      # selected-normal-foreground:  @lightbg;
      # selected-normal-background:  @lightfg;
      # selected-active-foreground:  @background;
      # selected-active-background:  @blue;
      # selected-urgent-foreground:  @background;
      # selected-urgent-background:  @red;
      # normal-foreground:           @foreground;
      # normal-background:           @background;
      # active-foreground:           @blue;
      # active-background:           @background;
      # urgent-foreground:           @red;
      # urgent-background:           @background;
      # alternate-normal-foreground: @foreground;
      # alternate-normal-background: @lightbg;
      # alternate-active-foreground: @blue;
      # alternate-active-background: @lightbg;
      # alternate-urgent-foreground: @red;
      # alternate-urgent-background: @lightbg;
      # }

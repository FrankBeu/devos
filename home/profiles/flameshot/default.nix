{config, pkgs, variables, ...}:
let
  inherit (config.home) username;
in
{
  services.flameshot.enable = true;

  xdg.configFile."i3/config".text = pkgs.lib.mkDefault( pkgs.lib.mkAfter ''
    ${(import ./i3/additional.nix )}
  '' );

  home = {
    shellAliases = {
      kyfl = "keysFlameshot";
    };

    file.".local/bin/keysFlameshot".source = ./keysFlameshot.zsh;

    ### TODO: color from Theme
    ### Keybindings for Colon, <, >, ? are not working
    ### config is reloaded automatically
    file.".config/flameshot/flameshot.ini".text = ''
      │[General]
      allowMultipleGuiInstances=false
      antialiasingPinZoom=true
      autoCloseIdleDaemon=false
      buttons=@Variant(\0\0\0\x7f\0\0\0\vQList<int>\0\0\0\0\x17\0\0\0\0\0\0\0\x1\0\0\0\x2\0\0\0\x3\0\0\0\x4\0\0\0\x5\0\0\0\x6\0\0\0\x12\0\0\0\xf\0\0\0\x16\0\0\0\x13\0\0\0\a\0\0\0\b\0\0\0\t\0\0\0\x10\0\0\0\n\0\0\0\v\0\0\0\x17\0\0\0\xe\0\0\0\f\0\0\0\x11\0\0\0\x14\0\0\0\x15)
      checkForUpdates=false
      contrastOpacity=188
      contrastUiColor=#270032
      copyAndCloseAfterUpload=true
      copyPathAfterSave=true
      disabledTrayIcon=false
      drawColor=#800080
      drawFontSize=7
      drawThickness=1
      filenamePattern=%F_%H-%M
      ignoreUpdateToVersion=
      keepOpenAppLauncher=false
      predefinedColorPaletteLarge=true
      saveAfterCopy=true
      saveAsFileExtension=.png
      savePath=/home/${username}/PICTURES/flameshot
      savePathFixed=true
      showDesktopNotification=true
      showHelp=true
      showSidePanelButton=true
      showStartupLaunchMessage=false
      startupLaunch=false
      uiColor=#740096
      uploadWithoutConfirmation=false
      useJpgForClipboard=true
      userColors=picker, #800000, #ff0000, #ffff00, #00ff00, #008000, #00ffff, #0000ff, #ff00ff, #800080

      [Shortcuts]
      TYPE_ACCEPT=
      TYPE_ARROW=Shift+K
      TYPE_CIRCLE=Shift+H
      TYPE_CIRCLECOUNT=Shift+N
      TYPE_COMMIT_CURRENT_TOOL=Ctrl+Return
      TYPE_COPY=Space
      TYPE_DRAWER=Shift+L
      TYPE_EXIT=Ctrl+Q
      TYPE_IMAGEUPLOADER=
      TYPE_INVERT=Shift+I
      TYPE_MARKER=Shift+M
      TYPE_MOVESELECTION=1
      TYPE_MOVE_DOWN=L
      TYPE_MOVE_LEFT=J
      TYPE_MOVE_RIGHT=";"
      TYPE_MOVE_UP=K
      TYPE_OPEN_APP=2
      TYPE_PENCIL=Shift+P
      TYPE_PIN=3
      TYPE_PIXELATE=Shift+O
      TYPE_RECTANGLE=Shift+U
      TYPE_REDO=8
      TYPE_RESIZE_DOWN=6
      TYPE_RESIZE_LEFT=4
      TYPE_RESIZE_RIGHT=.
      TYPE_RESIZE_UP=5
      TYPE_SAVE=Return
      TYPE_SELECTION=Shift+J
      TYPE_SELECTIONINDICATOR=
      TYPE_SELECT_ALL=0
      TYPE_SIZEDECREASE=-
      TYPE_SIZEINCREASE="="
      TYPE_TEXT=Shift+Y
      TYPE_TOGGLE_PANEL=Tab
      TYPE_UNDO=7
    '';
  };
}

### keybindingsViewer
### TODO modularize
### TODO use variables - used for the actual keybindings and the viewer so both can be synced
### TODO dissolve dependency on nixos.profiles.bat
### TODO colorize

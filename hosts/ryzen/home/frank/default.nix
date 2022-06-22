{ self
, config
, inputs
, profiles
, suites
, variables
, ...
}:
let
  inherit (config.home) username;

  customSchemes   = (import ../../../../nixos/profiles/customthemes);
  nixColorSchemes = inputs.nix-colors.colorSchemes;
in
{
  imports = [
    ../../variables

    profiles.alacritty
    profiles.bat
    profiles.browser.chromium
    profiles.browser.firefox.main
    profiles.browser.firefox.orgCapture
    profiles.browser.firefox.tridactyl
    profiles.clipmenu
    profiles.directoryStructure
    profiles.direnv
    profiles.display.cursor
    profiles.display.i3
    profiles.dotLocal
    profiles.editor.emacs
    profiles.exa
    profiles.filemanager.ranger
    profiles.flameshot
    profiles.git
    # profiles.i18n.fcitx         ### kills emacs
    profiles.manualActions
    profiles.notification.dunst
    profiles.pistol
    profiles.ripgrep
    profiles.rofi
    profiles.security.age
    profiles.security.gocryptfs
    profiles.security.gopass
    profiles.security.sops
    profiles.security.ssh
    profiles.security.summon
    profiles.shell.nushell
    profiles.stateVersion
    profiles.tools.nixTools

    # inputs.nix-colors.homeManagerModule
  ];

  colorscheme = self.lib.colorscheme.loadColorScheme customSchemes nixColorSchemes variables.users.${username}.currentColorSchemeName;
}

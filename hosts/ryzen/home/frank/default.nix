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
    profiles.browser.chromium
    profiles.clipmenu
    profiles.direnv
    profiles.display.i3
    profiles.dotLocal
    profiles.editor.emacs
    profiles.exa
    profiles.filemanager.ranger
    profiles.git
    # profiles.i18n.fcitx         ### kills emacs
    profiles.ripgrep
    profiles.stateVersion

    # inputs.nix-colors.homeManagerModule
  ];

  colorscheme = self.lib.colorscheme.loadColorScheme customSchemes nixColorSchemes variables.users.${username}.currentColorSchemeName;
}

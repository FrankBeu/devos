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
    profiles.direnv
    profiles.display.i3
    profiles.editor.emacs
    profiles.filemanager.ranger
    profiles.git
    # profiles.i18n.fcitx         ### kills emacs

    # inputs.nix-colors.homeManagerModule
  ];

  colorscheme = self.lib.colorscheme.loadColorScheme customSchemes nixColorSchemes variables.users.${username}.currentColorSchemeName;
}

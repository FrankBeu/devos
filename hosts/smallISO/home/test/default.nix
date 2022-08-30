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
    profiles.browser.defaultBrowser
    profiles.browser.firefox.main
    profiles.browser.firefox.tridactyl
    profiles.display.cursor
    profiles.display.i3
    profiles.dotLocal
    profiles.rofi
    profiles.stateVersion
  ] ++
  suites.zsh ++
  [];

  colorscheme = self.lib.colorscheme.loadColorScheme customSchemes nixColorSchemes variables.users.${username}.currentColorSchemeName;
}

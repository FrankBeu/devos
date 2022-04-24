{ self
, inputs
, variables
, profiles
, ...
}:
let
  customSchemes   = (import ../../nixos/profiles/customthemes);
  nixColorSchemes = inputs.nix-colors.colorSchemes;
  inherit variables;
in
{
  home-manager.users.${variables.mainUser.name} = { inputs, profiles, suites, ... }: {
    imports = [
      ./variables

      profiles.alacritty
      profiles.direnv
      profiles.display.i3
      profiles.editor.emacs
      profiles.filemanager.ranger
      profiles.git
      profiles.i18n.fcitx

      # inputs.nix-colors.homeManagerModule
    ];

    colorscheme = self.lib.colorscheme.loadColorScheme customSchemes nixColorSchemes variables.currentColorSchemeName;
  };
}

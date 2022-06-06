{ config
, inputs
, profiles
, self
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
      # inputs.nix-colors.homeManagerModule
    ]
    ################################################################################################
    ### DEBUG
    ++ [
    ]
    ################################################################################################
    ;

    colorscheme = self.lib.colorscheme.loadColorScheme customSchemes nixColorSchemes variables.users.${username}.currentColorSchemeName;
}

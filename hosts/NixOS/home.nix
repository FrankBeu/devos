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
  # variables       = with self; (import ./variables { inherit config; }).variables;  ### prevent 'error: infinite recursion encountered'
in
{
  home-manager.users.${variables.mainUser.name} = { inputs, profiles, suites, variables, ... }: {
    imports = with profiles; [
      ./variables
      # inputs.nix-colors.homeManagerModule

    ]
    ################################################################################################
    ### DEBUG
    ++ [
    ]
    ################################################################################################
    ;

    colorscheme = self.lib.colorscheme.loadColorScheme customSchemes nixColorSchemes variables.currentColorSchemeName;
  };
}

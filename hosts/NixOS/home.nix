{ inputs
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
  home-manager.users.${variables.mainUser.name} = { inputs, profiles, suites, variables, ... }: {
    imports = with profiles; [
      ./variables

      inputs.nix-colors.homeManagerModule

    ]
    ################################################################################################
    ### DEBUG
    ++ [
    ]
    ################################################################################################
    ;

    ### TODO colorscheme = cf. system
  };
}

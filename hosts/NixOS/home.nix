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
      imports = [
        ./variables
        inputs.nix-colors.homeManagerModule
        ];

      ### TODO colorscheme = cf. system
    };
}

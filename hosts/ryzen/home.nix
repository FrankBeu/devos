{ inputs
, lib
, variables
, profiles
, ...
}:
let
  customSchemes   = (import ../../nixos/profiles/customthemes);
  nixColorSchemes = inputs.nix-colors.colorSchemes;
in
{
  home-manager.users.${variables.mainUser.name} = { inputs, profiles, suites, ... }: {
      imports = [
        profiles.direnv
        # profiles.filemanager.ranger
        profiles.git

        inputs.nix-colors.homeManagerModule
        ];

      ### TODO colorscheme = cf. system
    };
}
{ inputs
, lib
, variables
, profiles
, ...
}:
let
  customSchemes   = (import ../../profiles/customthemes);
  nixColorSchemes = inputs.nix-colors.colorSchemes;
in
{
  # home-manager.users.${mainUser} = { inputs, profiles, suites, ... }: {
  home-manager.users.nixos = { inputs, profiles, suites, ... }: {
    imports = [
      profiles.filemanager.ranger

      inputs.nix-colors.homeManagerModule
    ];

    ### TODO colorscheme = cf. system
  };
}

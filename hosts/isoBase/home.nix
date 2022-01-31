{ colorScheme
, inputs
, lib
, mainUser
, profiles
, ...
}:
let
  customSchemes   = (import ../../users/profiles/themes);
  nixColorSchemes = inputs.nix-colors.colorSchemes;
in
{
  home-manager.users.${mainUser} = { inputs, profiles, suites, ... }: {
    imports = [
      profiles.filemanager.ranger
      profiles.colortest

      inputs.nix-colors.homeManagerModule
    ];

    colorscheme =
      let scheme = if lib.hasPrefix "custom-" colorScheme then customSchemes else nixColorSchemes;
      in (builtins.getAttr colorScheme scheme);
  };
}

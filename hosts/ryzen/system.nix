{ inputs
, lib
, profiles
, self
, suites
# , variables
, ...
}:
let
  # customSchemes   = (import ../../profiles/customthemes);
  # nixColorSchemes = inputs.nix-colors.colorSchemes;
in
{
  imports = [
    ./configuration.nix
    profiles.users.root
    ### TODO
    # profiles.users.${mainUser}
    profiles.users.nixos

    # profiles.networking

    profiles.editor.vim
    profiles.filemanager.ranger
  ] ++ suites.base;

  # colorscheme = self.lib.colorscheme.loadColorScheme customSchemes nixColorSchemes variables.currentColorSchemeName;

  environment.variables = {
    EDITOR = "vim";
  };
}

{ inputs
, lib
, profiles
, self
, suites
, variables
, ...
}:
let
  customSchemes   = (import ../../profiles/customthemes);
  nixColorSchemes = inputs.nix-colors.colorSchemes;
in
{
  imports = [
    profiles.users.root                  ### make sure to configure ssh keys
    ### TODO
    # profiles.users.${mainUser}
    profiles.users.test

    # profiles.networking

    profiles.editor.vim
    profiles.filemanager.ranger
  ] ++ suites.base;

  boot.loader.systemd-boot.enable = true;

  colorscheme = self.lib.colorscheme.loadColorScheme customSchemes nixColorSchemes variables.currentColorSchemeName;

  environment.variables = {
    EDITOR = "vim";
  };

  fileSystems."/" = { device = "/dev/disk/by-label/nixos"; };  ### will be overridden by the bootstrapIso instrumentation
}

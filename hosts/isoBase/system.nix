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

  lib             = self.inputs.digga.inputs.nixlib.lib;
  loadColorScheme = (import ../../lib/colorscheme { inherit self lib; }).loadColorScheme;
in
{
  imports = [
    profiles.users.root                  ### make sure to configure ssh keys
    ### TODO
    # profiles.users.${mainUser}
    profiles.users.nixos

    # profiles.networking

    profiles.editor.vim
    profiles.filemanager.ranger
  ] ++ suites.base;

  boot.loader.systemd-boot.enable = true;

  colorscheme = loadColorScheme customSchemes nixColorSchemes variables.currentColorSchemeName;

  environment.variables = {
    EDITOR = "vim";
  };

  fileSystems."/" = { device = "/dev/disk/by-label/nixos"; };  ### will be overridden by the bootstrapIso instrumentation
}

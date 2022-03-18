{ inputs
, lib
, profiles
, self
, suites
, variables
, ...
}:
let
  customSchemes   = (import ../../nixos/profiles/customthemes);
  nixColorSchemes = inputs.nix-colors.colorSchemes;
in
{
  imports = [

    ### FILES
    ./hardware/hardware-configuration.nix          ### include the results of the hardware scan
    ./boot
    ./env
    ./misc
    ./networking


    ### PROFILES
    # profiles.bud ### TODO: not working on tests "error: attribute 'system' missing" cf. https://github.com/divnix/bud/blob/main/module.nix#L73
    profiles.console
    profiles.editor.vim
    profiles.filemanager.ranger
    profiles.i18n
    profiles.networking.dhcp
    profiles.networking.nameserver
    # profiles.networking.wireless
    # profiles.services.printing
    profiles.services.ssh
    profiles.services.xserver
    profiles.sound
    profiles.systemd.sleepDisable
    profiles.timezone.amsterdam


    ### USERS
    profiles.users.root
    ### TODO
    # profiles.users.${mainUser}
    profiles.users.nixos


  ] ++ suites.base;

  colorscheme = self.lib.colorscheme.loadColorScheme customSchemes nixColorSchemes variables.currentColorSchemeName;
}

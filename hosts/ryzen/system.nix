{ inputs
, lib
, profiles
, self
, suites
, ...
}:
let
  customSchemes   = (import ../../nixos/profiles/customthemes);
  nixColorSchemes = inputs.nix-colors.colorSchemes;
  variables       = with self; (import ./variables { inherit config; }).variables;  ### prevent 'error: infinite recursion encountered'
in
{
  imports = [


    ### FILES
    ./hardware/hardware-configuration.nix  ### include the results of the hardware scan
    ./boot
    ./env
    ./misc
    ./networking


    ### PROFILES
    # profiles.bud  ### TODO: not working on tests "error: attribute 'system' missing" cf. https://github.com/divnix/bud/blob/main/module.nix#L73
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
    profiles.tools.network


    ### USERS
    profiles.users.root
    profiles.users.${variables.mainUser.name}


  ] ++ suites.base
    ++ suites.docLocal
  ;

  colorscheme = self.lib.colorscheme.loadColorScheme customSchemes nixColorSchemes variables.currentColorSchemeName;

  ### autologin on console
  # services.getty.autologinUser = "root";
  # services.getty.autologinUser = ${variables.mainUser.name};

}

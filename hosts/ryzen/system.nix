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
    profiles.alacritty
    profiles.bud  ### TODO: not working on tests "error: attribute 'system' missing" cf. https://github.com/divnix/bud/blob/main/module.nix#L73
    profiles.browser.chromium
    profiles.console
    profiles.editor.vim
    profiles.editor.emacs
    profiles.filemanager.ranger
    profiles.i18n.common
    profiles.i18n.fcitx
    profiles.networking.dhcp
    profiles.networking.nameserver.regular
    # profiles.networking.nameserver.secure
    # profiles.services.printing
    # profiles.services.pipewire
    profiles.services.ssh

    profiles.sound
    profiles.systemd.sleepDisable
    profiles.timezone.amsterdam
    profiles.tools.network


    ### USERS
    profiles.users.root
    profiles.users.${variables.mainUser.name}  ### TODO: handle like autologin.mainUser

    ### AUTOLOGIN ON CONSOLE
    # profiles.autologin.mainUser
    # profiles.autologin.root

  ] ++ suites.base
    ++ suites.docLocal

    # ++ suites.gnome
    ++ suites.i3
  ;

  colorscheme = self.lib.colorscheme.loadColorScheme customSchemes nixColorSchemes variables.currentColorSchemeName;

}

{ self
, inputs
, lib
, profiles
, suites
, ...
}:
let
  customSchemes   = (import ../../nixos/profiles/customthemes);
  nixColorSchemes = inputs.nix-colors.colorSchemes;
  variables       = with self; (import ./variables { inherit config; }).variables;  ### prevent 'error: infinite recursion encountered'
in
{
  colorscheme = self.lib.colorscheme.loadColorScheme customSchemes nixColorSchemes variables.currentColorSchemeName;

  imports = [
    ### FILES
    ./system/hardware/hardware-configuration.nix  ### include the results of the hardware scan
    ./system/boot
    ./system/misc
    ./system/networking


    ### PROFILES
    profiles.alacritty
    profiles.bud
    profiles.console
    profiles.documentation
    profiles.editor.emacs
    profiles.editor.vim
    profiles.filemanager.ranger
    profiles.i18n.common
    # profiles.i18n.fcitx
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
    profiles.tools.parted
    profiles.tools.qalculate
    profiles.tools.zathura

    ### AUTOLOGIN ON CONSOLE
    # profiles.autologin.mainUser
    # profiles.autologin.root

    ### DEBUG
    # profiles.systemd.coredump
  ] ++ [
    profiles.users.root
    profiles.users.frank
  ] ++
  suites.base      ++
  suites.docLocal  ++
  suites.i3        ++
  # suites.gnome   ++
  suites.rustTools ++
  [];
}

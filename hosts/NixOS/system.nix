{ inputs
, lib
, profiles
, self
, ...
}:
let
  customSchemes   = (import ../../nixos/profiles/customthemes);
  nixColorSchemes = inputs.nix-colors.colorSchemes;
  ### prevent 'error: infinite recursion encountered'
  variables       = with self; (import ./variables { inherit config; }).variables;
in
{
  ### DO NOT IMPORT ANY OTHER PROFILES OR SUITES
  ### NixOS is only used as test-host
  imports = [
    profiles.users.root
    profiles.users.${variables.mainUser.name}
  ];

  boot.loader = {
    systemd-boot.enable      = true;
    efi.canTouchEfiVariables = true;
  };

  colorscheme = self.lib.colorscheme.loadColorScheme customSchemes nixColorSchemes variables.currentColorSchemeName;

  fileSystems."/" = { device = "/dev/disk/by-label/nixos"; };  ### will be overridden by the bootstrapIso instrumentation

  networking.networkmanager.enable = true;

  ### autologin on console
  # services.getty.autologinUser = "root";
  # services.getty.autologinUser = variables.mainUser.name;
}

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
  ### DO NOT IMPORT ANY OTHER PROFILES OR SUITES
  ### NixOS is only used as test-host
  imports = with profiles; [
    users.root
    users.${variables.mainUser.name}
  ]
  ################################################################################################
  ### DEBUG
  ++ [] ++ suites.debug
  ################################################################################################
  ;


  boot.loader = {
    systemd-boot.enable      = true;
    efi.canTouchEfiVariables = true;
  };

  colorscheme = self.lib.colorscheme.loadColorScheme customSchemes nixColorSchemes variables.currentColorSchemeName;

  fileSystems."/" = { device = "/dev/disk/by-label/nixos"; };  ### will be overridden by the bootstrapIso instrumentation

  networking.networkmanager.enable = true;

}

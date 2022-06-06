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
  ### test is only used as test-host
  imports = [
    profiles.users.root
    profiles.users.test

  ]
  ################################################################################################
  ### DEBUG
  ++ [
  ]
  ++ suites.debug
  # ++ suites.i3
  ################################################################################################
  ;

  # variables.autoLogin = true;

  boot.loader = {
    systemd-boot.enable      = true;
    efi.canTouchEfiVariables = true;
  };

  colorscheme = self.lib.colorscheme.loadColorScheme customSchemes nixColorSchemes variables.currentColorSchemeName;

  fileSystems."/" = { device = "/dev/disk/by-label/nixos"; };  ### will be overridden by the bootstrapIso instrumentation

  networking.networkmanager.enable = true;

  ### use publicly available ssh-key
  environment.etc = {
    "ssh/ssh_host_ed25519_key"    .source = "${self}/secrets/secretKeys/NixOS/id_ed25519";
    "ssh/ssh_host_ed25519_key.pub".source = "${self}/secrets/secretKeys/NixOS/id_ed25519.pub";
  };
}

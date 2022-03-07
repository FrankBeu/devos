{ inputs
, lib
, profiles
, self
, variables
, ...
}:
let
  mainUser = variables.mainUser;

  customSchemes   = (import ../../nixos/profiles/customthemes);
  nixColorSchemes = inputs.nix-colors.colorSchemes;

in
{
  ### DO NOT IMPORT ANY OTHER PROFILES OR SUITES
  ### NixOS is only used as test-host
  imports = [
    ### TODO infinite recursion
    # profiles.users.${variables.mainUser}
    # profiles.users."${mainUser}"
    profiles.users.root
    profiles.users.nixos
  ];

  boot.loader = {
    systemd-boot.enable      = true;
    efi.canTouchEfiVariables = true;
  };

  colorscheme = self.lib.colorscheme.loadColorScheme customSchemes nixColorSchemes variables.currentColorSchemeName;

  fileSystems."/" = { device = "/dev/disk/by-label/nixos"; };  ### will be overridden by the bootstrapIso instrumentation

  networking.networkmanager.enable = true;

  ### autologin on console
  # services.getty.autologinUser = "${variables.mainUser}";
  # services.getty.autologinUser = "${mainUser}";
  # services.getty.autologinUser = "nixos";
}

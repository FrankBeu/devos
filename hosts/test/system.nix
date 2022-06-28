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
    profiles.security.sopsNix
  ] ++ [
    profiles.users.root
    profiles.users.test
  ] ++
  ################################################################################################
  ### DEBUG
  # suites.debug ++
  # suites.i3 ++
  ################################################################################################
  [];

  boot.loader = {
    systemd-boot.enable      = true;
    efi.canTouchEfiVariables = true;
  };

  colorscheme = self.lib.colorscheme.loadColorScheme customSchemes nixColorSchemes variables.currentColorSchemeName;

  fileSystems."/" = { device = "/dev/disk/by-label/nixos"; };  ### will be overridden by the bootstrapIso instrumentation

  networking.networkmanager.enable = true;

  ### make ssh-key available prior to sops-nix
  ### TODO extract to lib for every vm
  system.activationScripts =
    let
      sshKey    = builtins.readFile "${self}/secrets/keys/publiclyAvailable/hosts/test/ssh_host_ed25519_key";
      sshKeyPub = builtins.readFile "${self}/secrets/keys/publiclyAvailable/hosts/test/ssh_host_ed25519_key.pub";
    in
    {
      "1-add-ssh-key" = {
        text = ''
          echo "create ssh-key needed by sops-nix from PUBLICLY AVAILABLE KEY"
          mkdir -p /etc/ssh
          echo "${sshKey}   " > "/etc/ssh/ssh_host_ed25519_key"
          echo "${sshKeyPub}" > "/etc/ssh/ssh_host_ed25519_key.pub"
          chmod 600             "/etc/ssh/ssh_host_ed25519_key"
        '';
      };
    };
}

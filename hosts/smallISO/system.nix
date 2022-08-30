{ self
, inputs
, lib
, pkgs
, profiles
, suites
, ...
}:
let
  hostname        = builtins.baseNameOf (builtins.toString ./.);
  hostBaseName    = lib.removeSuffix "ISO" hostname;
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
    profiles.console
    profiles.currentSystemPackages
    profiles.editor.vim
    profiles.filemanager.ranger
    profiles.fonts
    profiles.i18n.common
    profiles.networking.dhcp.true
    # profiles.networking.nameserver.secure ### TODO
    profiles.shell.prompts.starship
    profiles.shell.zsh
    profiles.sound.pipewire
    profiles.timezone.amsterdam

  ] ++ [
    profiles.users.root
    profiles.users.test
  ] ++
  suites.base       ++
  suites.dnsRegular ++
  suites.i3         ++
  [];

  users.users.test.shell = pkgs.zsh; ### TODO solve where? test-user used in tests must not set shell...

  ### make ssh-key available prior to sops-nix
  ### TODO extract to lib for every vm
  system.activationScripts =
    let
      inherit hostname;
      sshKey    = builtins.readFile "${self}/secrets/keys/secret/hosts/${hostname}/ssh_host_ed25519_key";
      sshKeyPub = builtins.readFile "${self}/secrets/keys/secret/hosts/${hostname}/ssh_host_ed25519_key.pub";
    in
    {
      "1-add-ssh-key" = {
        text = ''
          echo "create ssh-key needed by sops-nix from existing key"
          mkdir -p /etc/ssh
          echo "${sshKey}   " > "/etc/ssh/ssh_host_ed25519_key"
          echo "${sshKeyPub}" > "/etc/ssh/ssh_host_ed25519_key.pub"
          chmod 600 "/etc/ssh/ssh_host_ed25519_key"
        '';
      };
    };
}

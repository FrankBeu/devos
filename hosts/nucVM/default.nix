{ lib
, pkgs
, profiles
, self
, suites
, ...
}:
let
  hostname     = builtins.baseNameOf (builtins.toString ./.);
  hostBaseName = lib.removeSuffix "VM" hostname;
in
{
  imports = [
    ../${hostBaseName}
  ];

  networking.interfaces = pkgs.lib.mkForce {} // { eth0.useDHCP = true; };
  services.qemuGuest.enable = true;  ### TODO ??


  ### TODO check
  nix.extraOptions = pkgs.lib.mkForce ''
    min-free = 536870912
    keep-outputs = true
    keep-derivations = true
  '';

  ### TODO check if the following can be used
  # virtualisation.vmVariant
  # virtualisation.vmVariantWithBootLoader

  ### make ssh-key available prior to sops-nix
  ### TODO extract to lib for every vm
  system.activationScripts =
    let
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

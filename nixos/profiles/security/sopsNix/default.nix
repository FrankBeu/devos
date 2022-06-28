{ self
, config
, pkgs
, ...
}:
let
  inherit (config.networking) hostName;
in
{
  sops = {
    age.sshKeyPaths   = [ "/etc/ssh/ssh_host_ed25519_key" ];
    gnupg.sshKeyPaths = [];
    defaultSopsFile   = "${self}/secrets/hosts/${hostName}/secrets.yaml";
  };

  environment.systemPackages = with pkgs; [
    ssh-to-age
  ];
}

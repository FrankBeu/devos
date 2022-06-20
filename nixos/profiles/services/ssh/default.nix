{ config, lib, variables, ... }:
let
  inherit (config.networking) hostName;
in
{
  services.openssh = {
    enable          = true;
    openFirewall    = true;
    permitRootLogin = "yes";
    hostKeys =
      if variables.publicSSHKeys
      then []
      else [
        { bits = 4096; comment = hostName; path = "/etc/ssh/ssh_host_rsa_key";     rounds = 100; type = "rsa";     }
        {              comment = hostName; path = "/etc/ssh/ssh_host_ed25519_key"; rounds = 100; type = "ed25519"; }
      ];
  };

  # networking.firewall = {
    #   ### Open ports in the firewall.
    #   allowedTCPPorts = [ 22 ];
    # };
}

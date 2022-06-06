{ config, pkgs, ... }:
{
  networking = {
    firewall = {
      ### Open ports in the firewall.
      # # allowedTCPPorts = [ ... ];
      # allowedTCPPorts = [ 22 ];
      # allowedUDPPorts = [ ... ];
      ### Or disable the firewall altogether.
      # enable = false;
    };

    interfaces = {
      enp37s0.useDHCP = true;
      wlp36s0.useDHCP = true;
    };
  };
}

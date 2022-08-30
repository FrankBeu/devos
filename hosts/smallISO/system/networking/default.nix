{ config
, lib
, ...
}:
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
  };
}

# {config, variables, ...}:
{config, ...}:
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

    ### DEVEL: DISABLE the following lines for faster vm-startup
    interfaces = {
      # eth0.useDHCP = true;
      enp37s0.useDHCP = true;
      wlp36s0.useDHCP = true;
    };
  };
}

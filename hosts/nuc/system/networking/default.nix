{ config, pkgs, ... }:
{
  networking = {
    firewall =
      let
        ports2open = [
          22
          80
          443
          4433
          8080
        ];
      in
      {
        ### Open ports in the firewall.
        allowedTCPPorts = ports2open;
        allowedUDPPorts = ports2open;

        ### Or disable the firewall altogether.
        # enable = false;
      };

      interfaces = {
        eno1.useDHCP    = true;
        wlp58s0.useDHCP = true;
      };
      useDHCP = false;
  };
}
